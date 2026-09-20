---
note_type: stream-proposal
id: TECHNE-GOV-012
area: GOV
title: Define governed work controller model
aliases:
  - Governed Work Controller Model
theme: agentic-architecture
horizon: now
status: awaiting-review
priority: high
dependencies: []
blocks: []
blocked_by: []
baseline_ref: af2ffe281c632ed43315d32f53cff57cedbbe24b
created_at: 2026-09-20T18:40:17Z
updated_at: 2026-09-20T18:44:26Z
---

# Define Governed Work Controller Model

## Goal

Define the personal controller as a controller for governed work, where work may be mechanical, agentic or hybrid, and make its relationship to sessions, executions, workers and deterministic operations explicit.

## Context

Techne already separates reasoning from deterministic control, makes controller placement independent from worker placement and distinguishes an execution from its disposable task environment. The architecture nevertheless describes the personal controller and Fabric predominantly through agent execution.

The retained controller proof now exposes the missing distinction. Telegram commands such as target listing and cancellation should remain direct deterministic operations. Natural-language interaction should be able to use controller-side reasoning, but that reasoning should invoke the same bounded operations rather than acquire unrestricted shell, Kubernetes or credential authority. Dispatched work may then run as a fixed program, an agent runtime or a deliberate combination of both.

Without this clarification, implementation could collapse the controller into either a command bot that cannot support continuing agentic interaction or a general agent that uses model reasoning for mechanical control-plane behaviour.

## Boundary

Clarify canonical Techne architecture and the active first-workload decision. Define responsibilities and invariants, not an API, portable schema, prompt, model, runtime, command syntax, persistence technology, deployment topology or implementation plan.

Retain one active controller authority for the persona. Do not imply that the controller process must host model inference, that a worker must retain a live agent process, or that every execution requires AI. Do not grant controller reasoning direct privileged infrastructure access.

Do not edit `ki-techne-harness`, `ki-specifications`, `ki-agentic-harness` or another repository. Any executable consequence becomes separately governed work in its owning repository.

## Current state

`[[Principles]]` requires deterministic control around probabilistic capability. `[[Agentic Operating Approach]]`, `[[AI Execution Fabric]]` and `[[Techne Fabric Execution Contract]]` establish persona, context, execution, target and task-environment boundaries, but do not yet present one coherent mechanical-agentic-hybrid controller model.

`TECHNE-OPS-009` is Ready to evaluate the first useful controller workload. Its repository-verification seed is deliberately mechanical and should prove a common workload execution path without being mistaken for proof of bounded agent-session continuity.

## Steps

- [x] Publish a canonical governed-work controller chapter that defines deterministic, agentic and hybrid request and workload paths.
- [x] Define controller session, workload, execution, task environment and worker responsibilities without coupling identity to a pod or deployment.
- [x] State that controller-side reasoning uses bounded controller operations shared with deterministic command handlers and cannot widen authority.
- [x] Generalise Fabric terminology from an agent-only footprint to a workload footprint that may include an agent runtime.
- [x] Describe the evolution path from exploratory agent behaviour to registered workload and, where justified, deterministic controller behaviour.
- [x] Integrate the model with the Architecture index, operating approach, engineering estate, Fabric and execution contract.
- [x] Amend `TECHNE-OPS-009` so its evaluation distinguishes the first mechanical workload proof from a later bounded agent-session proof.

## Files touched

- `Pillars/Engineering Practice/Architecture/Governed Work Controller.md`
- `Pillars/Engineering Practice/Architecture/Architecture.md`
- `Pillars/Engineering Practice/Architecture/Agentic Operating Approach.md`
- `Pillars/Engineering Practice/Architecture/Engineering Estate.md`
- `Pillars/Engineering Practice/Architecture/AI Execution Fabric.md`
- `Pillars/Engineering Practice/Architecture/Techne Fabric Execution Contract.md`
- `Streams/Roadmap/TECHNE-OPS-009-choose-first-controller-workload.md`
- `Streams/Roadmap/TECHNE-GOV-012-define-governed-work-controller-model.md`
- `Streams/Roadmap/_ISSUES.md`

## Verify

- The architecture explicitly supports mechanical, agentic and hybrid work without making every request or execution model-mediated.
- Explicit commands and controller reasoning converge on the same bounded operation and authority boundary.
- Session identity, execution identity and disposable task environments are distinct, and workers own none of the persona or session authority.
- Workload, controller, worker and model-inference placement remain independent provider-neutral decisions.
- The documents neither require persistent agent processes on workers nor permit unrestricted infrastructure tools for controller reasoning.
- `TECHNE-OPS-009` identifies the separate evidence supplied by mechanical workload and agent-session proofs.
- Every changed wikilink resolves uniquely.
- `ki repo audit --skill ki-authoring --repo .`, `ki repo audit --skill ki-repo-kb-streams --repo .`, `ki repo audit --skill ki-repo-kb --repo .`, `ki repo audit --skill ki-work --repo .` and `git diff --check` pass.

## Dependencies / blocks

No external dependency blocks this clarification. It consumes accepted Techne principles and controller/Fabric decisions. It informs `TECHNE-OPS-009` but does not select or implement that record's first workload.

## Delegation

Keep terminology changes and cross-document integration in one lane because the same vocabulary and authority boundary must remain coherent throughout. No delegation is needed for this bounded documentation change.

## Documentation impact

### Decision Records

No new Decision Record is required. The change clarifies and generalises the responsibilities already accepted by `ADR-TECHNE-001` and `ADR-TECHNE-002`; it does not reverse their isolation, persona or authority decisions.

### Specifications

Do not create a portable workload or session schema from this architecture change. Route one to `ki-specifications` only after runnable implementations provide stable evidence.

### Canonical architecture

Add one focused chapter and make minimal terminology amendments to the existing controller and Fabric chapters. Preserve `AI Execution Fabric` as the existing note identity while using Techne Fabric as the reader-facing name.

### Roadmap

Keep `TECHNE-OPS-009` focused on workload choice. It should recognise repository verification as a mechanical proof and record bounded agent-session support as distinct follow-on evidence, not expand into implementation.

## Review

### Delivered

Delivered the approved architecture clarification from immutable baseline `af2ffe281c632ed43315d32f53cff57cedbbe24b`. The change defines the controller as a coordinator of governed mechanical, agentic and hybrid work, generalises the Fabric footprint boundary and updates the first-workload decision without changing executable systems or another repository.

### Summary changes

- Added `[[Governed Work Controller]]` as the canonical model for request routing, workload forms, session and execution identity, worker responsibility and progressive mechanisation.
- Integrated the model into `[[Architecture]]`, `[[Agentic Operating Approach]]`, `[[Engineering Estate]]`, `[[AI Execution Fabric]]` and `[[Techne Fabric Execution Contract]]`.
- Generalised the reusable execution declaration to a workload footprint while retaining an agent footprint as its agentic specialisation.
- Updated `TECHNE-OPS-009` to distinguish evidence from a mechanical workload proof, bounded agent execution and session continuity.

### Verification

- `rumdl fmt` passed on every changed Markdown file after applying three safe list-spacing fixes.
- `ki repo audit --skill ki-authoring --repo .` passed.
- `ki repo audit --skill ki-repo-kb-streams --repo .` passed.
- `ki repo audit --skill ki-repo-kb --repo .` passed.
- `ki repo audit --skill ki-work --repo .` passed.
- `git diff --check` passed.
- Review confirmed `[[Governed Work Controller]]` resolves uniquely and the changed architecture retains independent controller, worker and model-inference placement.

### Outstanding concerns

No concern blocks review of this architecture change. It does not prove a natural-language controller path, durable controller-session storage or a bounded agent runtime; those remain implementation evidence rather than claims made by this work.

### Post-change review

The delivered documents meet the goal and remain within the approved documentation-only boundary. Mechanical and agentic paths now converge on one deterministic authority surface, session identity is separate from disposable compute, and existing provider-neutral isolation decisions remain intact. The change is ready for owner acceptance.

### Mini recap

Techne now describes one governed-work controller with mechanical, agentic and hybrid paths. OPS-009 remains the decision about the first useful workload and can evaluate repository verification as a mechanical proof without implying that agent-session continuity has been demonstrated. Runnable consequences should become separately governed work in `ki-techne-harness` after the workload decision supplies a concrete boundary.

## Discussion

### Controller paths

Recognised mechanical requests should call deterministic controller handlers directly. Natural-language requests may use controller reasoning to interpret intent, ask questions, select a registered operation or frame a bounded workload. Reasoning proposes; deterministic admission and operation boundaries enforce consequential action.

### Workload paths

A mechanical workload runs a purpose-built program. An agentic workload runs an eligible agent runtime within a bounded execution. A hybrid workload uses deterministic preparation, admission or verification around one or more agentic steps. All use the same execution identity, authority, evidence and cleanup concepts.

### Session continuity

A controller session is a logical continuity boundary for interaction, context and task coordination. It is not a worker pod, model process or Kubernetes object. A session may cause several executions, and an execution may recover into a replacement task environment without changing its identity or authority.

### Progressive mechanisation

Agentic behaviour may establish value while a task remains exploratory. Repeated stable patterns may become registered workloads, and sufficiently simple high-confidence operations may become direct deterministic controller handlers. Promotion requires observed repetition and a clearer reliability or cost boundary; it is not automatic replacement of reasoning.

### Approval

Kris Brown approved capture, readiness and implementation of this architecture clarification on 20 September 2026 after reviewing the distinction between deterministic controller behaviour and agentic support.
