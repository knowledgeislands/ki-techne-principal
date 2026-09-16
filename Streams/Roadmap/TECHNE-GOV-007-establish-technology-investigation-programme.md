---
note_type: stream-proposal
id: TECHNE-GOV-007
area: GOV
title: Establish technology investigation programme
theme: knowledge-governance
horizon: next
status: done
priority: high
dependencies: []
blocks: []
blocked_by: []
baseline_ref: 86e09cdc41b79cf35ea5b2c7ff97401396ada55e
created_at: 2026-09-14T02:20:28Z
updated_at: 2026-09-16T20:55:00Z
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

- [x] Record the governance decision that Techne owns finite technology investigations and KI-specific recommendations.
- [x] Define the investigation lifecycle from question and candidate selection through common scenario, failure and recovery evidence, recommendation, uncertainty and review trigger.
- [x] Define the minimum evidence set: current primary sources, exact versions and configuration, reproducible artefacts, observed behaviour, portability, licence, operating effort, cost and exit cost.
- [x] Distinguish vendor claims from observation and require a baseline, useful negative results and no automatic radar endorsement.
- [x] Reconcile the first portfolio and ownership boundaries without transferring or reprioritising another repository's work.
- [x] Update the Technology Radar review practice and cross-link the operating model.

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

## Review

### Delivered

From immutable baseline `86e09cdc41b79cf35ea5b2c7ff97401396ada55e`, the approved boundary produced a governance decision, a canonical technology-investigation programme, an Operating Model cross-link and strengthened Technology Radar review practice. It did not investigate or adopt a technology, create a cadence or capability, transfer work, or change another repository.

### Summary changes

- Added `GDR-TECHNE-002` to assign Techne ownership of KI-specific investigation evidence, recommendations and Radar posture while preserving separate ownership of reusable mechanisms.
- Defined a seven-stage investigation lifecycle and minimum evidence contract covering a common baseline, current sources, reproducibility, failure and recovery, licence, provider dependence, cost and exit cost.
- Made direct use, configuration, thin adaptation, upstream contribution, custom implementation and no change comparable outcomes.
- Required claims to remain distinct from observation, allowed useful negative results, and withheld automatic endorsement, Radar movement and recurring scheduling.
- Cross-linked the programme from the Operating Model and Technology Radar without changing any current Radar entry.

There were no approved deviations.

### Verification

- `ki repo audit --skill ki-decision-records --repo .` — passed.
- `ki repo audit --skill ki-authoring --repo .` — passed.
- `ki repo audit --skill ki-repo-kb-streams --repo .` — passed.
- `ki repo audit --skill ki-repo-kb --repo .` — passed.
- `git diff --check` — passed.
- Judgmental review — passed: the programme compares direct use, configuration, thin adaptation, upstream contribution and custom implementation against the same stated need and permits no change as an evidence-backed result.

### Outstanding concerns

None within the approved delivery. The first candidate investigations remain separate work, and no claim has been made about n8n, Node-RED, LangChain, LangGraph or LangSmith behaviour. Cross-repository ownership reconciliation remains subject to a later declared trade.

### Post-change review

The delivered notes meet the goal and preserve the approved boundary. They establish a finite, provider-neutral investigation method without making an AWS service, product, recurring event or internal implementation the default. The primary regression risk is duplicated or weaker method prose in later investigations; the canonical programme and Radar cross-link provide one review point. The item is ready for acceptance review.

### Mini recap

Techne now has a governed route from a practical technology question to reproducible evidence and a proportionate recommendation. Durable learning routes to [[Technology Investigation Programme]], [[Technology Radar]] and [[GDR-TECHNE-002-governing-technology-investigations|GDR-TECHNE-002]]. Candidate evaluation and any reusable tooling remain independently governed work.

## Done

Accepted on 2026-09-16 by Kris Brown through explicit approval to continue the roadmap build-out. The current review packet and repository audits provide acceptance evidence.

## Discussion

### First portfolio

- Workflow automation through OPS-004
- Agent application frameworks through OPS-005
- A later self-hosted conversational-interface investigation
- A later external-capability reuse investigation
- Model and agentic-standards work only after the existing Harness records are reconciled

### No automatic cadence

Begin with individually adopted, time-boxed investigations. A recurring tech day or housekeeping activity requires later evidence that repetition is useful.
