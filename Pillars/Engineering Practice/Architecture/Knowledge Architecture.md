# Knowledge Architecture

## Purpose

Knowledge Architecture defines how engineering knowledge is organised, governed, connected, and evolved within the Knowledge Islands ecosystem.

It ensures that engineering work produces durable context rather than isolated documents or inaccessible institutional memory.

The architecture describes the required properties of knowledge and its lifecycle.

It does not prescribe a particular database, retrieval system, or user interface.

## Role of Knowledge Islands

Knowledge Islands is the governed knowledge layer of the engineering estate.

It retains the context required to understand engineering choices over time, including rationale, constraints, evidence, relationships, and unresolved questions.

The knowledge layer supports human engineers and agent capabilities, but it does not remove the need for source validation, accountable review, or explicit decisions.

## Knowledge Domains

The engineering knowledge base contains several related domains:

| Domain          | Purpose                                                                                    |
| --------------- | ------------------------------------------------------------------------------------------ |
| Principles      | Establishes durable criteria for engineering decisions.                                    |
| Architecture    | Defines system concepts, responsibilities, boundaries, and evolution.                      |
| Decisions       | Records material choices, alternatives, consequences, and future review points.            |
| Operating model | Defines how engineering work is planned, executed, reviewed, and improved.                 |
| Evaluations     | Records evidence about technologies, approaches, and their suitability.                    |
| Diagrams        | Makes important system relationships inspectable through editable visual artefacts.        |
| Roadmap         | Connects present understanding to intended future work.                                    |
| Research        | Preserves exploratory material that may inform, but does not itself establish, a decision. |

These domains have distinct purposes but should remain linkable.

For example, an architectural chapter may link to a decision, a diagram, a technology evaluation, and a roadmap item that explains its planned evolution.

## Required Properties

Durable engineering knowledge should be:

- contextual, with enough background to explain why it exists;
- attributable, with an identifiable source or decision context;
- linkable, with relationships to the decisions, diagrams, and work it affects;
- reviewable, with a clear basis for reassessment when conditions change;
- versioned, so that evolution does not erase historical reasoning;
- discoverable, so that relevant guidance can be found before work begins; and
- governed, so that access, provenance, and change are appropriate to the knowledge's sensitivity.

The level of detail should be proportionate to the consequence of the knowledge.

A local implementation note need not have the same review trail as a decision that changes execution routing or data handling.

## Knowledge Lifecycle

### Capture

Capture knowledge when engineering work establishes, changes, invalidates, or materially clarifies shared understanding.

The record should state what is known, why it matters, and the evidence or constraints that support it.

### Contextualise

Connect the new knowledge to the architecture, principles, decisions, diagrams, evaluations, or roadmap work that gives it meaning.

Links should aid navigation and review rather than duplicate the same content across multiple documents.

### Review

Review knowledge when its assumptions, dependencies, technology posture, operational evidence, or surrounding architecture changes.

Review may confirm that a record remains current, revise it, supersede it, or identify a new decision that is required.

### Preserve and Supersede

When a conclusion changes, preserve the original rationale and record the relationship to its successor.

Historical context is necessary to understand why the system is shaped as it is and to avoid repeating previously assessed trade-offs.

## Use by the Engineering Estate

Engineers use governed knowledge to frame work, develop plans, review outcomes, and understand prior decisions.

Hermes Agent may use relevant knowledge as context for reasoning and planning, subject to the same requirements for source validation and human accountability.

tools-mgit and Herdr may produce operational evidence that becomes durable knowledge when it changes shared understanding or supports a material review.

Zed provides the engineering interface through which contributors inspect, change, and review this knowledge.

[[Engineering Estate]] defines the architectural roles of these components.

## Boundaries

The knowledge base is not a substitute for source code, runtime state, operational telemetry, secrets management, or every component's authoritative reference documentation.

It records the engineering context, decisions, and patterns needed to understand how those systems should be used and evolved.

The knowledge base also does not treat unverified agent output, unreviewed research, or transient conversation as settled engineering knowledge.

Such material may inform future work, but it requires appropriate validation and capture before it becomes durable guidance.

## Open Questions

The architecture does not yet define:

- a formal metadata model for ownership, sensitivity, review dates, and provenance;
- retrieval and ranking behaviour for human and agent consumers;
- access-control and retention rules for sensitive engineering knowledge; or
- the process for importing, validating, and superseding external research.

These concerns should be resolved when an implementation or operating requirement makes the trade-offs concrete.
