# Techne Fabric Execution Contract

## Purpose

The Techne Fabric execution contract defines the architecture-level information and invariants required to admit, run, review and clean up one bounded agent execution. It lets controllers, operators, runtimes and execution targets remain replaceable while preserving the same intent, authority and evidence boundary.

This chapter defines meaning and responsibility. It is not a portable schema, API, provider adapter or component runbook. Normative schemas and conformance rules belong to `ki-specifications` after implementations supply enough evidence to standardise them.

## Contract Boundary

An execution contract binds one objective to one immutable repository baseline, one working context, one authority envelope, one versioned agent footprint, one eligible execution target, one evidence destination and one lifetime. Admission records the binding before consequential work begins.

The contract does not grant authority. It carries authority already established through the applicable governance and approval process. A target, runtime, network path, repository checkout or conversational interface cannot widen it.

## Required Bindings

Every execution identifies:

- the objective, explicit exclusions and completion condition;
- the immutable source revision and intended result destination;
- the working context, applicable repositories, data-handling constraints and review path;
- the authority source, allowed operations, approval points, expiry and revocation behaviour;
- the agent-footprint identity and version, runtime, tools, bootstrap requirements, resource bounds, state behaviour and supported human attachment;
- the target identity and declared capabilities used to establish eligibility;
- the filesystem, process and network isolation expected from the task environment;
- the credential classes and network destinations permitted without embedding credential values;
- the evidence required for review, recovery and reconciliation; and
- the lifetime, persistence policy, cleanup condition and fallback when cleanup cannot be proved.

Values may be represented differently by implementations, but their meaning cannot be discarded or inferred solely from provider state.

## Eligibility Decision

Admission is a deterministic decision around potentially probabilistic work. The controller supplies the objective, context and authority. The footprint declares requirements. A target declares capabilities and operating constraints. The fabric operator admits the execution only when the context permits the work, every non-negotiable footprint requirement is satisfied and the evidence and cleanup routes are available.

The decision record for one execution states the considered footprint and target versions, matched capabilities, rejected alternatives when material, unresolved assumptions and the reason the selected combination is proportionate. Connectivity or shared ownership alone does not establish eligibility.

## Lifecycle

The architectural lifecycle has the following observable transitions:

1. **Proposed** — objective, context and requested authority are known, but no capacity is allocated.
2. **Admitted** — authority, footprint and target eligibility are validated against an immutable baseline.
3. **Provisioned** — the bounded task environment exists and readiness checks pass.
4. **Running** — the runtime performs only the admitted assignment.
5. **Paused or attached** — work retains its original context and authority while awaiting input or deliberate human attachment.
6. **Stopped, failed or completed** — execution ends with an explicit outcome and no implicit retry or scope expansion.
7. **Reconciled** — result references, verification and material evidence reach the governed review boundary.
8. **Cleaned** — ephemeral capacity, credentials and temporary state are removed, or an explicit retained-state policy and owner are recorded.

Recovery may recreate a task environment, but it preserves the execution identity, immutable bindings and deduplication boundary. A replacement environment does not create new authority.

## Invariants

- Context and authority remain bound to the execution until a separately validated change creates a new grant.
- The source baseline, footprint version and target-capability evidence remain identifiable after the environment disappears.
- Footprints contain no assignment credentials, private repository contents or provider-specific authority.
- Targets supply capability and capacity; they do not own task identity, approval or durable work state.
- One writer owns each working copy or equivalent write assignment at a time.
- Provider snapshots and controller checkpoints may aid recovery but cannot be the only recoverable record of accepted work.
- Evidence reaches the governed review boundary before destructive cleanup removes its only source.
- Completion, failure, expiry and cleanup are observable outcomes; silence is not success.
- Retries, recovery and human attachment preserve idempotency and cannot silently widen scope.

## Evidence Envelope

Review evidence records the execution identity, objective, baseline, context and authority references; footprint and target versions; eligibility decision; effective isolation, network and credential constraints; lifecycle transitions; result references; verification outcomes; deviations; resource and cost observations where material; and cleanup or retained-state evidence.

The evidence envelope is proportionate to consequence. A read-only documentation check needs less operational evidence than an unattended execution holding credentials or creating infrastructure, but both retain enough information to explain what ran, under whose authority, against which source and with what result.

## Ownership

- **Techne Principal** owns the engineering meaning, responsibilities, invariants and decision criteria in this chapter.
- **`ki-specifications`** owns any accepted normative portable schema, conformance rule, template or reference example.
- **`ki-agentic-harness`** owns reusable agentic capabilities and harness-compatible semantics that implementations can expose.
- **`tools-ki`** owns CLI and deterministic platform behaviour it implements; governance commands do not thereby become fabric operation.
- **`ki-techne-tools` personal-controller implementation** owns persona continuity, execution identity, context binding, delegated authority, credential brokerage, supervision and result integration in runnable software.
- **`ki-techne-tools` execution-fabric-operator implementation** owns admission enforcement, provisioning, dispatch, observation, evidence return and cleanup through replaceable adapters.
- **Agent runtimes** own task performance inside the admitted environment without redefining authority or evidence.
- **Provider adapters** translate the portable contract to provider operations without exporting provider-specific fields into the architecture-level contract.

The two implementation roles share a product repository but remain architecturally distinct. `ki-techne-tools` owns runnable implementation and release choices; Techne Principal owns the meaning and decision criteria in this contract.

## Proof Entry Criteria

A provider proof may begin only when it names the exact footprint and target capability profile, implementation owner, authority and data boundary, cost ceiling, evidence destination, cleanup test and fallback. The simplest local or generic target should validate the portable boundary before a paid or provider-specific target is used.

A successful proof demonstrates the same execution bindings and evidence meaning across targets. It does not require identical provider mechanisms. Any normative specification or reusable implementation discovered by the proof becomes separately governed receiver work.

## Relationships

[[AI Execution Fabric]] defines target selection and placement around this contract.

[[Engineering Estate]] defines the architectural roles that supply and consume it.

[[Agentic Operating Approach]] places the contract within the wider flow from human intent to governed outcome.

[[ADR-TECHNE-001-provider-neutral-isolated-agent-execution|ADR-TECHNE-001]] records the provider-neutral isolation decision.

[[ADR-TECHNE-003-techne-tools-implementation-ownership|ADR-TECHNE-003]] records the implementation-owner decision.

Return to [[Architecture]].
