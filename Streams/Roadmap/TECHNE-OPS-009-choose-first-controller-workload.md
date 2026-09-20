---
note_type: stream-proposal
id: TECHNE-OPS-009
area: OPS
title: Choose first controller workload
aliases:
  - Techne Controller Workload Decision
theme: operational-tooling
horizon: triage
status: draft
priority: medium
dependencies: []
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-20T06:47:49Z
updated_at: 2026-09-20T06:47:49Z
---

# Choose First Controller Workload

## Goal

Choose the first useful workload for the retained Techne controller, then decide whether its registered `local` Kubernetes target is sufficient or another execution target is justified.

## Context

`TECHNE-OPS-007` proved the complete local control loop from an authorised Telegram command through the controller and an isolated Kubernetes Job back to a Telegram result. It deliberately stopped before provisioning a second cluster because infrastructure topology should follow a real workload rather than become the product by default.

The next decision is what outcome the controller should produce for its operator. A concrete workload supplies the missing evidence for runtime, isolation, latency, durability, cost, credential, recovery and capacity requirements.

## Boundary

Do not provision another cluster, adopt a workflow engine, add durable controller state or generalise the proof fixtures while this item remains Triage. Do not treat the existence of provider adapters as evidence that remote capacity is required.

Any later adoption must name one workload, its inputs and outputs, authority boundary, success and failure behaviour, expected frequency, maximum runtime, resource envelope, credential and network needs, retained evidence and operator value. It must compare running that workload on `local` with any proposed additional target before selecting infrastructure.

## Discussion

### Decision sequence

Start with the smallest outcome worth invoking from Telegram or another controller interface. Describe the work independently of Kubernetes, AWS or a particular agent framework. Then assess whether the retained `t3.medium` local target can run it safely and economically.

Add another execution target only when the workload demonstrates a concrete need such as stronger isolation, incompatible dependencies, burst capacity, a different trust boundary, long-running resource ownership or provider-specific capability. Otherwise retain the one-cluster topology.

### Promotion condition

Adopt this item only after identifying at least one candidate workload whose operator value can be stated plainly and whose proof would change a product or infrastructure decision.
