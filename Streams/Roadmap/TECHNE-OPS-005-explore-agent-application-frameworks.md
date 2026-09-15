---
note_type: stream-proposal
id: TECHNE-OPS-005
area: OPS
title: Explore agent application frameworks
theme: operational-tooling
horizon: next
status: ready
priority: medium
dependencies: []
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-14T02:20:28Z
updated_at: 2026-09-15T13:38:00Z
---

# Explore Agent Application Frameworks

## Goal

Explain the LangChain ecosystem through one reproducible comparison and determine when its abstractions add useful capability over direct control without making the framework part of Techne's architecture.

## Context

LangChain's high-level agents run on LangGraph, so the useful comparison is between abstraction levels rather than three independent engines: a direct explicit control, a LangChain agent and an explicit LangGraph workflow. LangSmith is a separate commercial observability and evaluation service and must be assessed independently.

This investigation applies [[Technology Investigation Programme]] to a synthetic source-to-proposed-note scenario. A graph controlling execution is not a knowledge graph, and a runtime library's agent harness is not the Knowledge Islands repository of reusable capabilities.

## Boundary

Use Python, public synthetic fixtures and deterministic fake model outputs only. Do not use private KI content, credentials, a real model, provider integration packages, tracing, LangSmith accounts or services, AWS, Kubernetes, controller architecture, another repository, or production recommendations beyond a proposed reviewed Radar posture.

Lock dependencies from public PyPI before execution, then disable outbound sockets for the runtime comparison. Use only JSON-serialisable test state, set strict MessagePack handling, and require a non-vulnerable SQLite checkpointer release.

## Current state

Current official LangChain, LangGraph and LangSmith documentation and upstream licences have been reviewed. Python and `uv` are locally available. No package, account, key or model call has been used for this investigation.

## Steps

- [ ] Freeze current source dates, versions, dependency tree, licences and the shared evidence rubric.
- [ ] Implement one small direct explicit state machine and tool loop for the common scenario.
- [ ] Implement the same behaviour with LangChain `create_agent` and a scripted fake chat model.
- [ ] Implement the same behaviour as an explicit LangGraph state graph with SQLite persistence, approval interrupt and idempotent write node.
- [ ] Test happy path, deterministic tool failure, rejection with no write, pause and resume in a fresh process, and duplicate resume with exactly one side effect.
- [ ] Assess LangSmith's documented tracing, evaluation, licensing and self-hosting trade-offs without creating an account or sending a trace.
- [ ] Publish dated evidence, an accessible conceptual guide and a role-specific proposed Radar disposition.

## Files touched

- `-/TECHNE-OPS-005-agent-framework-comparison/README.md`
- `-/TECHNE-OPS-005-agent-framework-comparison/pyproject.toml`
- `-/TECHNE-OPS-005-agent-framework-comparison/uv.lock`
- `-/TECHNE-OPS-005-agent-framework-comparison/fixtures/source.json`
- `-/TECHNE-OPS-005-agent-framework-comparison/src/framework_comparison/`
- `-/TECHNE-OPS-005-agent-framework-comparison/tests/test_comparison.py`
- `-/TECHNE-OPS-005-agent-framework-comparison/results/comparison.json`
- `Resources/LangChain Agent Ecosystem.md`
- `Resources/Resources.md`
- `Pillars/Engineering Practice/Technology/Agent Application Frameworks.md`
- `Pillars/Engineering Practice/Technology/Technology.md`
- `Streams/Roadmap/TECHNE-OPS-005-explore-agent-application-frameworks.md`

## Verify

- `uv lock --check --project ./-/TECHNE-OPS-005-agent-framework-comparison` passes.
- `LANGSMITH_TRACING=false LANGGRAPH_STRICT_MSGPACK=true uv run --project ./-/TECHNE-OPS-005-agent-framework-comparison pytest -q --disable-socket` passes.
- The restart test launches a fresh process against the same SQLite file and thread.
- Accepted and duplicate-resume cases produce exactly one side effect; rejection produces none.
- Comparable JSON results retain exact versions, source lines of code, setup effort, output equality, recovery behaviour and exit cost.
- `ki repo audit --skill ki-authoring --repo .`, `ki repo audit --skill ki-repo-kb-streams --repo .`, `ki repo audit --skill ki-repo-kb --repo .`, and `git diff --check` pass.

## Dependencies / blocks

There are no delivery dependencies. In a shared batch, run the programme item first to freeze the evidence vocabulary; keep this experiment and OPS-004 isolated because neither needs the other and they have distinct outputs.

## Delegation

One isolated worker may own the experiment directory and factual source note. The coordinator owns the conceptual guide, lifecycle state and shared Technology index integration.

## Documentation impact

### Decision Records

No Decision Record is required because the item compares abstractions without adopting a framework.

### Specifications

The retained fixture, expected outputs and failure cases form the experiment contract.

### Guides

The experiment README must document exact reproduction, network isolation and cleanup.

### Roadmap

Any adoption, production integration, LangSmith trial or reusable adapter becomes a separately reviewed follow-up.

## Discussion

### Primary source entry points

- [LangChain overview](https://docs.langchain.com/oss/python/langchain/overview)
- [LangChain unit testing](https://docs.langchain.com/oss/python/langchain/test/unit-testing)
- [LangGraph overview](https://docs.langchain.com/oss/python/langgraph/overview)
- [LangGraph persistence](https://docs.langchain.com/oss/python/langgraph/persistence)
- [LangGraph interrupts](https://docs.langchain.com/oss/python/langgraph/interrupts)
- [LangSmith observability concepts](https://docs.langchain.com/langsmith/observability-concepts)
- [LangSmith self-hosting](https://docs.langchain.com/langsmith/self-hosted)
- [LangGraph SQLite checkpointer advisory](https://github.com/langchain-ai/langgraph/security/advisories/GHSA-9rwj-6rc7-p77c)

### Interpretation to test

Direct control should remain the clarity baseline. LangChain may reduce ordinary model-and-tool plumbing, while explicit LangGraph may justify its complexity only when durable state, branching or human interruption materially simplifies the application. LangSmith's value and proprietary operating dependency must be considered separately.
