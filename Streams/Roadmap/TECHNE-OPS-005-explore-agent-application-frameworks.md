---
note_type: stream-proposal
id: TECHNE-OPS-005
area: OPS
title: Explore agent application frameworks
theme: operational-tooling
horizon: triage
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-14T02:20:28Z
updated_at: 2026-09-14T02:20:28Z
---

# Explore Agent Application Frameworks

## Goal

Build an accessible understanding of the LangChain ecosystem and determine when its components add useful capability to Knowledge Islands. Compare a small agent workflow with a simple baseline so any recommendation rests on observed value and complexity.

## Context

Kris Brown identified this as an area where more understanding is needed. [[TECHNE-GOV-007-establish-technology-investigation-programme]] provides the wider programme context, while [[TECHNE-OPS-004-compare-workflow-automation-tools]] explores an adjacent visual-automation approach.

Primary documentation reviewed on 2026-09-14 distinguishes [LangChain](https://docs.langchain.com/oss/python/langchain/overview), which provides configurable agent loops and model/tool integrations; [LangGraph](https://docs.langchain.com/oss/python/langgraph/overview), which provides stateful orchestration, persistence, and human intervention; and [LangSmith](https://docs.langchain.com/langsmith/observability), which provides tracing and evaluation capabilities across frameworks. These are related components with different purposes, not one indivisible technology choice.

## Boundary

The initial outcome is understanding and a bounded comparison, not selection of a new KI agent architecture. It does not replace the Harness, build a general agent platform, require LangSmith adoption, transmit private knowledge, or authorise model spend. Hands-on setup and data boundaries must be explicit in the later experiment plan. Production implementation and canonical recommendations remain separate reviewed consequences.

## Discussion

### Concepts to make clear

Explain model calls, tools, agent loops, workflows, state, memory, retrieval, persistence, evaluation, and tracing through one small example. Distinguish a graph controlling execution from a graph storing knowledge; using LangGraph does not itself establish a knowledge-graph architecture.

Explain the difference between a runtime library's agent harness and the Knowledge Islands repository of reusable capabilities. Similar terminology does not make their responsibilities identical or prove that one must replace the other.

### Comparable experiment

Start with a synthetic source-to-proposed-note task and a direct model/tool implementation as the control. Use fixed fixtures and stubbed model responses for deterministic failure checks. Compare a LangChain agent with an explicit LangGraph workflow where branching, retained state, or human review is required. Examine LangSmith's additional tracing and evaluation value separately from the execution comparison.

Test a tool failure, restart from saved state, duplicate side effects, and pause/resume around approval. Retain comparable outputs, traces, implementation size, setup effort, runtime costs where measured, and recovery results. Use a real model only if the approved proof needs it and has an explicit cost and data boundary.

### Evaluation questions

Identify which abstractions remove useful work and which make control flow harder to follow. Compare testability, portability, model-provider substitution, persistence dependencies, debugging, maintenance, and exit cost. Separate framework-provided mechanisms from guarantees the application must still implement.

Assess direct use, configuration, a thin adapter, and substantial integration. Preserve lessons that improve KI even if no framework is adopted. Deep Agents and other adjacent frameworks are follow-up candidates only when a concrete missing requirement justifies expanding the comparison.

### Evidence and ownership

Produce a short conceptual guide, a reproducible comparison, and role-specific findings suitable for a proposed [[Technology Radar]] update. Broader standards questions should feed the reconciliation of `KI-HARNESS-REV-002`; model ranking and route comparisons remain distinct from framework behaviour.

Techne owns the explanation, experimental evidence, and recommendation. The Harness receives only subsequently approved reusable capability or adapter work. No experiment has yet been executed, and this record has no delivery dependency on the programme proposal or the workflow-tool comparison.
