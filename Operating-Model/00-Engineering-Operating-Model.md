# Engineering Operating Model

## Purpose

The engineering operating model defines how Techne turns an objective into reviewed work and durable knowledge.

It provides a common lifecycle for human engineers, agent capabilities, deterministic tools, persistent execution, and Knowledge Islands.

The model is intentionally independent of a specific project-management system, runtime, or deployment platform.

## Operating Outcomes

The operating model aims to ensure that engineering work has:

- a clear objective and bounded scope;
- an appropriate plan before material execution;
- deterministic controls around consequential operations;
- accountable human review where a change or decision warrants it;
- evidence sufficient to understand the outcome; and
- durable knowledge captured when work changes shared understanding.

## Lifecycle

### 1. Frame the Work

An engineer defines the objective, relevant constraints, expected outcome, and boundary of the work.

The framing should identify whether the work may affect architecture, operations, security, data handling, cost, or shared engineering knowledge.

When relevant context already exists, it should be located and considered before a new approach is proposed.

### 2. Develop a Plan

The work is translated into a proportionate, reviewable plan.

Hermes Agent may assist with contextual reasoning and planning, while the engineer remains accountable for the scope and suitability of the plan.

Material architectural changes require an explicit rationale, alternatives, consequences, and a future review point through an Architecture Decision Record.

### 3. Execute Defined Operations

Approved or defined actions are performed through deterministic engineering controls where repeatability, correctness, or operational safety is required.

tools-mgit provides the intended orchestration boundary for those operations.

Work that must continue beyond an interactive session may use Herdr as its persistent execution runtime.

### 4. Review the Outcome

An engineer assesses the resulting change against the stated objective, constraints, and evidence.

Review should consider the direct result as well as material consequences for architecture, security, operations, cost, and governed knowledge.

Agent output may inform the review but is not itself sufficient evidence for a material decision or change.

### 5. Capture Durable Knowledge

When work establishes, revises, or invalidates shared understanding, that outcome is captured in Knowledge Islands.

The record should retain sufficient context for a future contributor to understand what changed, why it changed, and what remains uncertain.

Architecture Decision Records, technology evaluations, diagrams, and operational guidance are examples of durable engineering knowledge.

### 6. Observe and Evolve

Operational evidence, new constraints, and changed requirements may challenge an earlier approach.

The knowledge base should then be updated through a new, reviewable increment that preserves the prior rationale rather than silently overwriting it.

## Responsibilities

| Participant | Operating responsibility |
| --- | --- |
| Engineer | Frames work, approves material plans, reviews outcomes, and remains accountable for decisions. |
| Hermes Agent | Assists with intent interpretation, contextual reasoning, and planning. |
| tools-mgit | Performs defined, deterministic engineering operations. |
| Herdr | Provides persistent execution for work that cannot remain within an interactive session. |
| Zed | Provides the primary environment for engineering interaction, inspection, and review. |
| Knowledge Islands | Retains governed knowledge, context, decisions, and evolving engineering guidance. |

The [Engineering Estate](../Architecture/05-Engineering-Estate.md) defines these component roles in architectural terms.

## Control Points

The operating model uses the following control points to maintain disciplined engineering practice:

- framing before execution, to establish intent and constraints;
- proportionate planning before material work;
- deterministic orchestration for defined operations;
- human review of material outcomes and decisions;
- evidence captured with the outcome; and
- durable knowledge updated when shared understanding changes.

The degree of control should be proportionate to the consequence of the work.

A focused documentation correction does not require the same process as an architectural change that affects data handling, execution routing, or operational risk.

## Relationships

The [Engineering Estate](../Architecture/05-Engineering-Estate.md) defines the components that support the lifecycle.

The [AI Execution Fabric](../Architecture/06-AI-Execution-Fabric.md) determines where AI-enabled workloads may execute.

The [Principles](../Architecture/04-Principles.md) provide the decision criteria that guide trade-offs within the operating model.

Future chapters will define the detailed operating practices for remote engineering, security, local AI, cloud AI, and elastic execution.
