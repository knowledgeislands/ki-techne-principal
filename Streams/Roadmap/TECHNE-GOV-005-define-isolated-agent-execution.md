---
note_type: stream-proposal
id: TECHNE-GOV-005
area: GOV
title: Define isolated agent execution
aliases:
  - Isolated Agent Execution Proposal
theme: knowledge-governance
horizon: soon
status: draft
priority: medium
dependencies: []
blocks: []
blocked_by: []
baseline_ref: null
---

# Define Isolated Agent Execution

## Goal

Make isolated, portable task environments an explicit part of Techne's engineering principles and execution architecture so autonomous agents can operate independently without coupling Knowledge Islands to a provider, workstation, or agent runtime.

## Context

Techne already establishes Provider-Neutral Execution, Clear Separation of Responsibilities, Security and Privacy as Design Inputs, and Evolvable by Default. The [[AI Execution Fabric]] separates workload requirements from infrastructure selection. It does not yet state that an autonomous agent task should receive its own filesystem and security boundary, bootstrapped from a portable profile, rather than inherit an interactive editor session or shared host workspace.

`KI-HARNESS-RTP-012` now records the corresponding executable substrate analysis. It separates the persistent controller, isolated task environment, bootstrap profile, agent runtime, authoritative Git state, and review evidence. `DOTFILES-UE-020` uses Cheztoi as the working name for one personal bootstrap profile and projection of that wider contract.

## Boundary

Do not select or adopt a sandbox provider, define the harness's executable capability contract, provision infrastructure, or turn Cheztoi into the name of the general architecture. Do not imply that every interactive agent conversation requires a remote environment or that isolation removes the need for Git coordination and accountable review.

## Shaping

Add a concise principle expressing that independently acting agent tasks should run within isolated, disposable or explicitly resumable environments described by portable profiles. Connect it to the existing provider-neutral, security, responsibility-separation, and evolvability principles rather than restating those principles.

Extend [[AI Execution Fabric]] so execution tier, sandbox substrate, bootstrap profile, and agent runtime are independent selection axes. Describe the controller as the owner of identity, policy, credential brokerage, lifecycle, and result integration, while the sandbox owns bounded task execution in a fresh repository clone.

Update the [[Engineering Estate]] or its diagrams only where needed to make the controller, sandbox, profile, and runtime boundaries legible. Assess relevant technologies in [[Technology Radar]] only after their architectural role and evidence threshold are clear.

Promote this proposal to Next when the intended principle wording, affected canonical notes, evidence sources, and review assertions are concrete enough for an enactment plan.

## Discussion

### Principle shape

The durable technique is not Docker, Kubernetes, or Cheztoi. It is that one independently acting agent task receives one isolated execution environment, created from a portable declaration, with explicit state, credential, network, evidence, and teardown boundaries.

This complements Provider-Neutral Execution: workload constraints choose an eligible execution target, while the isolation principle defines how the task is contained once placed there. It also makes Clear Separation of Responsibilities operational by keeping the controller, sandbox substrate, bootstrap profile, and agent runtime replaceable.

### Reference mapping

- **Agent Sandbox:** the emerging Kubernetes-native control-plane model to follow for neutral sandbox identity, claims, templates, and warm pools.
- **Docker Sandboxes:** a practical local adapter for proving one task per isolated private clone without making Docker part of the principle.
- **Cheztoi:** one personal, reproducible bootstrap profile containing the portable subset of dotfiles knowledge; it is neither the controller nor the sandbox.
- **Dev Container and OCI:** open artifact boundaries for describing and distributing the environment independently from a provider's snapshot format.

Daytona, E2B, Coder, Cloudflare Sandbox SDK, Modal, and Fly Sprites remain implementation candidates with different control-plane, persistence, hosting, and workload strengths. Their APIs should be evaluated through a shared conformance shape rather than promoted into canonical architecture individually.

### State and authority

Git commits, patches, canonical work records, manifests, logs, and review evidence remain authoritative and portable. Sandbox snapshots are reconstructible acceleration or explicitly governed persistence, never the sole hand-off record.

Credentials should be scoped, short-lived, and injected at runtime, preferably through the controller or a proxy. Network access should be bounded by task policy. A fresh clone removes host-filesystem contention but does not remove competing claims, branch conflicts, or change-record coordination.

### Knowledge and implementation ownership

Techne owns the durable engineering principle and conceptual execution model. `ki-agentic-harness` owns reusable sandbox capability semantics and conformance tests. Dotfiles owns the Cheztoi profile instance. `tools-ki` may eventually own a provider-neutral compiler, CLI, or adapter surface once multiple proofs establish that boundary.
