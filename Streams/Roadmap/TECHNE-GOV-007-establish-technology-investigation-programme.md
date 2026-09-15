---
note_type: stream-proposal
id: TECHNE-GOV-007
area: GOV
title: Establish technology investigation programme
theme: knowledge-governance
horizon: next
status: ready
priority: high
dependencies: []
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-14T02:20:28Z
updated_at: 2026-09-15T13:36:00Z
---

# Establish Technology Investigation Programme

## Goal

Give Knowledge Islands a finite, evidence-backed way to understand useful technologies and external agent capabilities, with Techne owning the investigation record and recommendation while reusable execution mechanisms remain separately governed.

## Context

Techne already owns [[Technology Radar]], but it does not yet define how candidates are investigated before a recommendation changes. Current interests include workflow automation, agent application frameworks, conversational interfaces, external skills, model evidence and agentic standards.

The programme must make learning repeatable without turning every candidate into an internal build. [[Agentic Operating Approach]] owns the overall architecture; this item owns the investigation method and responsibility boundary.

## Boundary

Establish the finite investigation method, ownership map and first portfolio. Do not perform every investigation, create a recurring calendar commitment, install or adopt a candidate, transfer another repository's work, create a new skill, or make a product-specific tool part of Techne's architecture.

Cross-repository reconciliation remains a later declared trade. The Agentic Harness may own portable evaluation mechanisms, adapters and conformance; Techne owns KI-specific evidence, applicability, radar posture and recommendation history.

## Current state

The Technology Radar defines Adopt, Trial, Assess and Hold positions and dated review expectations. The captured OPS-004 and OPS-005 investigations already describe bounded comparison problems, but there is no settled shared rubric, evidence contract or ownership decision.

## Steps

- [ ] Record the governance decision that Techne owns finite technology investigations and KI-specific recommendations.
- [ ] Define the investigation lifecycle from question and candidate selection through common scenario, failure and recovery evidence, recommendation, uncertainty and review trigger.
- [ ] Define the minimum evidence set: current primary sources, exact versions and configuration, reproducible artefacts, observed behaviour, portability, licence, operating effort, cost and exit cost.
- [ ] Distinguish vendor claims from observation and require a baseline, useful negative results and no automatic radar endorsement.
- [ ] Reconcile the first portfolio and ownership boundaries without transferring or reprioritising another repository's work.
- [ ] Update the Technology Radar review practice and cross-link the operating model.

## Files touched

- `Admin/Governance/Decisions/GDR-TECHNE-002-governing-technology-investigations.md`
- `Admin/Governance/Decisions/Decisions.md`
- `Pillars/Engineering Practice/Operating Model/Technology Investigation Programme.md`
- `Pillars/Engineering Practice/Operating Model/Operating Model.md`
- `Pillars/Engineering Practice/Technology/Technology Radar.md`
- `Streams/Roadmap/TECHNE-GOV-007-establish-technology-investigation-programme.md`

## Verify

- `ki repo audit --skill ki-decision-records --repo .` passes.
- `ki repo audit --skill ki-authoring --repo .` passes.
- `ki repo audit --skill ki-repo-kb-streams --repo .` passes.
- `ki repo audit --skill ki-repo-kb --repo .` passes.
- `git diff --check` passes.
- A judgmental review confirms the method allows direct use, configuration, thin adaptation, upstream contribution and custom implementation to compete against the same need.

## Dependencies / blocks

There are no delivery dependencies. OPS-004 and OPS-005 may apply the method after it is settled, but neither exploratory question depends on this item for validity.

## Delegation

One worker may draft the operating-method note and decision together. The coordinator owns vocabulary, cross-note consistency, lifecycle state and integration with the Radar.

## Documentation impact

### Decision Records

Add `GDR-TECHNE-002` because the programme assigns durable ownership and recommendation authority.

### Specifications

No executable specification is required until a reusable investigation mechanism is implemented.

### Guides

The operating-model note is the human procedure and evidence guide.

### Roadmap

Retain OPS-004 and OPS-005 as the first independently deliverable investigations. Capture later candidates only when they have a concrete question and boundary.

## Discussion

### First portfolio

- Workflow automation through OPS-004
- Agent application frameworks through OPS-005
- A later self-hosted conversational-interface investigation
- A later external-capability reuse investigation
- Model and agentic-standards work only after the existing Harness records are reconciled

### No automatic cadence

Begin with individually adopted, time-boxed investigations. A recurring tech day or housekeeping activity requires later evidence that repetition is useful.
