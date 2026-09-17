# Disposable K3s EC2 Proof

This proof creates one isolated VPC and one no-ingress EC2 instance in AWS account `655383751458`, installs a pinned single-node K3s server, runs one bounded Kubernetes Job, collects its outcome locally, and deletes the complete CloudFormation stack.

It is an evidence-producing experiment for `TECHNE-OPS-003`, not a reusable platform, controller or normative specification. The CloudFormation layer is AWS-specific. Everything under `manifests/` is provider-neutral Kubernetes YAML.

## Safety boundary

- Use profile `knowledge-islands-techne` in `eu-west-1` only.
- Stop unless STS returns account `655383751458`.
- Never modify the existing Control Tower VPC.
- Create only stack `ki-techne-ops-003-k3s-proof` and resources tagged `ki-work-item=TECHNE-OPS-003`.
- Expose no inbound port. Systems Manager is the only operator path.
- Give the workload no AWS credential or service-account token.
- Terminate the instance after two hours even if the local runner disappears.
- Keep the total proof cost below US$2.

## Inputs

- Ubuntu Server 24.04 amd64 AMI `ami-0526a6499f6470118`
- K3s `v1.36.4+k3s1`
- `t3.medium`
- `docker.io/library/busybox@sha256:73aaf090f3d85aa34ee199857f03fa3a95c8ede2ffd4cc2cdb5b94e566b11662`
- Disposable VPC `10.88.0.0/24` and subnet `10.88.0.0/25`

## Run

Authenticate the named AWS profile, then run:

```bash
aws sso login --profile knowledge-islands-techne
./-/TECHNE-OPS-003-disposable-k3s-ec2-proof/scripts/run-proof.sh
```

The runner validates the account, template and absence of conflicting proof resources before creating anything. It always attempts stack deletion on exit. A successful run leaves `inventory.json`, Systems Manager invocation evidence, `evidence.json` and `teardown.json` under `results/`.

## Emergency cleanup

If the runner is interrupted, run:

```bash
./-/TECHNE-OPS-003-disposable-k3s-ec2-proof/scripts/destroy.sh
```

Then verify no tagged resource remains:

```bash
aws resourcegroupstaggingapi get-resources \
  --profile knowledge-islands-techne \
  --region eu-west-1 \
  --tag-filters Key=ki-work-item,Values=TECHNE-OPS-003
```

The instance also schedules an instance-initiated shutdown after two hours. CloudFormation reconciliation is still required because instance termination alone does not remove the surrounding stack resources.

## Evidence

The Job emits one deterministic JSON outcome and proves it cannot reach EC2 instance metadata. The collector records the immutable image digest, K3s version, Job status, pod status, manifest hashes, target descriptor and Systems Manager command evidence before teardown.

Cluster state is intentionally disposable. A run is successful only when evidence exists locally and post-teardown inventory confirms that the proof VPC, subnet, route, internet gateway, instance, volume, security group and IAM resources are absent.

The completed and failed-attempt evidence is indexed in [the proof results](results/README.md).

## Local verification

```bash
shellcheck ./-/TECHNE-OPS-003-disposable-k3s-ec2-proof/scripts/*.sh
bash -n ./-/TECHNE-OPS-003-disposable-k3s-ec2-proof/scripts/*.sh
aws cloudformation validate-template \
  --profile knowledge-islands-techne \
  --region eu-west-1 \
  --template-body file://-/TECHNE-OPS-003-disposable-k3s-ec2-proof/cloudformation/stack.yaml
```

The local `kubectl` has no live API discovery endpoint, so the runner performs server-side dry runs for every manifest on the disposable K3s API before applying them.
