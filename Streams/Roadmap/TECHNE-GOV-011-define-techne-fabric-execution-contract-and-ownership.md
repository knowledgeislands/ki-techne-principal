---
note_type: stream-proposal
id: TECHNE-GOV-011
area: GOV
title: Define Techne Fabric execution contract and ownership
theme: agentic-architecture
horizon: next
status: draft
priority: high
dependencies: []
blocks: [TECHNE-OPS-003]
blocked_by: []
baseline_ref: null
created_at: 2026-09-16T21:28:17Z
updated_at: 2026-09-16T21:28:17Z
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

## Discussion

### Intended outcome

The result should make one bounded local proof possible without making Kubernetes, AWS, Fly.io, LangGraph or another product part of the architecture. It should identify which semantics belong in Techne and which executable contracts belong in an implementation repository.

### Roadmap relationship

`TECHNE-OPS-003` becomes a later proof of the accepted contract and remains Draft until this work and its own cost, security and ownership prerequisites are resolved. `TECHNE-OPS-002` remains an independent supervised-working-mode investigation. `TECHNE-OPS-004` and `TECHNE-OPS-005` remain parked until concrete operational or runtime needs supply decision-useful return triggers. `TECHNE-OPS-006` remains unadopted Triage until a distinct substrate question survives the contract and first proof.
