---
note_type: admin/governance/decision
id: ADR-TECHNE-001
title: 'Provider-neutral isolated agent execution'
date: 2026-09-09
status: current
decision_type: architecture
decision_type_url: https://knowledgeislands.info/specifications/decision-records/adr
decision_depends_on: [GDR-TECHNE-001]
---

# ADR-TECHNE-001: Provider-neutral isolated agent execution

## Context

Techne separates engineering intent, deterministic orchestration, persistent execution, human interaction, and governed knowledge. Its AI Execution Fabric selects local, managed, elastic, or dedicated capacity according to workload constraints. Those models do not alone define the boundary given to an independently acting agent task.

An attached agent may reasonably share an engineer's workstation context. A persistent supervised session must survive client disconnection while retaining observable human control. An unattended task has different authority, credential, network, state, recovery, and evidence consequences. A Git worktree separates repository changes but does not isolate the host filesystem, processes, credentials, or network. Provider-specific sandboxes supply stronger boundaries but couple the architecture if their APIs or snapshots become authoritative.

## Decision

Techne adopts three explicit working modes: attached interactive work, persistent human-supervised work, and unattended isolated work. Each unattended task receives a disposable or explicitly resumable task environment created from an immutable repository baseline and a portable bootstrap profile. A persistent controller owns identity, policy, credential brokerage, lifecycle supervision, and result integration. The task environment, bootstrap profile, agent runtime, and execution tier remain independently replaceable. Git and the selected change-management process remain authoritative for work state, returned evidence, and review.

Isolation is proportionate to task authority and risk rather than mandatory for every use of AI. Provider APIs, images, and snapshots remain adapter concerns; open environment descriptions, OCI artifacts, Git references, manifests, logs, and review evidence form the portable hand-off.

## Consequences

- Interactive assistance can remain lightweight while persistent and unattended work receive explicit continuity and isolation controls.
- Remote hosts, local microVMs, Kubernetes sandboxes, and managed services can implement the same model without defining it.
- Controllers and environments must expose identity, authority, credential, network, state, recovery, evidence, expiry, and cleanup behaviour.
- Independent filesystems remove shared-path contention but not competing Git claims, change-record concurrency, or accountable review.
- Provider-native checkpoints may improve recovery but cannot be the only authoritative copy of task state or results.
- Implementations carry additional bootstrap, conformance, observability, and teardown work in exchange for replaceability and safer unattended execution.

## References

- [GDR-TECHNE-001](GDR-TECHNE-001-adopting-decision-records.md) — establishes Techne's Decision Records instrument.
- [Development Container specification](https://github.com/devcontainers/spec/blob/main/docs/specs/devcontainer-reference.md) — portable development-environment description.
- [OCI Image specification](https://github.com/opencontainers/image-spec/blob/main/spec.md) — portable image packaging and transport.
