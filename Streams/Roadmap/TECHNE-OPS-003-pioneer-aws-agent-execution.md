---
note_type: stream-proposal
id: TECHNE-OPS-003
area: OPS
title: Pioneer AWS agent execution
aliases:
  - AWS Agent Execution Pioneer Proposal
theme: operational-tooling
horizon: waiting-for
status: draft
priority: medium
dependencies: [TECHNE-GOV-005]
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-08T23:54:53Z
updated_at: 2026-09-13T15:53:53Z
---

# Pioneer AWS Agent Execution

## Goal

Prove one bounded, disposable agent task environment in the dedicated Techne AWS footprint against the provider-neutral execution model.

## Context

`TECHNE-GOV-005` owns the provider-neutral architecture and current AWS candidate evidence. A locally configured Techne AWS profile and installed AWS CLI, CDK, Kubernetes, and Helm clients make an AWS proof plausible. An explicitly approved read-only inventory on 2026-09-13 established the live baseline without retaining account identifiers or credentials.

The proof should compare the smallest suitable AWS execution surfaces rather than assume Kubernetes. EKS Auto Mode, EKS on Fargate, ECS on Fargate, and CodeBuild offer materially different isolation, persistence, lifecycle, operational, and cost properties.

## Boundary

Do not authenticate without an explicit user-started SSO session, copy account identifiers or credentials into the knowledge base, provision infrastructure before a cost and teardown boundary is approved, select AWS as the portable contract, or create a public `techne` tool from one provider proof.

## Current state

The local client layer and authenticated AWS operator path are present. The dedicated account has 17 enabled regions and no observed agent-runtime infrastructure: no EKS or ECS clusters, CodeBuild projects, ECR repositories, EC2 instances, NAT gateways, RDS instances, or additional regional Lambda functions. `eu-west-1` contains the inherited Control Tower baseline, one non-default three-subnet VPC, and one Control Tower notification function. CDK is not bootstrapped, no relevant execution roles or AWS Budgets exist, and month-to-date metered usage is below one US cent. No repository-owned infrastructure-as-code application has been verified.

## Steps

- [x] After an explicit AWS SSO login, inventory enabled regions, EKS and ECS clusters, CloudFormation and CDK bootstrap stacks, ECR repositories, VPC and subnet shape, IAM execution roles, budgets, and current cost-bearing resources without retaining sensitive identifiers.
- [ ] Compare EKS Auto Mode, EKS on Fargate, ECS on Fargate, and CodeBuild against the isolation, persistence, network, credential, evidence, lifecycle, scale-to-zero, and cost controls accepted in `TECHNE-GOV-005`.
- [ ] Select the smallest reversible proof surface and define least-privilege roles, bounded egress, encrypted state, audit logs, ownership and expiry tags, budget alarm, default time-to-live, and tested destroy path.
- [ ] Decide whether the proof remains a repository-local CDK application, supplies evidence for `tools-ki`, or justifies a distinct execution tool only after at least one non-AWS adapter demonstrates the same lifecycle.
- [ ] Deploy one disposable environment, execute one bounded private-clone task, return portable evidence, and destroy all proof resources.
- [ ] Record measured lifecycle, recovery, cost, portability, and operational findings in Techne; route only proven reusable executable consequences to the Harness or tools repositories.

## Files touched

- This Stream record
- A separately reviewed repository-local pilot directory or receiver-owned implementation record after the proof surface is selected
- Relevant Techne canonical notes only if observed evidence changes the accepted architecture or Technology Radar posture

## Verify

- The initial inventory is read-only and records no account identifier, secret, or credential.
- The selected proof has explicit cost, authority, network, persistence, logging, expiry, and teardown controls.
- One bounded task starts from an immutable repository baseline and returns Git references, logs, manifests, and review evidence independently of provider snapshots.
- Teardown leaves no unplanned cost-bearing resources.
- Findings distinguish AWS-specific implementation from portable lifecycle requirements.

## Dependencies / blocks

The approved read-only inventory is complete. `TECHNE-GOV-005` must establish the accepted provider-neutral model before infrastructure is selected or provisioned. Provisioning also requires explicit cost, budget, and teardown authority.

## Delegation

Do not delegate authenticated inventory or infrastructure mutation. After the proof surface and authority boundary are fixed, documentation comparison and offline CDK fixture work may be isolated, but one coordinator retains credentials, cost decisions, deployment, verification, and teardown.

## Discussion

### Observed AWS baseline

The 2026-09-13 inventory authenticated to the expected dedicated account and examined all 17 enabled regions. Only `eu-west-1` contained relevant resources, all attributable to the inherited Control Tower baseline: six CloudFormation stacks, one non-default VPC with three subnets and one VPC endpoint, and one notification function. No internet gateway or NAT gateway was present.

No EKS or ECS cluster, CodeBuild project, ECR repository, EC2 instance, RDS instance, load balancer, CDK bootstrap stack, or relevant agent-execution IAM role was observed. The account had no S3 buckets, hosted zones, or AWS Budgets. Month-to-date unblended cost was below one US cent. This is a clean starting point rather than an existing execution platform; the proof must create its own network, identity, observability, budget, expiry, and teardown controls.

### Candidate posture

ECS on Fargate may be the smallest one-shot AWS adapter when Kubernetes claims and warm pools add no value. EKS is relevant when Kubernetes-native Agent Sandbox or Coder control-plane evidence is the purpose. CodeBuild is a useful short-lived job control but does not supply every resumable-agent lifecycle capability.
