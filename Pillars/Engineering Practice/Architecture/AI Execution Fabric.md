# Techne Fabric

## Purpose

Techne Fabric is the reader-facing name for the provider-neutral architecture also identified in existing notes and links as the AI Execution Fabric.

The fabric matches a context-bound assignment and a reusable agent footprint with an eligible execution target. It separates workload requirements from infrastructure choice, so that the engineering estate can use local, managed, elastic or dedicated capacity without coupling the overall architecture to a single provider.

The fabric is an architectural decision and operating model, not a single runtime, service, cluster or control plane. A fabric operator may implement its lifecycle, but no particular executable, repository or provider is committed here.

[[Techne Fabric Execution Contract]] defines the immutable bindings, lifecycle, evidence and ownership boundary every admitted execution preserves.

## Fabric Concepts

- **Working context** identifies the purpose and capacity in which the person is acting. It selects applicable knowledge, repository relationships, permissions, approval rules and eligible footprints; it is distinct from a working mode, an Agora and an access grant.
- **Agent footprint** is a reproducible declaration of an agent runtime, tools, environment requirements, compatible target capabilities, resource and network constraints, state handling, readiness checks and supported human attachment.
- **Execution** binds one objective, immutable repository baseline, working context, footprint, authority, evidence destination and lifetime. An execution retains that binding if the person later selects another context elsewhere.
- **Task environment** is the bounded filesystem, process, network and isolation boundary in which a worker carries out the execution.
- **Execution target** supplies eligible capacity and substrate capabilities. A deployment is one configured realisation of controller, worker, model or supporting services on one or more targets.
- **Interface** is a replaceable channel through which a person requests, observes, approves, reviews or attaches to work. It does not establish authority merely by carrying a conversation.

A footprint's declared capabilities, the footprints supported by an implementation, the subset eligible in a working context and the executions currently running are different sets. Eligibility alone does not require allocating an execution environment; implementations may still maintain governed images, caches or warm capacity.

## Execution Selection Axes

Execution placement, task isolation and component placement are separate decisions. Select these axes independently for each workload:

- **Controller placement** — where persona continuity, policy, task identity and lifecycle supervision operate.
- **Worker execution tier** — where the task environment runs: local, managed, elastic or dedicated.
- **Model-inference placement** — where an eligible model capability runs; it need not be colocated with either controller or worker.
- **Sandbox substrate** — the filesystem, process, network, and isolation boundary supplied to the task.
- **Agent footprint** — the reusable runtime and operating-envelope declaration selected for the assignment.
- **Bootstrap profile** — the portable environment-preparation subset of a footprint: required tools, capabilities, configuration shape, state classes and readiness checks.
- **Agent runtime** — the implementation that performs the bounded task inside the selected environment.

A persistent controller may coordinate identity, context binding, policy, credential brokerage, lifecycle and result integration across these axes. Git and the selected change-management process remain authoritative outside any one controller, environment or provider snapshot.

## Execution Tiers

### Local Execution

Local execution runs workloads on an engineer-controlled system, such as a Mac Studio.

It is appropriate when locality, privacy, low interactive latency, offline operation, or predictable local cost are important.

Local capacity is bounded by the available hardware and may not provide the capability, throughput, or availability required by every workload.

### Managed AI APIs

Managed AI APIs provide externally operated model capabilities through a service interface.

They are appropriate when a workload requires capabilities that are impractical to host locally or when managed availability and operational simplicity justify the service dependency.

Their use must account for data handling, service availability, latency, cost, and provider-specific constraints.

### Elastic Compute

Elastic compute provides on-demand capacity for workloads whose resource requirements exceed the local environment or vary materially over time.

AWS is the current trial context for this tier, but the architecture does not require AWS as its permanent implementation.

Elastic execution introduces additional requirements for provisioning, identity, observability, cost control, data locality, and lifecycle management.

### Future Dedicated Infrastructure

Dedicated infrastructure represents capacity operated specifically for sustained or specialised workloads.

It remains a future option when requirements for control, scale, capability, economics, or data handling justify the operational commitment.

## Context Eligibility and Routing

Before comparing targets, validate that the selected context permits the objective, repositories, data, footprint, credentials, network access and approval path. Agora membership or an editor projection may help locate repositories, but neither proves user identity, grants access or permits cross-context data transfer.

An ambiguous context must be resolved before consequential action. A context change applies to new work; it must not silently redirect an existing execution or widen its authority. Any deliberate scope change requires a newly validated grant.

Execution decisions should evaluate the following criteria together.

| Criterion      | Decision concern                                                                               |
| -------------- | ---------------------------------------------------------------------------------------------- |
| Capability     | Whether the target can perform the required model, tooling, or compute workload.               |
| Latency        | Whether end-to-end response time meets the interaction or operational need.                    |
| Privacy        | Whether data handling is suitable for the workload's sensitivity and access requirements.      |
| Cost           | Whether total run, transfer, storage, and operational costs are proportionate to the value.    |
| Context length | Whether the target can support the workload's required working context.                        |
| Locality       | Whether data and execution remain in an appropriate geographic, network, or physical location. |
| Availability   | Whether the target's capacity and service characteristics meet the required continuity.        |

No single criterion determines the route in isolation.

For example, a capable managed service may be unsuitable for a sensitive workload, while a private local runtime may be unsuitable for a workload that requires more capacity or context than the local environment can provide.

## Decision Process

1. Bind the objective to an explicit working context, repository baseline, authority and evidence destination.
2. Identify the context-eligible footprints, then classify data sensitivity, interaction pattern, continuity requirements and working mode.
3. Identify targets that satisfy the non-negotiable capacity, locality, privacy, availability and footprint constraints.
4. Select controller, worker and model placement; sandbox substrate; bootstrap profile; and agent runtime independently, applying isolation proportionate to the task's authority and risk.
5. Compare eligible combinations by capability, latency, privacy, cost, context length, locality, availability, persistence, recovery and operational burden.
6. Select the least complex combination that meets the requirements and record material trade-offs.
7. Define credential, network, evidence-return, cleanup, fallback and recovery behaviour before execution.

This process supports explicit decisions while leaving implementation-specific automation to operating guidance and provider adapters.

## Relationship to the Engineering Estate

[[Engineering Estate]] defines the stable roles of the components that coordinate, govern, execute, persist and review engineering work, then maps current and candidate products onto them.

Techne Fabric determines which context-eligible footprint and targets may serve a bounded execution.

It does not transfer accountability for intent, deterministic orchestration, persistent execution, engineering review, or knowledge governance away from the components that hold those responsibilities.

Local runtimes such as llama.cpp and MLX-LM are implementation options within the local execution tier.

They do not define the fabric itself or preclude managed, elastic, or dedicated execution.

## Operating Boundaries

The fabric must not obscure the context, authority, data, identity, network, cost and observability consequences of its routing choices.

Execution selection should therefore remain traceable enough for engineers to understand why a workload ran in a particular environment and what constraints applied to it.

The fabric also does not treat model output as an authoritative engineering decision.

Deterministic controls and accountable review remain necessary where correctness, safety, or material change is involved.

The `ki` tool remains a governance mechanism for work, repositories, knowledge and skills. It does not become the fabric operator, credential broker or infrastructure control plane. A separate operator is a prospective implementation role whose provider adapters, executable and repository ownership remain undecided.

Controller operational state, credentials and environment checkpoints have their own authorities and retention rules. Durable repository outcomes and review evidence cross the integration boundary deliberately; operational state must not be indiscriminately committed as canonical knowledge, and provider snapshots must not become the sole recoverable result.

Only one active controller authority may act for a persona across deployments. Replication or relocation must prevent a stale controller from dispatching work or publishing results; the exact fencing and recovery mechanism remains an implementation decision.

## Implementation Questions

The architecture-level contract now defines the information and invariants implementations must preserve. Concrete implementations still need to decide:

- footprint schemas, compatibility claims and conformance tests;
- workload classification and data-handling levels;
- the policy or mechanism that records and enforces context eligibility and routing decisions;
- identity, access control, and secret-management patterns across execution tiers;
- observability, audit, and cost-accounting requirements; or
- single-controller fencing, failover and recovery behaviour for each workload class.

These questions require future Architecture Decision Records or operating-model chapters when implementation work makes them concrete.
