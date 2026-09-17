# Kubernetes controller proof

This package implements the `TECHNE-OPS-007` proof as one retained, single-node K3s controller cluster plus zero or more registered execution clusters. The controller cluster is also its first execution target. Work is a deterministic Kubernetes Job; controller state is reconstructed from Telegram's confirmation boundary and Kubernetes objects rather than an operational database.

The controller is a one-replica `Recreate` Deployment. It long-polls Telegram as `@kitteth_bot`, admits only one private numeric user/chat pair, and exposes no Service, Ingress, SSH port, webhook, or other public controller endpoint.

## Package boundaries

- `controller/` is a Python standard-library implementation with direct Telegram and Kubernetes HTTPS calls.
- `manifests/controller/` holds the two namespaces, least-privilege RBAC, controller configuration, Deployment and default-deny network policies.
- `manifests/execution/job.example.json` records the deterministic workload envelope.
- `cloudformation/` holds separate retained-controller and disposable-target stacks.
- `scripts/` holds offline checks and bounded AWS, Telegram and cluster operations.
- `fixtures/` are synthetic, non-normative test inputs.
- `results/` accepts only sanitised live-proof evidence.

No package manager, virtual environment, downloaded library tree, vendored dependency or `node_modules` directory is used.

## Replay model

`discover-operator.sh` reports an `initial_offset` one greater than the selected private update. That value is stored with the operator IDs in the Kubernetes Secret. Every controller restart begins polling from the same baseline. Telegram omits already confirmed updates, while an update interrupted before confirmation is delivered again. Its Job name is derived from the original update ID and target ID, so replay observes the existing Job instead of creating a second one. The main polling loop creates Jobs synchronously and observes them in background threads, allowing cancellation while work is active. At startup the controller also lists labelled Jobs on every target and resumes their observation, covering a restart after Telegram has confirmed the dispatch.

Commands are:

- `/targets`
- `/run <target>`
- `/cancel <target> <execution-update-id>`

Cancellation deletes the deterministic Job and is idempotent when it is already absent.

## Offline verification

Run:

```sh
./scripts/check.sh
```

The check compiles without bytecode, runs the unit tests, parses JSON and Kubernetes YAML, runs ShellCheck, and refuses package/cache directories. CloudFormation is validated against AWS immediately before deployment because its intrinsic functions require CloudFormation-aware validation.

## Secret-safe Telegram preflight

Run these commands in a private local terminal. The `read` command prevents the token entering shell history, and the scripts never print it:

```sh
read -rs 'TELEGRAM_BOT_TOKEN?Bot token: '
export TELEGRAM_BOT_TOKEN
./scripts/telegram-preflight.sh
./scripts/discover-operator.sh
```

Send one private message to `@kitteth_bot` if discovery returns no candidate. Confirm the bot username, absence of an active webhook, and the intended numeric user/chat IDs. Record the selected result only in the current process:

```sh
export TELEGRAM_OPERATOR_USER_ID='<selected user_id>'
export TELEGRAM_OPERATOR_CHAT_ID='<selected chat_id>'
export TELEGRAM_INITIAL_OFFSET='<selected initial_offset>'
```

Do not paste these values into chat or commit them. Preflight does not confirm or delete the discovery update.

## Retained controller deployment

The scripts default to AWS account `655383751458`, profile `knowledge-islands-techne`, region `eu-west-1`, and stack `ki-techne-ops-007-controller`. The template admits only `t3.medium`, uses a 16 GiB encrypted gp3 root volume, requires IMDSv2, grants only the SSM managed-instance policy, and has no inbound security-group rules. Its public IPv4 address exists only to give the host outbound internet access.

Authenticate and deploy only after the Telegram preflight passes:

```sh
aws sso login --profile knowledge-islands-techne
./scripts/provision-controller.sh
./scripts/upload-package.sh
```

Then open an SSM session to the reported instance, enter the four Telegram values with silent `read` commands, and run:

```sh
sudo -E /opt/techne-proof/scripts/deploy-on-controller.sh
```

The controller stack is retained after the proof. `destroy-controller.sh` requires the exact stack name in `CONFIRM_DESTROY_CONTROLLER`, making accidental teardown a separate explicit action.

## Disposable target

`provision-target.sh` creates a separately tagged K3s host in the controller VPC. Its Kubernetes API admits port 6443 only from the controller security group, and a two-hour systemd shutdown is a backstop rather than the teardown mechanism. The target must receive a namespace-scoped, time-bounded service-account token before registration; never retain that token or its kubeconfig as evidence.

Provision and upload the access package:

```sh
./scripts/provision-target.sh
./scripts/upload-target-package.sh
```

In an SSM session on the target, run `sudo /opt/techne-proof/scripts/prepare-target.sh`. It creates only the execution namespace, workload ServiceAccount and namespace-scoped controller RBAC, then writes a four-hour token and the public server CA under `/var/lib/ki-target/` with mode `0600`.

Use an interactive, non-recorded transfer to place the CA on the controller and enter the bearer token only at the hidden prompt. On the controller, set the non-secret target details and register it:

```sh
export TARGET_ID=target-001
export TARGET_API_SERVER='https://<target private IP>:6443'
export TARGET_CA_FILE='/path/to/transferred/server-ca.crt'
sudo -E /opt/techne-proof/scripts/register-target-on-controller.sh
```

Do not put the token in an environment assignment, command argument, chat, file in this repository, SSM Run Command output or proof evidence. The registration script stores it only in the controller cluster Secret, restarts the Deployment and waits for readiness.

For restart reconciliation, begin `/run target-001`, restart the controller Pod after the Job exists but before Telegram receives its terminal result, and confirm the replay reports the same `telegram:<update-id>:target-001` identity. For emergency cancellation, send `/cancel target-001 <execution-update-id>` and confirm the deterministic Job is deleted without a second Job being created.

After remote dispatch, cancellation, restart reconciliation and evidence retrieval are proven, run `sudo /opt/techne-proof/scripts/deregister-target-on-controller.sh` on the controller and then run `destroy-target.sh` locally. The latter checks the AWS account and `ki-work-item` stack tag before deletion. Verify the stack, instance and target credential Secret are absent; retaining the controller must not retain the disposable target.

Retain only sanitised resource identifiers, outcome envelopes, timestamps, cost figures and post-teardown inventory in `results/`. Never retain raw Telegram updates, numeric operator IDs, tokens, kubeconfigs or AWS session material.

## Cost guard

The retained controller is constrained to one `t3.medium`, one 16 GiB gp3 volume and one public IPv4 address. The planning target is US$40 per month and the hard planning ceiling is US$50 per month under ordinary proof traffic. This is an architectural guard, not an AWS billing cap; recheck current regional prices before deployment and use an account-level AWS Budget separately if a billing-enforced alert is required.
