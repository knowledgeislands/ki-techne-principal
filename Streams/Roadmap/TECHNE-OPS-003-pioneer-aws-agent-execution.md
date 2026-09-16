---
note_type: stream-proposal
id: TECHNE-OPS-003
area: OPS
title: Pioneer portable Kubernetes agent execution on AWS
aliases:
  - AWS Agent Execution Pioneer Proposal
theme: operational-tooling
horizon: next
status: draft
priority: high
dependencies: []
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-08T23:54:53Z
updated_at: 2026-09-16T21:48:50Z
---

# Pioneer Portable Kubernetes Agent Execution on AWS

## Goal

Prove one bounded agent footprint on an ordinary Kubernetes cluster hosted by AWS, then demonstrate that the unchanged portable layer can target another conforming Kubernetes cluster.

## Context

[[ADR-TECHNE-001-provider-neutral-isolated-agent-execution|ADR-TECHNE-001]] establishes the provider-neutral execution model. The dedicated Techne AWS account is a clean first capacity provider, and its EKS control-plane cost is acceptable, but neither AWS nor an AWS application service is part of the Techne execution contract.

Portability is measured at the Kubernetes application boundary. Agent footprints use Kubernetes, OCI images, Git and portable evidence interfaces. AWS-specific infrastructure stops at presenting a conforming cluster and declared capabilities through a replaceable provider adapter.

The read-only inventory completed on 2026-09-13 found no existing EKS cluster, agent runtime or repository-owned infrastructure application. The inherited Control Tower baseline remains outside this proof.

## Boundary

Keep AWS infrastructure in a separate provider adapter. Do not use ECS, CodeBuild, Lambda, Step Functions, Bedrock, SQS or DynamoDB as an execution dependency; place AWS SDK calls, ARNs, IAM assumptions, AWS API groups and provider-specific Kubernetes annotations outside the portable layer.

The initial portable layer must not require cluster-admin, privileged pods, host access, a load balancer, a persistent database or queue, baked credentials, a public listener, or an AWS-owned registry. Do not provision until the implementation location, total cost cap, egress design, secret path, retained-cluster policy and tested teardown plan are explicit.

## Current state

The local AWS, CDK, Kubernetes and Helm clients and an authenticated operator path are present. The account has no observed agent-runtime infrastructure, no CDK bootstrap, no relevant execution roles and no budget alarm. The provider-neutral cluster package, AWS adapter and first workload contract do not yet exist.

A standard EKS control plane with one small managed node group is the leading first reference. The node group should normally sit at zero desired capacity and rise only for bounded work. EKS Auto Mode and Fargate are not the baseline because their provider-managed compute, networking and storage constraints make the portability boundary harder to inspect.

## Steps

- [ ] Name the implementation repository and paths, then declare the Kubernetes capability profile, portable footprint contract and returned evidence contract.
- [ ] Separate provider-owned `aws-eks` infrastructure from provider-neutral Kubernetes packaging and prove rendered manifests contain no AWS dependency.
- [ ] Exercise the portable package on a generic local or CI Kubernetes cluster before incurring AWS cost.
- [ ] Approve the total cost, network and egress design, credential path, ownership and expiry tags, retained-cluster policy, and tested teardown boundary.
- [ ] Provision the smallest EKS capacity adapter, run one digest-pinned disposable Kubernetes Job, return Git, log and manifest evidence, and remove task capacity.
- [ ] Run the same image digest and footprint inputs on a second Kubernetes target, such as another Kubernetes-as-a-service host or the Mac Studio, without changing the portable layer.
- [ ] Record lifecycle, recovery, cost and portability findings and decide whether evidence justifies a distinct execution-fabric operator.

## Files touched

- This Stream record while the plan remains Draft
- A separately named implementation repository or pilot directory after ownership is decided
- A provider-specific infrastructure package that stops at Kubernetes access and declared capabilities
- A provider-neutral Helm or Kustomize package for namespaces, RBAC, quotas, network policy and workload resources
- Canonical Techne notes only if observed evidence changes the accepted architecture

## Verify

- `helm template` or `kustomize build` renders the portable package deterministically.
- Policy checks reject AWS API groups, annotations, ARNs and SDK assumptions in portable paths.
- Server-side dry runs pass on a generic cluster and EKS for the same image digest and inputs.
- The workload ServiceAccount cannot exceed its declared namespace role, does not mount an unnecessary token, receives no AWS credential, and cannot reach instance metadata.
- Effective default-deny network policy and bounded egress are demonstrated rather than assumed.
- Task deletion and node scale-to-zero leave only the explicitly retained and costed cluster resources.
- A second target runs without a portable-contract or manifest rewrite.

## Dependencies / blocks

The architecture prerequisite was accepted in `5aefbcc` and is now canonical in [[Techne Fabric Execution Contract]]. Readiness still requires the exact implementation location, a complete cost and network envelope, a secret-delivery choice, a retained-cluster policy, a teardown test and a first generic Kubernetes verification target.

## Delegation

Offline manifest and policy fixtures may be delegated. One coordinator retains AWS credentials, cost decisions, provisioning, verification and teardown; Kitteth and task workloads never receive AWS administrator credentials.

## Documentation impact

### Decision Records

No new Decision Record is required before the proof because the current provider-neutral architecture already owns the boundary. A material contract change discovered through evidence requires a separate decision.

### Specifications

The future portable footprint and capability contracts will need specifications in their owning implementation repository.

### Guides

The selected deployment and teardown procedure will need an operator guide before live provisioning.

### Roadmap

Keep this item in Next and Draft until every readiness input above is resolved. The second-target run is part of the portability claim, not an optional later embellishment.

## Discussion

### Minimal first reference

Use an upstream Kubernetes Job for the lowest-complexity disposable conformance probe. Use the core Agent Sandbox `Sandbox` resource only when resumability or sandbox lifecycle is the purpose, version-pin it, and omit routing and warm-pool extensions from the first proof.

### Stop conditions

Stop if provider fields leak into portable manifests; the task needs privileged or host access; network-policy enforcement is absent; egress is unresolved; secrets would be baked into images or manifests; cost, ownership or expiry is unbounded; teardown cannot be proved; the second target requires a contract rewrite; or repository write ownership is ambiguous.

### Primary source entry points

- [Amazon EKS pricing](https://aws.amazon.com/eks/pricing/)
- [EKS managed node groups](https://docs.aws.amazon.com/eks/latest/userguide/managed-node-groups.html)
- [EKS Fargate considerations](https://docs.aws.amazon.com/eks/latest/userguide/fargate.html)
- [Kubernetes SIG Agent Sandbox](https://github.com/kubernetes-sigs/agent-sandbox)
- [Agent Sandbox threat model](https://github.com/kubernetes-sigs/agent-sandbox/blob/main/docs/security/threat_model.md)
