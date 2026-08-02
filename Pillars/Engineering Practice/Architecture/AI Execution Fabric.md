# AI Execution Fabric

## Purpose

The AI Execution Fabric is the provider-neutral architecture for selecting and operating execution targets for AI-enabled engineering workloads.

It separates the workload's requirements from the infrastructure choice, so that the engineering estate can use local, managed, elastic, or dedicated capacity without coupling the overall architecture to a single provider.

The fabric is a decision and operating model, not a single runtime, service, or control plane.

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

## Routing Criteria

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

1. Classify the workload, including its objective, data sensitivity, interaction pattern, and continuity requirements.
2. Identify execution targets that satisfy the workload's non-negotiable constraints.
3. Compare eligible targets against capability, latency, privacy, cost, context length, locality, and availability.
4. Select the least complex target that meets the requirements and record material trade-offs.
5. Define a fallback or recovery approach when the workload depends on a target with limited availability or capacity.

This process supports explicit decisions while leaving room for implementation-specific automation in future operating guidance.

## Relationship to the Engineering Estate

[[Engineering Estate]] defines the roles of the components that create, orchestrate, persist, and review engineering work.

The AI Execution Fabric determines where an AI-enabled workload may execute.

It does not transfer accountability for intent, deterministic orchestration, persistent execution, engineering review, or knowledge governance away from the components that hold those responsibilities.

Local runtimes such as llama.cpp and MLX-LM are implementation options within the local execution tier.

They do not define the fabric itself or preclude managed, elastic, or dedicated execution.

## Operating Boundaries

The fabric must not obscure the data, identity, network, cost, and observability consequences of its routing choices.

Execution selection should therefore remain traceable enough for engineers to understand why a workload ran in a particular environment and what constraints applied to it.

The fabric also does not treat model output as an authoritative engineering decision.

Deterministic controls and accountable review remain necessary where correctness, safety, or material change is involved.

## Open Questions

The current architecture does not yet define:

- workload classification and data-handling levels;
- the policy or mechanism that records and enforces routing decisions;
- identity, access control, and secret-management patterns across execution tiers;
- observability, audit, and cost-accounting requirements; or
- failover and recovery behaviour for each workload class.

These questions require future Architecture Decision Records or operating-model chapters when implementation work makes them concrete.
