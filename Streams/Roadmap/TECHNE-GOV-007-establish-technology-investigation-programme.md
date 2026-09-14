---
note_type: stream-proposal
id: TECHNE-GOV-007
area: GOV
title: Establish technology investigation programme
theme: knowledge-governance
horizon: triage
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-14T02:20:28Z
updated_at: 2026-09-14T02:20:28Z
---

# Establish Technology Investigation Programme

## Goal

Give Knowledge Islands a consolidated, evidence-backed understanding of useful technologies and external agent capabilities, maintained by Techne through a technology radar and bounded investigative tech days. Establish the ownership, evaluation method, and initial investigation portfolio so learning informs deliberate reuse and implementation.

## Context

Kris Brown identified workflow automation, agent application frameworks, and external skills as areas Knowledge Islands should understand, including n8n, probably Node-RED, and the LangChain ecosystem. Earlier candidates in the same discussion were LibreChat and Build with Claude. The expressed direction is to learn from and use external work where it fits; internal authorship is not a prerequisite for usefulness.

Techne already owns [[Technology Radar]], with Adopt, Trial, Assess, and Hold positions, dated review expectations, and evidence for category changes. Its current coverage does not include these candidates. The missing work is a broader investigation practice and consolidation of overlapping ownership.

The 2026-09-14 review inspected the live `ki-agentic-harness` roadmap and relevant capability sources. Some inspected Harness records have uncommitted changes, so these are working-copy observations that must be refreshed before a transfer. This capture changes no Harness record or skill. [[TECHNE-GOV-006-define-agentic-operating-approach]] separately owns the overall agentic architecture and terminology; this proposal owns technology investigation and evidence.

## Boundary

This is finite work to establish the programme and its first portfolio. It does not perform every investigation, schedule recurring events, adopt technologies, install external skills, or change another repository's priorities. Canonical radar and operating-model changes require an approved enactment plan. Initial candidates are research interests, not new radar endorsements.

## Discussion

### Proposed ownership

Techne should own the engineering questions, technology landscape, comparative evidence, local recommendations, review dates, and consolidated findings. External reference material belongs in Resources; accepted internal conclusions belong in Engineering Practice; experiments and unaccepted conclusions remain in their Streams records. A recurring tech-day procedure belongs in Techne's operating model, with a housekeeping template only if a cadence is adopted.

The Agentic Harness should own portable, reusable evaluation procedures, skill contracts, runtime adapters, and conformance mechanisms implementing accepted requirements. A reusable radar skill may live there while Techne owns the evolving KI-specific entries, benchmark applicability, results, and recommendation history. Skill-specific normative sources and REFRESH responsibilities remain with their existing owners.

### Harness roadmap reconciliation

- **`KI-HARNESS-REV-002`, Explore Agentic Standards Radar — triage/draft:** propose Techne ownership of the cross-cutting standards, architecture-pattern, and knowledge-model investigation and its findings. Preserve the existing item as provenance until an agreed handoff reconciles it. Only a demonstrated reusable scanning or evaluation mechanism should become residual Harness work.
- **`KI-HARNESS-REV-003`, Establish Model Radar — soon/draft:** separate the proposed portable `ki-model-radar` method and validation from KI's current model-route evidence, benchmark registry, reviewed snapshots, and recommendations. The latter should be a Techne radar view; the former can remain Harness capability work. Preserve the distinction between recommendation ring, actual integration/default state, and support lifecycle. No `ki-model-radar` skill exists in the inspected source catalogue yet.
- **`KI-HARNESS-RTP-010`, Evaluate Fly.io hosting — triage/draft:** retain the existing division. [[TECHNE-GOV-005-define-isolated-agent-execution]] owns provider evaluation; the Harness item is a conditional adapter proof following `KI-HARNESS-RTP-012`.
- **`KI-HARNESS-RTP-012`, Define remote agent substrate:** keep executable lifecycle and conformance work in the Harness. Techne owns the engineering model and comparative technology evidence it consumes.

Cross-repository reconciliation should preserve identities, evidence, and receiver authority through the declared trade process. This proposal does not itself transfer, supersede, or reprioritise those records.

### Existing skills to compose

`ki-pulse` supplies bounded public-signal discovery without a standing inbox. `ki-tokenomics` supplies the portable model-purpose vocabulary. `ki-skills` supplies capability-quality review and source refresh. `ki-work-housekeeping` supplies recurring-work mechanics, and `ki-next` captures finite follow-up work. These capabilities can support Techne without acquiring ownership of its knowledge.

`ki-design-inspiration` demonstrates a reusable procedure that learns from external examples; its website-design purpose remains distinct. `ki-repo-harness` and `ki-repo-plugins` govern capability packaging and projections, rather than technology recommendations.

### Initial investigation portfolio

- [[TECHNE-OPS-004-compare-workflow-automation-tools]] compares n8n and Node-RED using a repeatable automation problem.
- [[TECHNE-OPS-005-explore-agent-application-frameworks]] explains and evaluates LangChain, LangGraph, and LangSmith against a simple baseline.
- **LibreChat:** retain the earlier interest in a self-hosted conversational interface with MCP access. A later investigation should test whether it makes island knowledge and approved workflows easier to use.
- **Build with Claude and external skills:** retain the catalogue as a discovery source. A later investigation should inspect a few upstream capabilities, including the previously noticed agent-memory-discipline entry, and compare direct reuse, configuration, thin adaptation, and learning from their design.
- **Models and agentic standards:** reconcile the two named Harness proposals before creating additional Techne records for the same investigations.

The two captured experiments are independently shapeable. Their empty dependency arrays do not make this programme a prerequisite for exploratory learning or establish a delivery order.

### Proposed tech-day format

Start with an occasional, time-boxed half-day around one practical question. Choose a baseline and a small candidate set, read current primary documentation, try the same bounded scenario, exercise a failure or recovery case, and produce a short evidence-backed conclusion. A useful negative result is a successful investigation.

Each result should retain the question, exact versions and configuration, source dates, reproducible artefacts, observed benefits and limitations, setup and operating effort, cost assumptions, portability, and unresolved uncertainty. Explain where the technology is useful and where it is not, then propose a radar disposition or no change with a review trigger. Keep vendor claims distinct from observed behaviour.

The first deliverable is a reviewable operating proposal and reconciled ownership map, with an agreed first tech day. Cadence, duration, and subsequent experiments remain choices to settle during planning; no calendar booking or automation is implied.

### Reuse and independent judgment

Compare upstream use, configuration, a thin adapter, an upstream contribution, and a custom implementation against the same problem. Record the concrete unmet need before proposing KI-specific replacement work. Preserve upstream provenance and applicable licence information; assess behaviour, maintenance, instruction conflicts, required access, and fit without assuming every external skill must become a KI-authored governance skill.

Knowledge Islands should consolidate understanding and accountable use. The value of its own implementation must be demonstrated alongside external alternatives.

### Source entry points

The discovery sources are [LibreChat](https://www.librechat.ai/), [LibreChat MCP documentation](https://www.librechat.ai/docs/features/mcp), [Build with Claude](https://buildwithclaude.com/), and [its upstream repository](https://github.com/davepoon/buildwithclaude). Product claims remain preliminary; the linked investigation records preserve primary documentation for the first two technology areas.
