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
---

# Pioneer AWS Agent Execution

## Goal

Prove one bounded, disposable agent task environment in the dedicated Techne AWS footprint against the provider-neutral execution model.

## Context

`TECHNE-GOV-005` owns the provider-neutral architecture and current AWS candidate evidence. A locally configured Techne AWS profile and installed AWS CLI, CDK, Kubernetes, and Helm clients make an AWS proof plausible, but the profile's SSO token was expired during the 2026-09-09 inspection. Live resources, regions, quotas, network topology, CDK bootstrap state, and current spend remain unverified.

The proof should compare the smallest suitable AWS execution surfaces rather than assume Kubernetes. EKS Auto Mode, EKS on Fargate, ECS on Fargate, and CodeBuild offer materially different isolation, persistence, lifecycle, operational, and cost properties.

## Boundary

Do not authenticate without an explicit user-started SSO session, copy account identifiers or credentials into the knowledge base, provision infrastructure before a cost and teardown boundary is approved, select AWS as the portable contract, or create a public `techne` tool from one provider proof.

## Current state

The local client layer is present, but no live account inventory or repository-owned infrastructure-as-code application has been verified. The provider-neutral model can be enacted independently; this operational proof waits for authenticated read-only evidence.

## Steps

- [ ] After an explicit AWS SSO login, inventory enabled regions, EKS and ECS clusters, CloudFormation and CDK bootstrap stacks, ECR repositories, VPC and subnet shape, IAM execution roles, budgets, and current cost-bearing resources without retaining sensitive identifiers.
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

Wait for an explicit user-started AWS SSO session and approved read-only inventory window. `TECHNE-GOV-005` must establish the accepted provider-neutral model before infrastructure is selected or provisioned.

## Delegation

Do not delegate authenticated inventory or infrastructure mutation. After the proof surface and authority boundary are fixed, documentation comparison and offline CDK fixture work may be isolated, but one coordinator retains credentials, cost decisions, deployment, verification, and teardown.

## Discussion

### Candidate posture

ECS on Fargate may be the smallest one-shot AWS adapter when Kubernetes claims and warm pools add no value. EKS is relevant when Kubernetes-native Agent Sandbox or Coder control-plane evidence is the purpose. CodeBuild is a useful short-lived job control but does not supply every resumable-agent lifecycle capability.
