---
note_type: stream-proposal
id: TECHNE-OPS-007
area: OPS
title: Prove Kubernetes controller and registered execution targets
aliases:
  - Persistent Controller and Target Registry Proposal
  - Kubernetes Controller Proof
theme: operational-tooling
horizon: next
status: in-progress
priority: high
dependencies: []
blocks: []
blocked_by: []
baseline_ref: a8ae843cce01b0c332fdbfbb1fa030614620ad26
created_at: 2026-09-16T21:59:23Z
updated_at: 2026-09-19T10:50:00Z
---

# Prove Kubernetes Controller and Registered Execution Targets

## Goal

Prove one long-running personal controller can run as a single-replica Kubernetes Deployment, poll Telegram outbound, register one or more execution clusters and dispatch bounded Kubernetes Jobs without making Telegram, worker nodes or cluster-local state the durable authority for work.

## Context

[[AI Execution Fabric]], [[Engineering Estate]] and [[Techne Fabric Execution Contract]] distinguish a persistent controller from replaceable execution targets and disposable task environments. The accepted `TECHNE-OPS-003` proof demonstrated one bounded Job on disposable K3s/EC2 and retained its evidence under `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/results/`.

The selected topology is one controller cluster plus zero or more registered execution clusters. The controller cluster is retained after the proof as useful shared capacity for follow-on work but does not require EKS, high availability or durable cluster state. It may register itself as the first local execution target. Additional targets may be persistent, independently managed or disposable, and registration does not imply the controller provisioned or owns them.

The controller runs as a Kubernetes Deployment rather than a Job. Execution work runs as deterministic Kubernetes Jobs. The initial proof uses one persistent single-node K3s controller cluster and then adds one disposable K3s target to demonstrate the `1 + N` boundary.

## Boundary

Use a single controller replica with the `Recreate` deployment strategy. Do not add leader election, horizontal availability, an operational journal, SQLite, another database or a workflow engine. Reconstruct operational state from Telegram's confirmed update boundary, deterministic execution identities, Kubernetes objects and retained result evidence.

Use outbound Telegram Bot API long polling. Expose no webhook or public controller endpoint. Admit commands only from an explicit operator identity allowlist. Acknowledge or reject every admitted command visibly. Derive each execution identity and Job name deterministically from the Telegram update and target identity so replay reconciles rather than creates duplicate work.

Keep the controller implementation dependency-free using the Python standard library. Mount the proof source through a ConfigMap into a digest-pinned Python container. Do not create a virtual environment, package manifest, downloaded dependency tree, vendored library or `node_modules` directory.

Keep controller-cluster and target-cluster authority separate. The controller receives only the Kubernetes permissions required to create, observe, read logs from and cancel Jobs in one execution namespace. Workload Jobs receive no Telegram token, controller credential, cloud credential or service-account token. An external target receives the same restricted namespace boundary through a time-bounded service-account token and private API connectivity.

Do not make the controller provision or destroy registered clusters. Provider adapters may create capacity separately. For the live AWS proof, expose the disposable target's Kubernetes API only on private networking and only to the controller host security group; do not expose SSH, the Kubernetes API or the controller publicly.

Retain the controller cluster after successful proof and tear down the disposable target. Use one `t3.medium` controller instance with a US$40 monthly target and US$50 monthly ceiling, including its public IPv4 address, EBS volume and ordinary proof traffic. Use the existing `@kitteth_bot` identity only after read-only preflight confirms its Bot API identity and that no active webhook or other integration would be displaced. Capture and confirm the numeric operator identity from the first private preflight update. Create the Kubernetes Secret from operator-supplied local input without writing the token to Git, shell history or retained evidence.

## Current state

### Planning baseline

The repository contains the accepted `TECHNE-OPS-003` K3s/EC2 proof package and evidence but no controller implementation, Telegram integration or registered-target client. AWS account `655383751458`, profile `knowledge-islands-techne` and region `eu-west-1` were validated during that proof; their current authentication and resource state must be rechecked before reuse.

Official Telegram behaviour permits a client to confirm updates by advancing `getUpdates.offset` beyond the highest received update. A crash between dispatch and confirmation can replay an update, so deterministic Kubernetes object names and reconciliation are the proof's idempotency boundary. Kubernetes supports REST API access, namespaced RBAC, projected local service-account tokens and deterministic object names without a language client library.

No controller cluster currently exists. The existing `@kitteth_bot` identity is selected for the controller, but its token has not been supplied and its webhook or polling state has not been inspected. Controller retention, the `t3.medium` instance class, the US$40 monthly target, the US$50 monthly ceiling and the local Kubernetes Secret delivery path are approved. The numeric operator identity will be captured and confirmed during private preflight.

### Live position

The retained K3s controller stack now runs on instance `i-09b1ed39bc4735eda` in AWS account `655383751458`, region `eu-west-1`. K3s reports Secret encryption enabled at rotation stage `reencrypt_finished`, with matching server hashes. The controller source uploaded from the local `ki-techne-tools` commit matches SHA-256 `4efbca43184429c22265de6f0cb255c2437667f8599dfe555742752020a2f5c5`.

No Telegram Secret or controller Deployment exists in the `techne-controller` namespace. `TECHNE-OPS-008` is done: the implementation is published in `ki-techne-tools`, the retained host package checksum matches that source, K3s Secret encryption is fully re-encrypted, and Techne Principal's duplicate executable tree has been retired. Live credential admission and dispatch proof may now resume without recreating the controller instance or VPC security group.

## Steps

- [x] Define the controller command, registered-target, execution and evidence envelopes using the accepted `TECHNE-OPS-003` fixtures as non-normative inputs.
- [x] Create a dependency-free proof package with Python controller source, Kubernetes manifests, synthetic Telegram fixtures, local and remote target descriptors, AWS adapters, lifecycle scripts and a retained results area.
- [x] Implement outbound Telegram long polling, operator allowlisting, command parsing, deterministic execution identities, visible acknowledgement and confirmation-offset handling without persistent local state.
- [x] Implement direct Kubernetes REST calls for Job creation, observation, log retrieval and cancellation using JSON resources, TLS verification and target-scoped bearer tokens.
- [ ] Deploy the controller as one `Recreate` Deployment on a persistent single-node K3s cluster and register that cluster locally through a restricted in-cluster ServiceAccount.
- [ ] Prove local dispatch, successful outcome return, rejected unauthorised input, duplicate-update reconciliation, controller Pod restart and failed-Job reporting.
- [ ] Provision one independently disposable K3s target with private API access from the controller host only, issue a time-bounded namespace-scoped token and register it without granting cluster-admin or provider credentials.
- [ ] Prove remote dispatch, observation, evidence return, cancellation, controller restart reconciliation, target deregistration and target teardown without affecting the controller.
- [ ] Record infrastructure inventory, security boundaries, aggregate cost and direct post-teardown checks; retain the approved controller stack and remove the disposable target and every other unapproved resource.
- [ ] Review whether any target, execution or evidence shape is stable enough for separately governed specification work; keep unproven fixtures non-normative.

## Files touched

- `-/TECHNE-OPS-007-kubernetes-controller-proof/README.md`
- `-/TECHNE-OPS-007-kubernetes-controller-proof/controller/controller.py`
- `-/TECHNE-OPS-007-kubernetes-controller-proof/cloudformation/controller-stack.yaml`
- `-/TECHNE-OPS-007-kubernetes-controller-proof/cloudformation/target-stack.yaml`
- `-/TECHNE-OPS-007-kubernetes-controller-proof/manifests/controller/`
- `-/TECHNE-OPS-007-kubernetes-controller-proof/manifests/execution/`
- `-/TECHNE-OPS-007-kubernetes-controller-proof/fixtures/`
- `-/TECHNE-OPS-007-kubernetes-controller-proof/scripts/`
- `-/TECHNE-OPS-007-kubernetes-controller-proof/results/`
- `Streams/Roadmap/TECHNE-OPS-007-define-long-running-controller-and-registered-execution-targets.md`
- Canonical Techne notes only if implementation evidence changes an accepted boundary

## Verify

- Compile the controller source without writing bytecode or creating cache directories.
- Run dependency-free unit tests against synthetic Telegram and Kubernetes API fixtures with network access disabled.
- Validate every Kubernetes resource through client-side and live server-side dry runs.
- Validate both CloudFormation templates against account `655383751458` in `eu-west-1` after asserting the authenticated account.
- Confirm the controller has one replica, uses `Recreate`, exposes no Service or Ingress, accepts only the approved operator identity and contains no database or journal configuration.
- Confirm controller RBAC is namespaced and permits only the required Job, Pod status and Pod log operations.
- Confirm workload Jobs receive no controller, Telegram, AWS or Kubernetes service-account credential.
- Confirm a repeated Telegram update resolves to the existing execution identity and never creates a second Job.
- Confirm a controller Pod restart reconstructs in-flight execution state from Kubernetes and completes result reporting.
- Confirm local and remote target Jobs return the same evidence envelope.
- Confirm the remote target API has no public ingress and accepts only controller-originated private traffic with its time-bounded credential.
- Confirm target deletion leaves the retained controller available, tagged and represented in the final infrastructure and cost inventory.
- Confirm direct AWS inventory and CloudFormation checks find no unapproved proof resources after cleanup.
- Confirm no `node_modules`, virtual environment, vendored dependency or Python cache directory exists anywhere in the repository.
- Run `ki repo audit --skill ki-authoring --repo .`, `ki repo audit --skill ki-repo-kb-streams --repo .`, `ki repo audit --skill ki-repo-kb --repo .` and `git diff --check`.

## Dependencies / blocks

Offline implementation and synthetic verification have no unresolved local dependency. Live delivery requires all of the following before provisioning or contacting Telegram:

- Read-only `getMe` and `getWebhookInfo` preflight for `@kitteth_bot`, followed by its token supplied outside Git without displacing an active integration.
- One approved Telegram operator user or chat identity.
- One `t3.medium` controller instance within the approved US$40 monthly target and US$50 monthly ceiling; post-proof controller retention is approved.
- Fresh AWS authentication to account `655383751458` in `eu-west-1` and confirmation that no conflicting controller or target resources exist.
- Review of the time-bounded remote target credential and private Kubernetes API route.

The delivery boundary and live-input procedure are approved. Implementation may proceed from the immutable baseline; live execution must stop if the bot preflight, operator confirmation, AWS authentication, private target credential or cost guard is unavailable or fails.

## Delegation

Keep controller authority, replay semantics, credential boundaries and live infrastructure decisions in one coordinator lane. Isolated source review or fixture validation may be delegated later, but no worker may receive the Telegram token, AWS administrator credentials or unbounded cluster access.

## Documentation impact

### Decision Records

No new Decision Record is required for the proof. A later commitment to a production controller repository, shared durable state, multi-active operation or a stable target-registration protocol may require one.

### Specifications

Target, execution and evidence documents remain non-normative fixtures until both local and remote runs demonstrate a stable common boundary.

### Guides

The proof README must document exact offline testing, secret injection, deployment, target registration, restart reconciliation, emergency cancellation, evidence collection and cleanup procedures.

### Roadmap

This selected Next record is the only immediate controller work. Workflow-engine comparison, agent-framework comparison and Fly.io evaluation remain outside it unless evidence exposes a named capability gap.

## Discussion

### Controller and target topology

The retained controller cluster is the stable home of one controller Deployment and useful shared capacity for follow-on work. It may also be registered as a local target through a restricted ServiceAccount. Each additional cluster is registered independently and exposes a different lifecycle owner without changing the execution contract. The controller dispatches work but does not imply ownership of capacity.

### Restart and replay boundary

Telegram retains unconfirmed updates and forgets earlier updates after the client confirms a higher offset. The controller keeps only an in-memory offset. A crash before confirmation can replay a command; deterministic execution identities, Kubernetes name uniqueness and lookup-before-create convert that replay into reconciliation. The proof intentionally accepts loss of conversational convenience and does not promise durable multi-step workflows.

### Credential boundary

The local target uses a projected, rotating in-cluster ServiceAccount token. The remote disposable target uses a short-lived TokenRequest credential scoped by namespaced RBAC and removed when the target is deregistered or destroyed. Workload Pods set `automountServiceAccountToken: false` and receive no controller secret.

### Primary source entry points

- [Telegram Bot API](https://core.telegram.org/bots/api)
- [Kubernetes controllers](https://kubernetes.io/docs/concepts/architecture/controller/)
- [Kubernetes Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
- [Kubernetes Jobs](https://kubernetes.io/docs/concepts/workloads/controllers/job/)
- [Kubernetes API concepts](https://kubernetes.io/docs/reference/using-api/api-concepts/)
- [Kubernetes service accounts](https://kubernetes.io/docs/concepts/security/service-accounts/)
- [[Techne Fabric Execution Contract]]
- [[AI Execution Fabric]]
- [[Engineering Estate]]
