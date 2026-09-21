---
note_type: stream-proposal
id: TECHNE-OPS-009
area: OPS
title: Choose first controller workload
aliases:
  - Techne Controller Workload Decision
theme: operational-tooling
horizon: now
status: awaiting-review
priority: high
dependencies: []
blocks: []
blocked_by: []
baseline_ref: 549fef31dc9b76b20d5a80029cd5968fd2837551
created_at: 2026-09-20T06:47:49Z
updated_at: 2026-09-21T23:57:21Z
---

# Choose First Controller Workload

## Goal

Choose the first useful workload for the retained Techne controller, then decide whether its registered `local` Kubernetes target is sufficient or another execution target is justified.

## Context

[[Governed Work Controller]] defines the common controller model: requests and workloads may be mechanical, agentic or hybrid, while all consequential paths use the same bounded operations and execution authority. This item chooses a first workload within that model; it does not need the first workload to prove every workload form.

`TECHNE-OPS-007` proved the complete local control loop from an authorised Telegram command through the controller and an isolated Kubernetes Job back to a Telegram result. It deliberately stopped before provisioning a second cluster because infrastructure topology should follow a real workload rather than become the product by default.

The next decision is what outcome the controller should produce for its operator. A concrete workload supplies the missing evidence for runtime, isolation, latency, durability, cost, credential, recovery and capacity requirements.

One evidence-backed seed candidate already exists: run the standard automated verification for a named Knowledge Islands repository at an immutable Git revision and return a sanitised pass/fail summary. The manual code-review checklist explicitly requires automated gates first, and repository work repeatedly runs these checks before human judgement. This candidate has plain operator value but is not selected in advance; it must be compared with any other candidate grounded in observed work.

## Boundary

Treat repository verification as a candidate mechanical workload proof. Do not treat its success as proof of natural-language interpretation, controller-session continuity or a bounded agent runtime; those require distinct follow-on evidence.

Choose and specify a workload; do not implement it in this item. Do not provision another cluster, alter the retained controller, adopt a workflow engine, add durable controller state, connect a repository credential or generalise proof fixtures.

Consider only workloads grounded in an existing repeated task, roadmap need or adopted operating responsibility. Do not invent an infrastructure-shaped workload to justify capacity already available.

The recommended workload must name its inputs and outputs, authority boundary, success and failure behaviour, expected frequency, maximum runtime, resource envelope, credential and network needs, idempotency, retained evidence and operator value. Compare running it on `local` with any proposed additional target before recommending infrastructure.

## Current state

The retained `t3.medium` controller and its restricted `local` target are live and proven. The controller currently exposes only the proof command surface and creates a fixed bounded Job; it has no repository checkout, workload catalogue, model credential, arbitrary-command path or cross-cluster target.

`TECHNE-OPS-007` was accepted and pruned after proving two successful local Jobs and Telegram result return. Fly.io intake was rejected because the current K3s approach satisfies the known substrate need. No current evidence requires another target.

The repository-verification seed candidate is grounded in `+/manual-repo-review-checklist.md`, which includes automated verification as evidence within a broader repository review. No candidate workload has yet been selected or authorised for implementation.

## Steps

- [x] Classify each candidate as mechanical, agentic or hybrid and state which controller and execution boundaries its proof would actually exercise.
- [x] Identify candidate controller workloads from observed repeated work, adopted roadmap needs or existing operating responsibilities; record the source and operator value of each.
- [x] Define a compact comparison covering trigger, input, output, authority, idempotency, runtime, resources, credentials, network, evidence, recovery, failure handling and frequency.
- [x] Evaluate the repository-verification seed candidate and any other evidence-backed candidates without implementing or provisioning them.
- [x] Recommend one first workload or an explicit no-selection outcome, recording why alternatives are weaker or premature.
- [x] Specify the recommended workload's bounded execution envelope independently of Kubernetes, AWS, Telegram or a particular agent framework.
- [x] Decide whether the existing `local` target satisfies that envelope; identify another target only if a concrete unmet requirement justifies it.
- [x] Publish the evaluation as canonical Techne architecture and state the exact follow-on implementation boundary, owning repository and acceptance condition without adopting that follow-on automatically.

## Files touched

- `Streams/Roadmap/TECHNE-OPS-009-choose-first-controller-workload.md`
- `Pillars/Engineering Practice/Architecture/Controller Workload Evaluation.md`
- `Pillars/Engineering Practice/Architecture/Architecture.md`

## Verify

- The recommendation states whether it proves mechanical execution, bounded agent execution, session continuity or a named combination, without implying untested coverage.
- Every considered candidate cites an observed repeated task, adopted roadmap need or existing operating responsibility and states a plain operator outcome.
- The comparison applies the same decision criteria to every candidate and distinguishes required behaviour from preferred implementation.
- The recommended workload has a complete, bounded execution envelope with explicit authority, credential, network, failure, recovery, evidence and cleanup behaviour.
- The local-versus-additional-target conclusion follows the workload requirements rather than provider preference or available adapters.
- The evaluation names one follow-on implementation owner and reviewable boundary, or records a justified no-selection outcome.
- No code, controller configuration, credential, cluster or cloud resource changes occur within this decision item.
- `ki repo audit --skill ki-authoring --repo .`, `ki repo audit --skill ki-repo-kb-streams --repo .`, `ki repo audit --skill ki-repo-kb --repo .` and `git diff --check` pass.

## Dependencies / blocks

No external dependency blocks the decision work. Candidate discovery uses existing governed repository evidence. Human acceptance of the eventual recommendation occurs through this record's review boundary; implementation remains separate work.

## Delegation

Keep candidate comparison, architectural boundary and recommendation in one coordinator lane because each candidate affects the common decision. Read-only evidence collection may be delegated only if it introduces no credentials, external account or repository mutation.

## Documentation impact

### Decision Records

No Decision Record is expected unless the evaluation proposes a new durable architectural commitment rather than one bounded product workload.

### Specifications

Do not create a portable workload specification from one selected use case. Route a reusable contract to `ki-specifications` only after implementation evidence demonstrates stability.

### Canonical architecture

Publish the candidate evidence, comparison, recommendation and uncertainty in `Pillars/Engineering Practice/Architecture/Controller Workload Evaluation.md`, indexed from `Architecture.md`. This corrects the planned location because the evaluation is Techne's own settled engineering knowledge, not external reference material that belongs in `Resources/`.

### Roadmap

Do not automatically create or adopt implementation work. The accepted recommendation may later generate a bounded record in the owning implementation repository through the governed trade route.

## Review

### Delivered

Delivered the approved workload decision from immutable baseline `549fef31dc9b76b20d5a80029cd5968fd2837551`. The evaluation selects `repository.verify` as the first useful mechanical workload, retains the registered `local` target and defines a bounded follow-on for `knowledgeislands/ki-techne-harness` without creating or adopting implementation work.

### Summary changes

- Compared repository verification, advisory code review and persistent supervised agent sessions against the same operator-value, authority, runtime, evidence and recovery concerns.
- Selected immutable-revision repository verification as the first mechanical workload and identified advisory code review as the strongest likely subsequent hybrid proof.
- Defined the workload's identity, read-only authority, isolation, resource ceilings, package-library handling, idempotency, result envelope, failure taxonomy and cleanup behaviour.
- Kept `local` as the first execution target because no current workload requirement justifies another cluster.
- Corrected the planned output route from `Resources/` to canonical architecture because this evaluation is internal settled engineering knowledge, not external reference material.

### Verification

- The evaluation distinguishes mechanical execution evidence from bounded agent execution and controller-session continuity.
- Each candidate is grounded in an existing review responsibility or adopted roadmap record and states a concrete operator outcome.
- The selected envelope excludes arbitrary repository URLs, branches, package commands and shell text; it grants no repository write, controller credential or Kubernetes authority.
- Package-library folders are confined to an execution-scoped ephemeral volume and cannot persist in the controller image, host repository or a shared package subfolder.
- `ki repo audit --skill ki-authoring --repo .`, `ki repo audit --skill ki-repo-kb-streams --repo .`, `ki repo audit --skill ki-repo-kb --repo .`, `ki repo audit --skill ki-work --repo .` and `git diff --check` pass.

### Outstanding concerns

The 15-minute, 1-vCPU, 2-GiB memory and 5-GiB ephemeral-storage ceilings are first-proof assumptions that implementation must test. This decision does not yet prove repository checkout, private-source credentials, agentic review, session continuity or the implementation's pass, failure, cancellation, timeout, redaction and cleanup paths.

### Post-change review

The result meets the approved decision-only boundary. It names a useful first workload without turning Kubernetes or AWS into the product, retains one cluster because the workload fits it and keeps implementation authority in the owning tools repository. No controller configuration, credential, cluster, cloud resource or executable code changed.

### Mini recap

Techne should next route a separately governed implementation proposal to `knowledgeislands/ki-techne-harness` when repository verification is selected for delivery. That work should prove one successful and one intentionally failing immutable-revision verification on `local`; this record does not create or authorise it automatically.

## Discussion

### Decision sequence

Start with the smallest outcome worth invoking from Telegram or another controller interface. Describe the work independently of Kubernetes, AWS or a particular agent framework. Then assess whether the retained `t3.medium` local target can run it safely and economically.

Add another execution target only when the workload demonstrates a concrete need such as stronger isolation, incompatible dependencies, burst capacity, a different trust boundary, long-running resource ownership or provider-specific capability. Otherwise retain the one-cluster topology.

### Seed candidate

An on-demand repository-verification workload would receive a repository identity and immutable Git revision, execute that repository's declared non-secret verification gates, and return a sanitised structured summary with a durable evidence reference. It must not accept arbitrary shell text, infer write authority, expose repository credentials to the workload or replace human code review.

### Promotion decision

Kris Brown explicitly adopted this item into Now and approved readiness planning on 20 September 2026. The seed candidate supplies the concrete operator value required by the original promotion condition, while the plan preserves a no-selection outcome if comparison evidence does not justify implementation.
