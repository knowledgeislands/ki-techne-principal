---
note_type: stream-proposal
id: TECHNE-GOV-011
area: GOV
title: Define Techne Fabric execution contract and ownership
theme: agentic-architecture
horizon: next
status: done
priority: high
dependencies: []
blocks: [TECHNE-OPS-003]
blocked_by: []
baseline_ref: 8c5837c0674b4f588f6871777d371b27a90bbba8
created_at: 2026-09-16T21:28:17Z
updated_at: 2026-09-16T21:47:22Z
---

# Define Techne Fabric Execution Contract and Ownership

## Goal

Define the minimum portable contract for a Techne Fabric execution and assign each executable responsibility to an owning component or repository before provider-specific or framework-specific proofs begin.

## Context

[[Agentic Operating Approach]] and [[AI Execution Fabric]] establish the architectural roles, working contexts, modes, footprints, executions, environments and targets. The current architecture still leaves footprint compatibility, workload and data classification, context eligibility, identity and secrets, evidence, observability, cost accounting, fencing and recovery unresolved.

The active roadmap had begun moving directly into AWS, workflow-engine and agent-framework experiments. That ordering risks allowing implementation choices to become architecture. This record restores [[Principles|Architecture Before Implementation]] by defining the provider-neutral contract and ownership boundary first.

## Boundary

Define the architectural semantics and minimum evidence for working context, workload classification, agent footprint, execution identity, target capability, authority, data handling, network and credential constraints, evidence return, cleanup, recovery and compatibility claims. Assign governance, controller, fabric-operator, runtime and provider-adapter responsibilities to their proper owners.

Do not implement a controller or fabric operator, select a required provider or framework, provision infrastructure, create credentials, prescribe one deployment topology, or edit another repository. Any receiver-owned executable specification or implementation becomes a separately accepted trade or local work record.

## Current state

The roles and principles are canonical, but no complete contract lets an implementation prove that a footprint is eligible for a target, that an execution retained its context and authority, or that returned evidence and cleanup satisfy the operating model. No executable owner has been selected for the prospective fabric operator.

## Steps

- [x] Reconcile the accepted Techne architecture and shared repository-ownership decision into one vocabulary for context, footprint, execution, task environment, target and evidence.
- [x] Define the minimum architecture-level execution contract: immutable bindings, lifecycle transitions, eligibility inputs, security and data constraints, returned evidence, cleanup, expiry, recovery and compatibility claims.
- [x] Define the ownership boundary between Techne semantics, portable normative specifications, governance, the personal controller, a prospective fabric operator, agent runtimes and provider adapters. Leave a role explicitly unassigned when no current repository owns it.
- [x] Amend `ADR-TECHNE-001` in place so its provider-neutral execution decision and consequences reflect the clarified contract and ownership boundary without turning the Decision Record into a schema.
- [x] Publish a canonical execution-contract chapter, integrate it with the Fabric and Engineering Estate, and update the estate diagram only where the clarified relationships materially change it.
- [x] Identify exact receiver-owned specifications or implementations as later trades or roadmap work. Do not create or deliver them inside this item.

## Files touched

- `Admin/Governance/Decisions/ADR-TECHNE-001-provider-neutral-isolated-agent-execution.md`
- `Pillars/Engineering Practice/Architecture/Techne Fabric Execution Contract.md`
- `Pillars/Engineering Practice/Architecture/AI Execution Fabric.md`
- `Pillars/Engineering Practice/Architecture/Engineering Estate.md`
- `Pillars/Engineering Practice/Architecture/Architecture.md`
- `Pillars/Engineering Practice/Architecture/Diagrams/Engineering Estate.mmd` only if the relationship model changes
- `Pillars/Engineering Practice/Architecture/Diagrams/Engineering Estate.svg` only with a matching source change
- `Streams/Roadmap/TECHNE-GOV-011-define-techne-fabric-execution-contract-and-ownership.md`

## Verify

- `ki repo audit --skill ki-decision-records --repo .` passes.
- `ki repo audit --skill ki-authoring --repo .` passes.
- `ki repo audit --skill ki-repo-kb-streams --repo .` passes.
- `ki repo audit --skill ki-repo-kb --repo .` passes.
- `git diff --check` passes.
- Every new or changed wikilink resolves to one canonical note.
- Any changed Mermaid source and rendered SVG describe the same relationships.
- Judgmental review confirms provider, runtime and product names remain replaceable mappings; every executable responsibility has a named owner or is explicitly unassigned; and `TECHNE-OPS-003` can derive a bounded proof without inventing architecture.

## Dependencies / blocks

The shared fundamentals reconciliation was accepted in `fbf73b983414c6ca5b4ef7dd56e15785b37586b1` and its completed roadmap record was pruned in `f049644dc630cd28ae4271481510f99dd952f0fd`. This work blocks `TECHNE-OPS-003`; the AWS proof must consume the accepted contract rather than define it through implementation.

## Delegation

Keep the architecture synthesis, Decision Record amendment and ownership judgment in one coordinator lane because they share one vocabulary and decision boundary. A bounded worker may check wikilinks or diagram parity after the prose is stable.

## Documentation impact

### Decision Records

Amend `ADR-TECHNE-001` because it already owns provider-neutral isolated agent execution. Create no new Decision Record unless implementation exposes a genuinely independent architectural decision.

### Specifications

Techne defines architecture-level semantics only. Any normative portable schema, conformance rule or reference example follows the accepted shared ownership model and becomes separately accepted receiver work.

### Guides

No component runbook or provider setup guide belongs in this item.

### Roadmap

Keep `TECHNE-OPS-003` Draft and dependency-blocked. Do not promote `TECHNE-OPS-006` or resume the parked tool comparisons merely because the contract names extension points.

## Review

### Delivered

From immutable baseline `8c5837c0674b4f588f6871777d371b27a90bbba8`, the approved boundary produced one canonical Techne Fabric execution contract, clarified the Fabric and Engineering Estate ownership model, and amended the existing provider-neutral execution decision in place. It did not create a controller, fabric operator, portable schema, provider adapter or infrastructure deployment.

### Summary changes

- Defined the required execution bindings, deterministic eligibility decision, observable lifecycle, invariants, evidence envelope and proof-entry criteria.
- Assigned architecture semantics to Techne, normative portable specifications to `ki-specifications`, reusable capabilities to `ki-agentic-harness` and implemented CLI behaviour to `tools-ki`.
- Left personal-controller and execution-fabric-operator implementations explicitly unassigned instead of inventing a product or repository owner.
- Integrated the contract into the Techne Fabric, Engineering Estate and Architecture index.
- Amended `ADR-TECHNE-001` as the existing owner of provider-neutral isolated execution rather than creating a duplicate decision.

The estate diagram was not changed because the stable roles and relationships remain the same; the delivery clarifies the contract crossing those relationships.

### Verification

- `ki repo audit --skill ki-decision-records --repo .` — passed.
- `ki repo audit --skill ki-authoring --repo .` — passed after one mechanical list-spacing correction.
- `ki repo audit --skill ki-repo-kb-streams --repo .` — passed.
- `ki repo audit --skill ki-repo-kb --repo .` — passed.
- `git diff --check` — passed.
- Wikilink review — passed for every new or changed link.
- Judgmental review — passed: product and provider names remain replaceable mappings, each executable responsibility has an owner or is explicitly unassigned, and `TECHNE-OPS-003` can consume the contract without defining architecture through AWS implementation.

### Outstanding concerns

No implementation owner has yet been selected for the personal controller or fabric operator. No normative schema or conformance suite exists, and no local or provider proof has been run. Those are deliberate downstream outcomes requiring receiver-owned work and evidence; they are outside this architecture item.

### Post-change review

The delivery meets the goal and restores architecture-before-implementation ordering. It gives later proofs a stable semantic boundary while respecting Techne's non-goal of owning executable behaviour or portable normative contracts. The main regression risk is a future implementation silently narrowing or widening the contract through provider-specific fields; the ownership boundary and proof-entry criteria make that visible for review.

### Mini recap

Techne now defines what a bounded Fabric execution must preserve from intent through cleanup, who owns each layer of meaning or implementation, and what must be known before a provider proof begins. Durable learning routes to [[Techne Fabric Execution Contract]], [[AI Execution Fabric]], [[Engineering Estate]] and [[ADR-TECHNE-001-provider-neutral-isolated-agent-execution|ADR-TECHNE-001]].

## Done

Accepted on 2026-09-16 by Kris Brown after reviewing the execution flow, deterministic admission boundary, lifecycle, invariants, ownership allocation, downstream proof criteria and deliberately unimplemented concerns. The current review packet and repository audits provide acceptance evidence.

## Discussion

### Intended outcome

The result should make one bounded local proof possible without making Kubernetes, AWS, Fly.io, LangGraph or another product part of the architecture. It should identify which semantics belong in Techne and which executable contracts belong in an implementation repository.

### Roadmap relationship

`TECHNE-OPS-003` becomes a later proof of the accepted contract and remains Draft until this work and its own cost, security and ownership prerequisites are resolved. `TECHNE-OPS-002` remains an independent supervised-working-mode investigation. `TECHNE-OPS-004` and `TECHNE-OPS-005` remain parked until concrete operational or runtime needs supply decision-useful return triggers. `TECHNE-OPS-006` remains unadopted Triage until a distinct substrate question survives the contract and first proof.
