---
note_type: admin/governance/decision
id: ADR-TECHNE-002
title: 'One persona across explicit working contexts'
date: 2026-09-15
status: current
decision_type: architecture
decision_type_url: https://knowledgeislands.info/specifications/decision-records/adr
decision_depends_on: [GDR-TECHNE-001, ADR-TECHNE-001]
---

# ADR-TECHNE-002: One persona across explicit working contexts

## Context

A person may use agentic assistance while acting in several personal, organisational or professional capacities. Those capacities can involve different knowledge, repositories, credentials, data-handling rules, eligible capabilities and approval requirements. Treating each capacity as a separate agent identity fragments the continuing relationship with the person. Treating every capacity as one undifferentiated operating scope allows authority and information to cross boundaries implicitly.

Conversation channels, deployments, repository visibility and Agora membership each describe different relationships. None alone identifies the capacity in which a person is acting or grants authority for consequential work. A personal controller may also move between deployments or coordinate executions that outlive the initiating conversation, so neither interface nor location can own its identity or current authority.

## Decision

Techne assigns one enduring agent persona to each person and expresses the person's distinct capacities as explicit working contexts. Each context binds its purpose, relevant knowledge and repository relationships, eligible capabilities, credential and data-handling boundaries, approval rules and resource limits. Context selection is visible before consequential action, and every execution retains its assigned context and separately validated authority until that authority expires or is revoked. A context change cannot redirect an existing execution, widen its authority or transfer information across contexts without an explicit policy-permitted grant.

One active controller authority acts for the persona across all deployments. Interfaces, controller runtimes and deployment locations may change without creating another persona, but relocation and recovery must prevent stale controllers from dispatching work or publishing results. Kitteth is Kris's instance of this architecture, not the generic controller software.

A working context may reference Agoras and repositories, but it is neither an Agora, an Agora membership nor an access grant. Knowledge Islands governance remains distinct from the prospective operator of the AI Execution Fabric; governing a work record does not confer infrastructure-control authority.

## Consequences

- People retain a continuous personal agent relationship without merging the authority or information of their different capacities.
- Controllers must make context selection, execution binding, authority validation, revocation and cross-context transfer observable and enforceable.
- Controller coordination must preserve a single active authority during deployment, recovery and relocation; implementation-specific fencing remains outside this decision.
- Reusable controller software, interfaces, agent runtimes and infrastructure providers remain replaceable and do not own persona identity.
- A deployment, repository, Agora relationship or visible capability supplies context for an authority decision but cannot substitute for one.
- This decision creates no controller repository, software product, provider, provisioning or deployment commitment.

## References

- [GDR-TECHNE-001](GDR-TECHNE-001-adopting-decision-records.md) — establishes Techne's Decision Records instrument.
- [ADR-TECHNE-001](ADR-TECHNE-001-provider-neutral-isolated-agent-execution.md) — establishes the provider-neutral controller, execution and isolation boundaries this decision extends.
