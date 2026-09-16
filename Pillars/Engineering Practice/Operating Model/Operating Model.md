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

## Working Contexts

A working context identifies the purpose and capacity in which a person is acting. It binds relevant knowledge, repository relationships, eligible agent footprints, permissions, credential and data-handling boundaries, approval rules and resource limits without creating another persona.

Context is separate from working mode. Context answers which hat and authority apply; mode answers how the person and agents participate and how work persists. A context may reference one or more Agoras, but an Agora is a governed repository relationship rather than a persona, workspace or access grant.

Context selection must be visible before consequential work begins. A controller may suggest a context, but an ambiguous request requires clarification. A conversation or interface does not establish the context by itself, and one global current-context value must not silently govern concurrent tasks.

An execution retains its assigned context and authority while the person works elsewhere. Changing context must not redirect existing work or widen its permissions; a deliberate scope change requires newly validated authority.

## Working Modes

### Attached Interactive Work

An engineer remains present while an agent assists inside the engineer's selected project and execution context. This mode may share the workstation, checkout, credentials, and network policy because the engineer directly observes and controls the work. Repository scope, change authority, and review remain explicit.

### Persistent Supervised Work

A named session continues beyond one client connection while an engineer retains observation and control. The session must preserve its repository and process identity, distinguish client reconnection from child-process survival, and define recovery separately for transport loss, persistence-service restart, and agent-runtime restoration.

### Unattended Isolated Work

An agent receives one bounded task in an isolated environment created from an immutable repository baseline and a portable bootstrap profile. A controller supplies scoped authority, credentials, and network policy; the task returns Git references, manifests, logs, and review evidence through the selected change-management boundary before the environment is destroyed or retained under an explicit persistence policy.

A transition between modes is deliberate. The engineer or controller must reassess identity, context, authority, credentials, observation, continuity, recovery, and review whenever work moves from attached to persistent or unattended execution.

## Write Ownership and Human Handover

One active writer owns a repository working copy or equivalent write assignment at a time. Separate task environments, clones and branches reduce interference, but they do not replace change-record coordination, baseline validation or accountable integration.

When a person attaches to inspect an execution, observation alone does not transfer write ownership. Direct editing begins only after an explicit handover records who owns the write assignment, the baseline and branch, whether the worker is paused or drained, and how outstanding changes and evidence will be reconciled. Returning control to an agent requires the same deliberate handover.

The conservative initial policy is one active write assignment per repository, separate clones and branches, and serial integration with baseline validation. Independent read-only work may run concurrently. External changes must still be detected because a controller-local claim is not a universal repository lock.

## Lifecycle

### 1. Frame the Work

An engineer defines the objective, selected working context, relevant constraints, expected outcome, and boundary of the work.

The framing should identify whether the work may affect architecture, operations, security, data handling, cost, or shared engineering knowledge.

When relevant context already exists, it should be located and considered before a new approach is proposed.

### 2. Develop a Plan

The work is translated into a proportionate, reviewable plan.

A personal agent controller or reasoning capability may assist with contextual reasoning and planning, while the engineer remains accountable for the scope and suitability of the plan.

Material architectural changes require an explicit rationale, alternatives, consequences, and a future review point through an Architecture Decision Record.

### 3. Execute Defined Operations

Approved or defined actions are performed through deterministic engineering controls where repeatability, correctness, or operational safety is required.

Before execution, validate context and authority, then select a working mode, agent footprint and execution target independently. The context determines eligible knowledge, capabilities and authority; the mode determines operator presence, isolation, continuity and evidence expectations; the target supplies eligible capacity.

A deterministic operations layer provides the control boundary for defined operations. tools-mgit is the current mapping for that role.

An execution-fabric operator may provision and supervise task environments through replaceable adapters. That operator is a prospective role rather than a committed product or repository. Work that must continue beyond an interactive session may use Herdr as the current persistent supervised-execution mapping.

### 4. Review the Outcome

An engineer assesses the resulting change against the stated objective, constraints, and evidence.

Review should consider the direct result as well as material consequences for architecture, security, operations, cost, and governed knowledge.

Agent output may inform the review but is not itself sufficient evidence for a material decision or change.

### 5. Capture Durable Knowledge

When work establishes, revises, or invalidates shared understanding, that outcome is captured in Knowledge Islands.

The record should retain sufficient context for a future contributor to understand what changed, why it changed, and what remains uncertain.

Architecture Decision Records, technology evaluations, diagrams, and operational guidance are examples of durable engineering knowledge.

[[Knowledge Architecture]] defines the properties and lifecycle of that knowledge.

### 6. Observe and Evolve

Operational evidence, new constraints, and changed requirements may challenge an earlier approach.

The knowledge base should then be updated through a new, reviewable increment that preserves the prior rationale rather than silently overwriting it.

## Responsibilities

- **Engineer** — frames work, selects or confirms context, delegates bounded authority, approves material plans, reviews outcomes and remains accountable for decisions.
- **Personal agent controller** — maintains persona and task continuity, binds executions to contexts and delegated authority, supervises lifecycle and integrates results.
- **Governance layer** — advances work and knowledge through their governed lifecycle without becoming an execution or infrastructure control plane.
- **Deterministic operations layer** — performs defined engineering operations and enforces consequential control boundaries.
- **Execution-fabric operator** — prospectively selects eligible footprints and targets, manages task-environment lifecycle and returns evidence through provider-neutral boundaries.
- **Agent runtime** — performs the bounded assignment inside its task environment.
- **Engineering interface** — supports interaction, inspection, approval, review and deliberate human attachment without establishing authority by itself.
- **Governed knowledge layer** — retains durable knowledge, context, decisions and evolving guidance while leaving credentials and controller operational state to their appropriate systems.

Hermes Agent, `ki`, tools-mgit, Herdr, Zed and Knowledge Islands are current or candidate mappings for these roles. They remain replaceable: `ki` implements governance rather than fabric operation, and no distinct fabric-operator product or owning repository has yet been selected.

[[Engineering Estate]] defines these component roles in architectural terms.

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

[[Engineering Estate]] defines the components that support the lifecycle.

[[Agentic Operating Approach]] introduces persona, context, footprint, execution and interface relationships.

The Techne Fabric in [[AI Execution Fabric]] determines which context-eligible footprints and targets may serve AI-enabled workloads.

[[Principles]] provides the decision criteria that guide trade-offs within the operating model.

[[Technology Investigation Programme]] defines how a bounded technology question becomes reproducible evidence and a proportionate recommendation.

Future chapters will define the detailed operating practices for remote engineering, security, local AI, cloud AI, and elastic execution.
