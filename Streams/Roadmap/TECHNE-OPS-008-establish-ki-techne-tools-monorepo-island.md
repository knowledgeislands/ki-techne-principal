---
note_type: stream-proposal
id: TECHNE-OPS-008
area: OPS
title: Establish ki-techne-tools monorepo island
aliases:
  - Techne Tools Monorepo Proposal
theme: operational-tooling
horizon: triage
status: draft
priority: high
dependencies: []
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-18T07:56:58Z
updated_at: 2026-09-18T07:56:58Z
---

# Establish ki-techne-tools Monorepo Island

## Goal

Establish `knowledgeislands/ki-techne-tools` as the implementation-owning monorepo island for Techne controllers, command-line interfaces, bootstrap tooling, deployment resources, provider adapters and other installable artefacts.

## Context

The `TECHNE-OPS-007` proof has crossed from architecture and evidence into an executable controller, Kubernetes resources, CloudFormation templates and secret-bootstrap behaviour. Keeping those artefacts in Techne Principal would turn a canonical engineering knowledge base into a product repository with release, dependency and operational lifecycles it explicitly does not own.

Arcadia Principal remains the canonical home for Knowledge Islands philosophy and model and explicitly does not mandate tooling implementation. Techne Principal translates that philosophy into engineering practice and owns architectural roles, boundaries, decisions and proof evidence. [[Engineering Estate]] and [[Techne Fabric Execution Contract]] deliberately leave the personal-controller and execution-fabric implementation owner unassigned; this proposal supplies that owner without transferring architectural authority.

Multiple small implementation repositories would separate controller, CLI, provider and deployment changes that share one release and integration boundary. A monorepo provides one root toolchain, one integration test surface and one governed product roadmap while allowing independently installable artefacts and packages.

## Boundary

Keep `ki-arcadia-principal` and `ki-techne-principal` as knowledge-base islands. Do not move canonical principles, architecture, decisions or sanitised proof evidence into the implementation repository.

Create one public sibling repository named `ki-techne-tools` under the `knowledgeislands` organisation only after its repository identity, licence, package manager, release ownership and initial workspace shape are approved. Prefer a Turborepo-compatible workspace if the selected implementation languages and packaging model justify it; do not adopt Turborepo merely as a name for an otherwise undefined monorepo.

Enforce root-owned dependency installation and prohibit package-local installation or ungoverned nested `node_modules` trees. Keep normative portable contracts in `ki-specifications`; implementation types and clients may consume or realise them without becoming their authority.

Retain the existing OPS-007 controller EC2 stack while repository work proceeds. Do not destroy, recreate or expand the live infrastructure as part of repository establishment. Pause bot-secret injection and live controller deployment until the executable source has an approved implementation home and the migration path preserves the already-verified checksums and proof baseline.

Do not silently absorb `tools-ki`, `tools-mgit`, Harness or unrelated engineering products. The new island owns Techne execution products and their installable artefacts, not every Knowledge Islands tool.

## Discussion

### Proposed product boundary

An initial repository may contain controller and CLI applications, shared controller and target packages, bootstrap and provider adapters, Kubernetes and cloud deployment resources, and end-to-end tests. Exact directories, language and package boundaries belong to planning and must follow actual release cohesion rather than a speculative package taxonomy.

### Existing proof migration

The executable OPS-007 package currently under `-/TECHNE-OPS-007-kubernetes-controller-proof/` is migration input, not the new repository's unquestioned production architecture. Preserve its dependency-free proof behaviour, security boundaries and tests while separating retained evidence from reusable implementation.

### Repository relationships

The new island should import engineering knowledge from Techne Principal, consume accepted portable contracts from `ki-specifications`, and export implementation evidence or work through governed trade routes. It should not acquire authority to edit either source directly merely because it implements their decisions.

### Promotion condition

Adopt this work only after confirming the repository identity, ownership boundary, initial workspace and package-install policy, the OPS-007 migration sequence, relationship declarations, verification gates and treatment of the retained controller stack.
