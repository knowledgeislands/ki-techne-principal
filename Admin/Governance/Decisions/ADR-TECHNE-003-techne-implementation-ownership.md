---
note_type: admin/governance/decision
id: ADR-TECHNE-003
title: Techne implementation ownership
date: 2026-09-18
status: current
decision_type: architecture
decision_type_url: https://knowledgeislands.info/specifications/decision-records/adr
decision_depends_on: [GDR-TECHNE-001, ADR-TECHNE-001, ADR-TECHNE-002]
---

# ADR-TECHNE-003: Techne implementation ownership

## Context

Techne Principal defines the engineering architecture for personal controllers and execution-fabric operators, but a knowledge base is not an appropriate long-term home for runnable services, installation artefacts, deployment resources or provider adapters. The initial Kubernetes controller proof therefore required an independently governed implementation home.

Techne originally assigned controller, operator and release implementation to one `ki-techne-harness` monorepo while product boundaries were still emerging. Accepted implementation evidence now establishes two independently versioned products: the runnable controller and execution-fabric harness, and the `techne` operator interface. Coupling their releases would make an operator-tool update depend on unrelated harness application or image changes.

## Decision

Techne assigns implementation ownership across two independently governed repositories:

- `knowledgeislands/ki-techne-harness` owns deployable personal-controller and execution-fabric applications, runtime payloads, deployment resources, provider operations, packaging and verification for the harness.
- `knowledgeislands/tools-techne` owns the `techne` operator interface: command grammar, local diagnostics, authentication coordination, installation, semantic versioning, release archives and downstream package-manager handoff.

The CLI may operate or deploy harness capabilities only through explicit command and artefact contracts. It must not assume that harness source is co-located, that both repositories share a version, or that changing a harness image requires a CLI release. The harness must not publish a second authoritative `techne` executable.

Techne Principal retains authority over engineering meaning, roles, invariants and decision criteria. Each implementation repository consumes that knowledge and owns implementation choices within its declared boundary, but none gains write authority over another.

## Consequences

- Runnable controller and execution-fabric work belongs in Techne Harness; operator-interface and CLI release work belongs in `tools-techne`.
- Harness applications and images can evolve independently from the installed operator tool.
- Cross-repository integration requires explicit, versioned or immutable interfaces rather than source-tree adjacency.
- Public CLI publication and Homebrew packaging begin only from an accepted `tools-techne` release and its immutable checksums.
- Persona identity, governed work, credentials, canonical execution evidence and accepted portable specifications remain outside both implementation repositories unless another governing decision assigns them.

## References

- [GDR-TECHNE-001](GDR-TECHNE-001-adopting-decision-records.md) — establishes Techne's Decision Records instrument.
- [ADR-TECHNE-001](ADR-TECHNE-001-provider-neutral-isolated-agent-execution.md) — establishes provider-neutral controller and isolated execution boundaries.
- [ADR-TECHNE-002](ADR-TECHNE-002-one-persona-across-explicit-working-contexts.md) — establishes persona continuity across explicit working contexts.
- Techne Harness `TECHNE-TOOLS-OPS-006` — accepted the standalone CLI extraction and retained harness boundary.
