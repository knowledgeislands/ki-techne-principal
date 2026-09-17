---
note_type: stream-proposal
id: TECHNE-OPS-003
area: OPS
title: Pioneer disposable K3s agent execution on AWS
aliases:
  - AWS Agent Execution Pioneer Proposal
  - Disposable K3s EC2 Execution Proof
theme: operational-tooling
horizon: next
status: awaiting-review
priority: high
dependencies: []
blocks: []
blocked_by: []
baseline_ref: 1814e88b95c1783be6183c4739779395d92161aa
created_at: 2026-09-08T23:54:53Z
updated_at: 2026-09-17T06:43:47Z
---

# Pioneer Disposable K3s Agent Execution on AWS

## Goal

Prove that one bounded, provider-neutral Kubernetes workload can run on a disposable single-node K3s cluster hosted by one EC2 instance, return its outcome and evidence beyond the cluster, and leave no chargeable proof infrastructure after teardown.

## Context

[[ADR-TECHNE-001-provider-neutral-isolated-agent-execution|ADR-TECHNE-001]] establishes provider-neutral execution and [[Techne Fabric Execution Contract]] defines the information and evidence boundary. The dedicated Techne AWS account is the first remote capacity provider, but a managed EKS control plane adds cost and operating surface that this proof does not need.

K3s can place the Kubernetes control plane, datastore, container runtime and workload capacity on one machine. The cluster, node and cluster-local state are disposable. Durability belongs in the returned work outcome, logs, verification evidence and reconciliation path outside the instance.

The exact AWS target is account `655383751458` through local profile `knowledge-islands-techne` in `eu-west-1`. The account assertion is a safety boundary: provisioning must stop unless `aws sts get-caller-identity` returns that account.

This proof does not implement the persistent personal controller or a registry of execution targets. [[TECHNE-OPS-007-define-long-running-controller-and-registered-execution-targets|TECHNE-OPS-007]] owns that later outcome.

## Boundary

Keep the provider-neutral layer to plain Kubernetes resources, an OCI image selected by immutable digest, bounded inputs and a portable evidence envelope. Keep AWS account identifiers, IAM, EC2, Systems Manager, networking, tags, expiry and teardown entirely inside the provider adapter.

Use one EC2 instance as both K3s server and worker. Use Systems Manager for operator access, expose no inbound SSH or Kubernetes API port, require IMDSv2 and prevent workload pods from reaching instance metadata. Give the instance only the minimum management role; the Kubernetes Job receives no AWS credential.

Do not add EKS, managed node groups, autoscaling, high availability, a load balancer, persistent cluster storage, an external datastore, a queue, a workflow engine or a long-running controller. Do not create package manifests, dependency installations or library directories in this repository. Do not provision until the authenticated account, network, AMI, image digest, cost ceiling, expiry guard and teardown commands have been reviewed.

## Current state

The local machine has AWS CLI, `kubectl`, Helm, `shellcheck` and `jq`. It has no Docker, Podman, Kind or K3d runtime, so client-side manifest validation is available but a local live-cluster run is not currently available.

The `knowledge-islands-techne` SSO session is authenticated and `aws sts get-caller-identity` confirms account `655383751458` in `eu-west-1`. The account has no running or stopped EC2 instance, no resource tagged for `TECHNE-OPS-003`, and a 256-vCPU standard On-Demand quota.

The account has no default VPC. Its only VPC is the Control Tower VPC, whose three subnets are private and have no internet or NAT gateway; this proof must not modify or depend on it. The proof stack will therefore own one disposable `10.88.0.0/24` VPC, public subnet, internet gateway and route alongside the instance, then delete them together.

The selected launch inputs are Ubuntu Server 24.04 amd64 AMI `ami-0526a6499f6470118` from Canonical public parameter version 76, K3s `v1.36.4+k3s1`, and `docker.io/library/busybox@sha256:73aaf090f3d85aa34ee199857f03fa3a95c8ede2ffd4cc2cdb5b94e566b11662`. Current AWS Price List evidence gives `t3.medium` in EU (Ireland) as US$0.0456 per instance-hour before EBS, public IPv4 and data transfer.

The dependency-free proof package, CloudFormation adapter, portable manifests and retained evidence now exist under `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/`. The successful third attempt completed on K3s and deleted the full stack; two earlier pre-workload failures are retained with their successful teardown evidence.

## Steps

- [x] At run start, assert profile `knowledge-islands-techne` resolves to account `655383751458` and region `eu-west-1`; stop on expired authentication, mismatch or newly conflicting proof resources.
- [x] Create a dependency-free proof package under `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/` containing plain Kubernetes manifests, a CloudFormation adapter, shell orchestration, one synthetic assignment fixture and a local results directory.
- [x] Define one non-normative target descriptor, one bounded workload input and one evidence envelope sufficient to record execution identity, immutable image digest, resolved infrastructure, outcome, logs, verification and teardown.
- [x] Validate the Kubernetes resources through live server-side dry runs and prove that the portable paths contain no AWS API group, ARN, IAM assumption, EC2 identifier or provider annotation.
- [x] Provision a disposable `10.88.0.0/24` VPC, public subnet, internet gateway, route, no-ingress security group and one `t3.medium` instance through CloudFormation without touching the Control Tower VPC. Use AMI `ami-0526a6499f6470118`, an encrypted delete-on-termination root volume, IMDSv2, Systems Manager access, ownership and expiry tags, instance-initiated termination, and a two-hour fallback lifetime.
- [x] Install K3s `v1.36.4+k3s1` at boot, wait for readiness through Systems Manager, apply one Kubernetes Job using `docker.io/library/busybox@sha256:73aaf090f3d85aa34ee199857f03fa3a95c8ede2ffd4cc2cdb5b94e566b11662`, and observe it to a terminal state.
- [x] Collect the outcome, pod logs, resolved inputs, manifest hashes, lifecycle timings and verification evidence into the local results directory before teardown; the workload must not publish directly with operator or AWS credentials.
- [x] Delete the CloudFormation stack, verify the instance, volume, security group and temporary IAM resources are absent, and record actual elapsed time and cost evidence.
- [x] Review whether the execution contract was proportionate, identify any requirement relaxed by evidence, and route only genuinely reusable schemas or capabilities to their owning repositories as separately governed work.

## Files touched

- `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/README.md`
- `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/cloudformation/stack.yaml`
- `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/manifests/namespace.yaml`
- `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/manifests/service-account.yaml`
- `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/manifests/network-policy.yaml`
- `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/manifests/job.yaml`
- `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/scripts/provision.sh`
- `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/scripts/run-proof.sh`
- `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/scripts/collect-evidence.sh`
- `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/scripts/destroy.sh`
- `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/fixtures/assignment.json`
- `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/fixtures/target.json`
- `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/results/`
- `Streams/Roadmap/TECHNE-OPS-003-pioneer-aws-agent-execution.md`
- Canonical Techne notes only if observed evidence changes the accepted architecture

## Verify

- `shellcheck ./-/TECHNE-OPS-003-disposable-k3s-ec2-proof/scripts/*.sh` passes.
- `bash -n ./-/TECHNE-OPS-003-disposable-k3s-ec2-proof/scripts/*.sh` passes.
- `kubectl apply --dry-run=client -f ./-/TECHNE-OPS-003-disposable-k3s-ec2-proof/manifests/` passes.
- `aws cloudformation validate-template --profile knowledge-islands-techne --region eu-west-1 --template-body file://-/TECHNE-OPS-003-disposable-k3s-ec2-proof/cloudformation/stack.yaml` passes before deployment.
- A preflight assertion proves the caller account is exactly `655383751458`; any mismatch stops before a write.
- Static checks find no AWS-specific field in `manifests/`, no inbound security-group rule, no workload AWS credential and no package or library directory.
- The Kubernetes Job reaches one explicit terminal state and its evidence names the execution, image digest, target, inputs, outcome and manifest hashes.
- Instance-metadata access from the workload fails, while only the declared DNS and HTTPS egress needed by the proof succeeds.
- Evidence is present locally before teardown begins.
- Post-teardown inventory finds no retained VPC, subnet, route table, internet gateway, instance, public IPv4 address, EBS volume, security group, instance profile or role from the proof stack.
- `ki repo audit --skill ki-authoring --repo .`, `ki repo audit --skill ki-repo-kb-streams --repo .`, `ki repo audit --skill ki-repo-kb --repo .`, and `git diff --check` pass.

## Dependencies / blocks

The architecture prerequisite was accepted in `5aefbcc` and is canonical in [[Techne Fabric Execution Contract]]. The proof has no remaining roadmap dependency.

The account, region, network boundary, AMI, K3s version, workload image digest, quota and current instance price are resolved. The absence of a local live Kubernetes target is recorded rather than silently solved by installing another runtime. Readiness now requires human review of this exact plan, including the disposable VPC, two-hour lifetime and US$2 per-run ceiling.

## Delegation

Keep AWS authentication, account assertion, provisioning approval and teardown with one coordinator. Offline review of CloudFormation, shell scripts, Kubernetes policy and evidence fixtures may be separated only after the plan is Ready. No delegated worker receives administrator credentials.

## Documentation impact

### Decision Records

No new Decision Record is required. This changes the first implementation proof from managed EKS to disposable K3s without changing the provider-neutral architecture.

### Specifications

The target descriptor, workload input and evidence envelope begin as explicitly non-normative fixtures. Any stable portable schema or conformance rule supported by proof evidence becomes separately governed `ki-specifications` work.

### Guides

The proof README must document exact preflight, run, evidence collection, emergency cleanup and post-teardown verification procedures.

### Roadmap

Keep persistent controller, Telegram transport and registered-target work in `TECHNE-OPS-007`; this proof did not grow into the fabric operator.

## Review

### Delivered

From immutable baseline `1814e88b95c1783be6183c4739779395d92161aa`, the approved boundary produced a dependency-free CloudFormation, shell and Kubernetes proof package and exercised it in AWS account `655383751458`. One disposable single-node K3s target ran the pinned workload, returned evidence locally and was deleted with its complete stack. The delivery did not introduce EKS, a package manager, a persistent controller, Telegram integration or a cluster registry.

### Summary changes

- Added one CloudFormation stack owning an isolated VPC, public subnet, internet route, no-ingress security group, minimal Systems Manager instance role, encrypted root volume and `t3.medium` instance with an independent two-hour termination fallback.
- Added provider-neutral restricted Kubernetes resources: namespace, tokenless ServiceAccount, default-deny NetworkPolicy and digest-pinned Job with no privilege or writable root filesystem.
- Added account, region, AMI, conflict and teardown guards; evidence collection; cost accounting; and fail-fast handling for expired SSO during Systems Manager observation.
- Retained two failed pre-workload attempts and their successful teardown evidence before the third attempt completed.
- Kept target, assignment and evidence structures explicitly non-normative and left controller work with `TECHNE-OPS-007`.

### Verification

- `shellcheck` and `bash -n` — passed for every proof script.
- Kubernetes YAML parse — passed; every resource then passed live K3s server-side dry run before application. Local `kubectl apply --dry-run=client` could not perform API discovery without a local cluster, so the live server-side gate replaced it and is retained in `results/execution-invocation.json`.
- `aws cloudformation validate-template` — passed for the retained template.
- Portable-manifest policy check — passed: no AWS API group, ARN, IAM, EC2 or EKS field appears under `manifests/`.
- Security review — passed: no inbound security-group rule, no service-account token, no workload AWS credential, default-deny workload networking, IMDSv2 hop limit one, and observed workload metadata access `blocked`.
- Live execution — passed on K3s `v1.36.4+k3s1`; the Job and pod succeeded using the planned immutable image digest and emitted the expected outcome.
- Evidence — passed for execution identity, assignment, target, image, manifest hashes, lifecycle, outcome and teardown.
- Teardown — passed after every attempt. The stack is absent and direct checks report zero active proof VPCs, subnets, gateways, instances, volumes, security groups, instance profiles and roles.
- Cost — 1,367 aggregate instance-seconds across three attempts; estimated EC2 compute cost US$0.01731 against the US$2 ceiling. Final ancillary billing is delayed and explicitly excluded from the estimate.
- `ki repo audit --skill ki-authoring --repo .`, `ki repo audit --skill ki-repo-kb-streams --repo .`, `ki repo audit --skill ki-repo-kb --repo .`, and `git diff --check` — passed.
- Package-directory check — passed: no `node_modules`, virtual environment or Python cache directory exists.

### Outstanding concerns

The first two attempts exposed and then corrected remote-shell portability and namespace dry-run ordering defects before any workload ran. AWS's eventually consistent tagging API still listed terminated instance identifiers after direct resource and stack checks returned zero; the unfiltered evidence is retained. The SSO session expired once during observation and required interactive refresh; polling now fails fast on authentication errors, while the instance termination timer remains the non-interactive cost fallback.

The successful workload was a synthetic conformance Job, not an agent runtime. It proved the disposable execution and evidence boundary but not cross-target portability, controller recovery, Telegram interaction or registered-cluster dispatch. Delayed EBS, public IPv4 and transfer charges are not yet observable, although the short aggregate lifetime leaves substantial room below the approved ceiling.

### Post-change review

The delivery meets the narrowed proof goal: ordinary Kubernetes resources ran on disposable K3s inside one EC2 instance, the workload could not reach instance metadata, evidence survived cluster destruction, and no direct chargeable proof resource remains. The contract was proportionate after replacing unavailable local client dry-run with stronger live server-side validation and after separating durable evidence from cluster state.

The main operational risk is loss of AWS authentication during observation or cleanup. Fail-fast polling, explicit cleanup, CloudFormation ownership and the instance's two-hour termination fallback make that visible and bounded, but a future controller will need durable credential-renewal and reconciliation behaviour. The work is ready for human acceptance review.

### Mini recap

Techne now has a reproducible, dependency-free proof that one bounded Kubernetes workload can execute on an ephemeral K3s/EC2 target and return durable evidence before complete teardown. Review evidence routes through `-/TECHNE-OPS-003-disposable-k3s-ec2-proof/results/`; long-running controller and registered-cluster work remains in [[TECHNE-OPS-007-define-long-running-controller-and-registered-execution-targets|TECHNE-OPS-007]].

## Discussion

### Disposable durability model

The instance and K3s datastore may disappear completely. A successful run is one whose outcome and evidence have crossed the review boundary before destruction. Losing the instance before export produces a failed execution that may be retried from immutable inputs; cluster persistence is not a recovery mechanism.

### Cost and lifetime model

Use On-Demand capacity for a short irregular run. Start with `t3.medium` because K3s documents a two-core, two-gigabyte server minimum and the four-gigabyte instance leaves modest workload headroom. Current EU (Ireland) pricing is US$0.0456 per instance-hour before EBS, public IPv4 and data transfer. A two-hour hard lifetime and US$2 total proof ceiling leave substantial headroom while keeping accidental persistence bounded.

The normal cleanup path deletes the CloudFormation stack. Instance-initiated termination plus a boot-time expiry timer is the fallback if the local runner disappears; deleting the residual stack remains mandatory reconciliation.

### Controller boundary

For this proof, local shell orchestration temporarily performs provisioning, dispatch, observation, evidence collection and cleanup. It is not the persistent controller, target registry or final operator interface. Its fixtures should make later registration possible without prematurely standardising that design.

### Stop conditions

Stop before provisioning if the AWS account or region differs, authentication is ambiguous, the selected AMI no longer resolves, the cost ceiling is exceeded, teardown cannot be demonstrated from the template, the Control Tower VPC would be touched, or unrelated account resources would be modified. Stop the run if provider fields leak into portable manifests, the workload needs privileged or host access, instance metadata is reachable, credentials enter the Job, evidence cannot leave before teardown, or any expected resource remains after cleanup.

### Primary source entry points

- [K3s quick-start guide](https://docs.k3s.io/quick-start)
- [K3s installation requirements](https://docs.k3s.io/installation/requirements)
- [K3s architecture](https://docs.k3s.io/architecture)
- [Amazon EC2 On-Demand pricing](https://aws.amazon.com/ec2/pricing/on-demand/)
- [Amazon EC2 T3 instance specifications](https://aws.amazon.com/ec2/instance-types/general-purpose/)
- [AWS Systems Manager Session Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager.html)
- [Amazon EBS delete-on-termination behaviour](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/preserving-volumes-on-termination.html)
