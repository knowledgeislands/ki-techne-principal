---
note_type: stream-proposal
id: TECHNE-OPS-004
area: OPS
title: Compare workflow automation tools
theme: operational-tooling
horizon: triage
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-14T02:20:28Z
updated_at: 2026-09-14T02:20:28Z
---

# Compare Workflow Automation Tools

## Goal

Determine where workflow automation tools could simplify Knowledge Islands work, using n8n and Node-RED as the initial comparison. Produce a practical recommendation about useful roles, limitations, and whether a controlled trial is worthwhile.

## Context

Kris Brown wants Techne to investigate established tools and learn from external implementations. Node-RED is the likely match for the recalled name, but that recollection is not confirmed. [[TECHNE-GOV-007-establish-technology-investigation-programme]] captures the wider programme.

Primary documentation reviewed on 2026-09-14 describes [n8n](https://docs.n8n.io/) as workflow automation combining AI features and business processes, and [Node-RED](https://nodered.org/) as low-code programming for event-driven applications. They have overlapping flow-building use cases, but should be compared against the same requirement rather than assumed interchangeable.

## Boundary

This investigation does not adopt an automation platform, replace existing KI execution controls, connect production accounts, or authorise consequential external actions. Additional candidates should enter only when they address an identified gap. Installation, credentials, paid services, and any canonical radar change belong in the subsequently approved experiment plan.

## Discussion

### Comparable experiment

Use a synthetic source-intake scenario: receive a fixture, validate and transform it, optionally call a stubbed enrichment service, produce a proposed knowledge note, pause for human approval, and write only to an isolated test destination. Compare both tools with a small scripted baseline using the same inputs and expected outputs.

Exercise duplicate events, a failing downstream service, restart during execution, and an approval that has not yet arrived. Observe actual guarantees about retries, duplicate side effects, state recovery, and review boundaries. A visible flow diagram alone does not establish durable execution or accountable approval.

### Questions to resolve

Assess how easily an engineer can understand, change, test, version, export, and recover the workflow. Compare integration coverage for the chosen problem, deployment effort, credential handling, evidence and logs, operating costs, licence constraints, and exit cost. Record which capabilities require hosted or paid features.

Distinguish deterministic workflow steps, optional model calls, and autonomous agent decisions. Establish whether KI needs a workflow engine for this scenario at all, and whether an adapter can preserve the existing authority boundary.

### Evidence and handoff

Retain exact versions, fixture and flow artefacts, reproduction instructions, observed failure behaviour, and a concise comparison against the baseline. Return role-specific findings, including useful negative results, and a proposed [[Technology Radar]] disposition with uncertainty and a review trigger.

Techne owns the experiment and recommendation. Only a demonstrated integration need becomes separate Harness or tools-repository work. This record can be shaped independently of the programme proposal; no live trial has yet been performed.
