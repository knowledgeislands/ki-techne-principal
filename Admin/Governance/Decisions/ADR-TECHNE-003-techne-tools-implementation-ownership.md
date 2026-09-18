---
note_type: admin/governance/decision
id: ADR-TECHNE-003
title: 'Techne tools implementation ownership'
date: 2026-09-18
status: current
decision_type: architecture
decision_type_url: https://knowledgeislands.info/specifications/decision-records/adr
decision_depends_on: [GDR-TECHNE-001, ADR-TECHNE-001, ADR-TECHNE-002]
---

# ADR-TECHNE-003: Techne tools implementation ownership

## Context

Techne Principal defines the engineering architecture for personal controllers and execution-fabric operators, but a knowledge base is not an appropriate long-term home for runnable services, installation artefacts, deployment resources or provider adapters. The initial Kubernetes controller proof placed those files in Techne Principal's temporary working area while the implementation owner remained deliberately unassigned.

The controller and fabric roles share release, bootstrap, deployment and integration concerns. Splitting their early implementation across several repositories would add version coordination before the product boundaries are stable, while placing them in Arcadia or Techne Principal would mix philosophy or canonical engineering knowledge with executable product state.

## Decision

Techne assigns `knowledgeislands/ki-techne-tools` as the product repository for runnable personal-controller and execution-fabric-operator implementations. It is one independently governed monorepo island for controller services, bootstrap tooling, deployment resources, provider adapters and their verification. The architectural roles remain distinct inside the product boundary and may separate later through another explicit decision.

Techne Principal retains authority for engineering meaning, roles, invariants and decision criteria. `ki-techne-tools` consumes that knowledge and owns implementation choices, source code, packaging, releases and operational documentation. It does not own persona identity, governed work, credentials, canonical execution evidence or accepted portable specifications merely because its software processes them.

## Consequences

- Executable controller and fabric work leaves Techne Principal once provenance and verification establish the new source location.
- The monorepo can ship coordinated installable artefacts while keeping one root dependency installation and one task graph.
- Implementations must preserve Techne's controller, authority, target and evidence boundaries without copying canonical architecture into product documentation.
- Operational credentials and state remain outside Git; bootstrap routes may deliver them directly to an authorised runtime store.
- Techne Principal and `ki-techne-tools` require explicit reciprocal work and knowledge routes, but neither repository gains write authority over the other.
- A later repository split remains possible when an independently versioned product boundary outweighs coordination cost.

## References

- [GDR-TECHNE-001](GDR-TECHNE-001-adopting-decision-records.md) — establishes Techne's Decision Records instrument.
- [ADR-TECHNE-001](ADR-TECHNE-001-provider-neutral-isolated-agent-execution.md) — establishes provider-neutral controller and isolated execution boundaries.
- [ADR-TECHNE-002](ADR-TECHNE-002-one-persona-across-explicit-working-contexts.md) — establishes persona continuity across explicit working contexts.
