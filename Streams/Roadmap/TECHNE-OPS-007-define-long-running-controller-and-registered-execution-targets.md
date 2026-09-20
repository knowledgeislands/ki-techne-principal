---
note_type: stream-proposal
id: TECHNE-OPS-007
area: OPS
title: Prove Kubernetes controller local execution target
aliases:
  - Persistent Controller Target Registry Proposal
  - Kubernetes Controller Proof
theme: operational-tooling
horizon: next
status: done
priority: high
dependencies: []
blocks: []
blocked_by: []
baseline_ref: a8ae843cce01b0c332fdbfbb1fa030614620ad26
created_at: 2026-09-16T21:59:23Z
updated_at: 2026-09-20T07:55:54Z
---

# Prove Kubernetes Controller Local Execution Target

## Goal

Prove one long-running personal controller can run as a single-replica Kubernetes Deployment, poll Telegram outbound and dispatch bounded Kubernetes Jobs to its registered local target without making Telegram, worker Pods or cluster-local conversational state the durable authority for work.

## Context

[[AI Execution Fabric]], [[Engineering Estate]] and [[Techne Fabric Execution Contract]] distinguish a persistent controller from replaceable execution targets and disposable task environments. The accepted `TECHNE-OPS-003` proof demonstrated one bounded Job on disposable K3s/EC2; its retired proof package remains recoverable from Git history at acceptance commit `2443c07`.

The selected minimum topology is one retained controller cluster with its own restricted `local` execution target. The original plan also proposed a second disposable K3s cluster to demonstrate `1 + N`, but the local proof already exercises the controller, target registration, Kubernetes Job, Pod isolation and result-return boundaries. On 20 September 2026, Kris Brown approved stopping at this useful proof boundary and deferring another cluster until a real workload shows whether separate capacity is needed.

The runnable implementation and operator guidance live in `ki-techne-tools`. Techne Principal retains architectural authority and this sanitised proof record.

## Boundary

Use one controller replica with the `Recreate` deployment strategy. Do not add leader election, horizontal availability, an operational journal, SQLite, another database or a workflow engine. Reconstruct operational state from Telegram's confirmed-update boundary, deterministic execution identities and Kubernetes objects.

Use outbound Telegram Bot API long polling. Expose no webhook, Service, Ingress or public controller endpoint. Admit commands only from the configured operator identity in the configured private chat. Derive each execution Job name deterministically from the Telegram update and target identities so a replay reconciles rather than creates duplicate work.

Keep the controller dependency-free using the Python standard library. The controller may create, observe, read logs from and cancel Jobs only in the execution namespace. Workload Pods receive no Telegram token, controller credential, cloud credential or Kubernetes service-account token.

Retain the approved single-node K3s controller stack after the proof. Do not provision a second cluster within this item. A later decision may add an independently managed target only after a named workload establishes its capacity, isolation, lifecycle or provider requirement.

## Current state

The retained K3s controller runs on instance `i-09b1ed39bc4735eda` in AWS account `655383751458`, region `eu-west-1`. It is one `t3.medium` instance in stack `ki-techne-ops-007-controller`; no OPS-007 target stack or second instance exists. The instance has a public IPv4 address for ordinary AWS operation, but its security group has no ingress rules. SSM, Telegram and image-pull traffic use outbound HTTPS.

The `techne-controller` Deployment is `1/1` ready and available with `Recreate`, its Pod is running with zero restarts, and K3s Secret encryption reports `reencrypt_finished` with all server hashes matching. The encrypted Kubernetes Secret exists without its values entering retained evidence.

Two live Telegram-triggered local Jobs completed successfully. Their two workload Pods reached `Succeeded`, explicitly set `automountServiceAccountToken: false` and contained no projected service-account token volume. The controller returned the workload outcome to `@kitteth_bot`; Kris Brown confirmed the reply worked. The initial result relay exposed a Kubernetes Pod-log content-negotiation defect, corrected in `ki-techne-tools` commit `423d2e0`; the deployed source matches SHA-256 `59a8178fac1346ae8350bfde07ce2209e6e9033071cb0a8a5ba2315f4bfcc330`.

## Steps

- [x] Define controller command, registered-target, execution and evidence envelopes using accepted `TECHNE-OPS-003` fixtures as non-normative inputs.
- [x] Implement the dependency-free controller, synthetic Telegram fixtures, Kubernetes resources, AWS adapters and lifecycle scripts; migrate runnable artefacts to `ki-techne-tools` and retire the Principal copy.
- [x] Implement outbound Telegram long polling, operator allowlisting, deterministic execution identities, acknowledgement, result return and confirmation-offset handling without persistent local state.
- [x] Deploy the controller as one `Recreate` Deployment on the retained single-node K3s cluster and register that cluster as `local` through a restricted in-cluster ServiceAccount.
- [x] Prove `/targets` and `/run local` end to end from Telegram through a successful Kubernetes Job and isolated workload Pod back to a Telegram result.
- [x] Diagnose and repair the Pod-log HTTP 406 response, add regression coverage, redeploy the committed source and confirm the corrected Telegram result.
- [x] Verify encryption, Deployment readiness, namespaced RBAC, absent public Kubernetes exposure, workload credential isolation and the absence of unapproved target capacity.
- [x] Document every supported Telegram command and capture the actual-workload decision as unadopted Triage rather than provisioning speculative capacity.

## Files touched

- `Streams/Roadmap/TECHNE-OPS-007-define-long-running-controller-and-registered-execution-targets.md`
- `Streams/Roadmap/TECHNE-OPS-009-choose-first-controller-workload.md`
- `../ki-techne-tools/apps/controller/`
- `../ki-techne-tools/deploy/kubernetes/`
- `../ki-techne-tools/infra/aws/`
- `../ki-techne-tools/scripts/`
- `../ki-techne-tools/docs/guides/controller-proof.md`
- `../ki-techne-tools/docs/guides/telegram-commands.md`

## Verify

- The controller test suite passes 14 tests, including command responses, deterministic replay, cancellation, failed-Job reporting, startup reconciliation and Pod-log media negotiation.
- The deployed controller source checksum matches committed `ki-techne-tools` source from `423d2e0`.
- Kubernetes reports one desired, ready and available controller replica using `Recreate`; the current Pod is running with zero restarts.
- K3s reports Secret encryption enabled, rotation stage `reencrypt_finished` and matching server hashes.
- Controller RBAC permits creating Jobs and reading Pod logs in `techne-execution`; the controller namespace exposes no Service or Ingress.
- Both retained proof Jobs and Pods succeeded. Workload Pods disable service-account token mounting and contain no projected service-account token volume.
- AWS reports only `ki-techne-ops-007-controller` and one running `t3.medium` OPS-007 instance. Its security group has no ingress rules.
- `ki-techne-tools` dependency-layout, controller, manifest and shell checks pass without creating package-local `node_modules`, virtual-environment or Python cache directories.
- Techne Principal authoring, Streams and knowledge-base audits and `git diff --check` pass.

## Dependencies / blocks

No dependency blocks review of the local proof. The controller remains deliberately small and retains no durable multi-step workflow state.

A second cluster is not a missing proof prerequisite. It is deferred until `TECHNE-OPS-009` identifies a real workload and decides whether local capacity is sufficient or another execution target is justified.

## Delegation

Controller authority, credential boundaries and live infrastructure operations remained in one coordinator lane. No delegated worker received Telegram, AWS or Kubernetes credentials.

## Documentation impact

### Decision Records

No new Decision Record is required for this proof. A later commitment to multi-active controllers, shared durable state or a stable cross-cluster registration protocol may require one.

### Specifications

Target, execution and evidence shapes remain implementation fixtures rather than portable specifications. The local proof does not establish a stable cross-cluster contract.

### Guides

Techne Tools now documents controller bootstrap and recovery separately from the complete Telegram command surface. The command guide covers `/start`, `/help`, `/targets`, `/run` and `/cancel`, including parameters, replies and access behaviour.

### Roadmap

Workflow-engine, agent-framework, Fly.io and second-cluster work remain outside this proof. `TECHNE-OPS-009` owns choosing the first useful controller workload and deciding whether another execution target is warranted.

## Review

### Delivered

From immutable baseline `a8ae843cce01b0c332fdbfbb1fa030614620ad26`, delivered a retained single-node K3s controller, encrypted non-retained Telegram credential admission, one restricted local execution target, deterministic Kubernetes Jobs, isolated workload Pods, Telegram result return, runnable Techne Tools implementation and operator documentation. No second execution cluster was provisioned under the approved minimum-proof decision.

### Summary changes

- Established the controller and execution namespaces, ServiceAccounts, namespaced RBAC, network policy, ConfigMaps, encrypted Secret and single-replica Deployment.
- Implemented Telegram command handling, target discovery, deterministic dispatch, reconciliation, cancellation and result reporting.
- Moved runnable artefacts into `ki-techne-tools` and removed retired Principal proof directories.
- Fixed Kubernetes Pod-log content negotiation after the first live Job exposed HTTP 406, then added regression coverage and redeployed the exact committed source.
- Documented all supported Telegram commands.
- Approved deviation: deferred a disposable second cluster until a named workload can justify it; captured that decision as `TECHNE-OPS-009` Triage.

### Verification

- Two live Telegram-triggered local Jobs completed and returned results through `@kitteth_bot`; the operator confirmed the corrected response.
- The controller is `1/1` ready and available, its Pod is running with zero restarts, and the deployed checksum matches commit `423d2e0`.
- Encryption, RBAC, workload credential isolation, absent ingress and single-stack inventory checks passed on 20 September 2026.
- Fourteen controller tests and the Techne Tools offline controller gate passed.
- Techne Principal repository audits and diff checks passed before review handoff.

### Outstanding concerns

Cross-cluster registration and execution remain deliberately unproven. This is not a blocker to accepting the local connectivity proof; `TECHNE-OPS-009` must first establish whether a real workload needs separate capacity, isolation or lifecycle ownership.

The retained controller instance continues to incur its approved `t3.medium`, EBS and public IPv4 operating cost until separately authorised teardown.

### Post-change review

The delivered system demonstrates the shortest useful control loop without adding speculative state or capacity: an authorised Telegram command reaches a long-running controller Pod, creates an isolated Kubernetes workload Pod and returns its outcome. The security and repository boundaries match the approved architecture. The scope deviation reduces cost and avoids treating theoretical multi-cluster support as current product need. The item is ready for human acceptance of the local proof boundary.

### Mini recap

OPS-007 now proves a persistent Telegram-connected Kubernetes controller and its local execution target end to end. The controller cluster is retained, no disposable target exists, command documentation is complete and the next product question is the first real workload—not another infrastructure comparison.

## Done

Accepted 2026-09-20 by Kris Brown on the review packet above.

## Discussion

### Controller target topology

The retained controller cluster is the stable home of one controller Deployment and its restricted `local` execution target. Additional clusters remain possible implementation choices, not an assumed topology or immediate roadmap commitment.

### Workload-before-capacity decision

Choose a useful controller workload before adding infrastructure. That decision must identify the work input, authority, output, runtime, isolation, latency, cost, recovery and evidence needs. Only then compare local Jobs with another registered Kubernetes target or a different substrate.

### Restart and replay boundary

Telegram retains unconfirmed updates and forgets earlier updates after a client confirms a higher offset. The controller keeps only an in-memory offset. A crash before confirmation can replay a command; deterministic execution identities, Kubernetes name uniqueness and lookup-before-create convert replay into reconciliation. This proof intentionally does not promise durable multi-step workflows.

### Credential boundary

The local target uses the controller's projected, rotating ServiceAccount token. Workload Pods set `automountServiceAccountToken: false` and receive no controller or Telegram Secret. Telegram values entered through the private interactive bootstrap and remain only in the encrypted Kubernetes Secret.

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
