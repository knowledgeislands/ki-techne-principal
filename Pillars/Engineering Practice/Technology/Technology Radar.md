# Technology Radar

## Purpose

The Technology Radar records the current engineering posture toward technologies that affect the Knowledge Islands ecosystem.

Its categories are working positions, not permanent endorsements or prohibitions.

Each entry is reviewed when material evidence changes and no later than its stated review date.

## Categories

- **Adopt**: a current component of the engineering estate or an established engineering choice.
- **Trial**: a technology being evaluated through bounded, evidence-producing use.
- **Assess**: a technology worth understanding before a trial is justified.
- **Hold**: a technology that is not suitable for the stated role at present.

## Adopt

### Zed

**Purpose:** Primary engineering interface for inspection, change, and review.

**Strengths:** Supports a focused engineering workflow and provides a clear human interaction point in the estate.

**Weaknesses:** Its suitability depends on continued fit with the required tooling, workflows, and collaboration practices.

**Relationship to Knowledge Islands:** Provides an interface through which engineers discover, change, and review governed knowledge.

**Next review:** 2026-10-31.

### Herdr

**Purpose:** Persistent execution runtime for work that cannot remain within an interactive engineering session.

**Strengths:** Separates durable execution from the engineer's immediate client session.

**Weaknesses:** Requires clear lifecycle, identity, observability, and recovery practices as it evolves.

**Relationship to Knowledge Islands:** May produce operational evidence that becomes governed engineering knowledge.

**Next review:** 2026-10-31.

### Hermes Agent

**Purpose:** Agent capability for intent interpretation, contextual reasoning, and planning.

**Strengths:** Helps translate objectives and relevant context into proportionate engineering plans.

**Weaknesses:** Its output is probabilistic and requires validation, deterministic controls, and accountable review.

**Relationship to Knowledge Islands:** Uses governed knowledge as contextual input and may help identify knowledge that should be captured or reviewed.

**Next review:** 2026-10-31.

### Tailscale

**Purpose:** Private connectivity layer for authorised engineering environments and services.

**Strengths:** Supports remote engineering without making public network exposure the default connectivity model.

**Weaknesses:** Introduces a dependency that must remain aligned with identity, access, and network operating requirements.

**Relationship to Knowledge Islands:** Connects authorised contributors and estate components to governed knowledge across locations.

**Next review:** 2026-10-31.

### llama.cpp

**Purpose:** Local model execution runtime.

**Strengths:** Supports local inference where privacy, locality, offline operation, or interactive latency are important.

**Weaknesses:** Available capability and throughput depend on the selected model and local hardware.

**Relationship to Knowledge Islands:** Provides one local execution option for AI-enabled work involving governed knowledge.

**Next review:** 2026-10-31.

### MLX-LM

**Purpose:** Local model execution runtime for suitable hardware environments.

**Strengths:** Provides an additional local inference option within the AI Execution Fabric.

**Weaknesses:** Its applicability is constrained by compatible hardware and the maturity of the workload's required model support.

**Relationship to Knowledge Islands:** Provides one local execution option when governed knowledge may be used as AI workload context.

**Next review:** 2026-10-31.

### tools-mgit

**Purpose:** Deterministic orchestration layer for defined engineering operations.

**Strengths:** Provides a repeatable control boundary around consequential engineering work.

**Weaknesses:** Its value depends on explicit operation definitions, reliable integrations, and appropriate human controls.

**Relationship to Knowledge Islands:** Applies governed engineering context to operations and may generate evidence for future knowledge capture.

**Next review:** 2026-10-31.

## Trial

### AWS Elastic Execution

**Purpose:** Trial context for the elastic-compute tier of the AI Execution Fabric.

**Strengths:** Offers on-demand capacity for workloads that exceed local resources or vary materially over time.

**Weaknesses:** Adds provisioning, identity, observability, cost, and data-locality concerns.

**Relationship to Knowledge Islands:** Enables execution of workloads that use governed knowledge while requiring explicit handling of that knowledge's constraints.

**Next review:** 2026-10-31.

### OpenCode

**Purpose:** Candidate engineering interaction and AI-assisted workflow tool.

**Strengths:** May provide useful alternative interaction patterns for AI-assisted engineering work.

**Weaknesses:** Its fit with the established estate, operating model, and governance requirements is unproven.

**Relationship to Knowledge Islands:** Would need to demonstrate that it can use and preserve governed engineering context appropriately.

**Next review:** 2026-10-31.

### OpenRouter

**Purpose:** Candidate managed-service gateway for access to multiple model providers.

**Strengths:** May simplify evaluation of managed model capabilities without coupling the architecture to a single provider.

**Weaknesses:** Adds an external dependency and requires assessment of data handling, availability, cost, and provider constraints.

**Relationship to Knowledge Islands:** Could provide a managed execution path for AI workloads that use governed knowledge as context.

**Next review:** 2026-10-31.

### vLLM

**Purpose:** Candidate model-serving runtime for elastic or dedicated execution.

**Strengths:** May support greater control over model serving where local execution is insufficient.

**Weaknesses:** Requires operational capability for provisioning, model lifecycle management, scaling, and observability.

**Relationship to Knowledge Islands:** Could host AI workloads that retrieve governed context under an appropriate security and access model.

**Next review:** 2026-10-31.

## Assess

### Pi

**Purpose:** Potential engineering interaction or agent capability under assessment.

**Strengths:** May offer useful approaches that inform the design of AI-assisted engineering workflows.

**Weaknesses:** Its role, integration fit, and governance implications require evidence before a trial is justified.

**Relationship to Knowledge Islands:** Any future use would need to preserve source validation and accountable handling of governed context.

**Next review:** 2026-10-31.

### Muxie

**Purpose:** Potential engineering or agent capability under assessment.

**Strengths:** May offer useful implementation or interaction patterns for the engineering estate.

**Weaknesses:** Its suitability, operational implications, and relationship to existing components are not yet established.

**Relationship to Knowledge Islands:** Any future use would need a defined approach to governed knowledge, provenance, and review.

**Next review:** 2026-10-31.

### Continue.dev

**Purpose:** Potential AI-assisted engineering interface under assessment.

**Strengths:** May offer alternative integration patterns for AI-assisted development workflows.

**Weaknesses:** Its fit with Zed, the operating model, and the governance requirements of the estate is not yet demonstrated.

**Relationship to Knowledge Islands:** Any future adoption would need to preserve governed context, source validation, and human review.

**Next review:** 2026-10-31.

## Hold

### VS Code as Primary IDE

**Purpose:** Candidate primary engineering interface that is not selected for this role at present.

**Strengths:** Remains a widely capable and extensible engineering environment.

**Weaknesses:** Does not currently provide a sufficient reason to displace Zed as the estate's primary engineering interface.

**Relationship to Knowledge Islands:** May remain compatible with governed knowledge, but is not the default interface through which Techne defines engineering practice.

**Next review:** 2026-10-31.

### Ollama as Architecture Foundation

**Purpose:** Candidate local AI foundation that is not selected as the defining local-execution architecture.

**Strengths:** May remain useful for specific local model experiments or developer workflows.

**Weaknesses:** Does not presently provide the architectural basis required for the provider-neutral local-execution strategy.

**Relationship to Knowledge Islands:** May be used only where its behaviour and data handling meet the requirements of a specific governed workload.

**Next review:** 2026-10-31.

## Review Practice

A review should retain the current category, move the entry to another category, or retire it from the radar.

Material changes to the engineering estate or AI Execution Fabric should update the relevant entry as part of the same change.

Technology evaluations should record the evidence that justifies a category change.
