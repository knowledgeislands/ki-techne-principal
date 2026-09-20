---
note_type: stream-proposal
id: TECHNE-OPS-009
area: OPS
title: Choose first controller workload
aliases:
  - Techne Controller Workload Decision
theme: operational-tooling
horizon: now
status: ready
priority: high
dependencies: []
blocks: []
blocked_by: []
baseline_ref: 3841157dafb64c3d97ae645aa195997c87a6bd7f
created_at: 2026-09-20T06:47:49Z
updated_at: 2026-09-20T10:36:45Z
---

# Choose First Controller Workload

## Goal

Choose the first useful workload for the retained Techne controller, then decide whether its registered `local` Kubernetes target is sufficient or another execution target is justified.

## Context

`TECHNE-OPS-007` proved the complete local control loop from an authorised Telegram command through the controller and an isolated Kubernetes Job back to a Telegram result. It deliberately stopped before provisioning a second cluster because infrastructure topology should follow a real workload rather than become the product by default.

The next decision is what outcome the controller should produce for its operator. A concrete workload supplies the missing evidence for runtime, isolation, latency, durability, cost, credential, recovery and capacity requirements.

One evidence-backed seed candidate already exists: run the standard automated verification for a named Knowledge Islands repository at an immutable Git revision and return a sanitised pass/fail summary. The manual code-review checklist explicitly requires automated gates first, and repository work repeatedly runs these checks before human judgement. This candidate has plain operator value but is not selected in advance; it must be compared with any other candidate grounded in observed work.

## Boundary

Choose and specify a workload; do not implement it in this item. Do not provision another cluster, alter the retained controller, adopt a workflow engine, add durable controller state, connect a repository credential or generalise proof fixtures.

Consider only workloads grounded in an existing repeated task, roadmap need or adopted operating responsibility. Do not invent an infrastructure-shaped workload to justify capacity already available.

The recommended workload must name its inputs and outputs, authority boundary, success and failure behaviour, expected frequency, maximum runtime, resource envelope, credential and network needs, idempotency, retained evidence and operator value. Compare running it on `local` with any proposed additional target before recommending infrastructure.

## Current state

The retained `t3.medium` controller and its restricted `local` target are live and proven. The controller currently exposes only the proof command surface and creates a fixed bounded Job; it has no repository checkout, workload catalogue, model credential, arbitrary-command path or cross-cluster target.

`TECHNE-OPS-007` was accepted and pruned after proving two successful local Jobs and Telegram result return. Fly.io intake was rejected because the current K3s approach satisfies the known substrate need. No current evidence requires another target.

The repository-verification seed candidate is grounded in `+/manual-code-review-checklist.md`, which identifies automated gates as a recurring prerequisite to manual review. No candidate workload has yet been selected or authorised for implementation.

## Steps

- [ ] Identify candidate controller workloads from observed repeated work, adopted roadmap needs or existing operating responsibilities; record the source and operator value of each.
- [ ] Define a compact comparison covering trigger, input, output, authority, idempotency, runtime, resources, credentials, network, evidence, recovery, failure handling and frequency.
- [ ] Evaluate the repository-verification seed candidate and any other evidence-backed candidates without implementing or provisioning them.
- [ ] Recommend one first workload or an explicit no-selection outcome, recording why alternatives are weaker or premature.
- [ ] Specify the recommended workload's bounded execution envelope independently of Kubernetes, AWS, Telegram or a particular agent framework.
- [ ] Decide whether the existing `local` target satisfies that envelope; identify another target only if a concrete unmet requirement justifies it.
- [ ] Publish the evaluation as a Techne Resource and state the exact follow-on implementation boundary, owning repository and acceptance condition without adopting that follow-on automatically.

## Files touched

- `Streams/Roadmap/TECHNE-OPS-009-choose-first-controller-workload.md`
- `Resources/Controller Workload Evaluation.md`
- `Resources/Resources.md`

## Verify

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

### Resources

Publish the candidate evidence, comparison, recommendation and uncertainty in `Resources/Controller Workload Evaluation.md`, indexed from `Resources/Resources.md`.

### Roadmap

Do not automatically create or adopt implementation work. The accepted recommendation may later generate a bounded record in the owning implementation repository through the governed trade route.

## Discussion

### Decision sequence

Start with the smallest outcome worth invoking from Telegram or another controller interface. Describe the work independently of Kubernetes, AWS or a particular agent framework. Then assess whether the retained `t3.medium` local target can run it safely and economically.

Add another execution target only when the workload demonstrates a concrete need such as stronger isolation, incompatible dependencies, burst capacity, a different trust boundary, long-running resource ownership or provider-specific capability. Otherwise retain the one-cluster topology.

### Seed candidate

An on-demand repository-verification workload would receive a repository identity and immutable Git revision, execute that repository's declared non-secret verification gates, and return a sanitised structured summary with a durable evidence reference. It must not accept arbitrary shell text, infer write authority, expose repository credentials to the workload or replace human code review.

### Promotion decision

Kris Brown explicitly adopted this item into Now and approved readiness planning on 20 September 2026. The seed candidate supplies the concrete operator value required by the original promotion condition, while the plan preserves a no-selection outcome if comparison evidence does not justify implementation.
