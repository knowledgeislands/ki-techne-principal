---
note_type: stream-proposal
id: TECHNE-GOV-005
area: GOV
title: Govern isolated agent execution
aliases:
  - Isolated Agent Execution Proposal
theme: knowledge-governance
horizon: next
status: draft
priority: medium
dependencies: []
blocks: []
blocked_by: [TECHNE-GOV-004]
baseline_ref: null
---

# Govern Isolated Agent Execution

## Goal

Govern isolated agent execution as a coherent Knowledge Islands technique area so autonomous agents can operate independently through portable task environments without coupling the engineering model to a provider, workstation, profile implementation, or agent runtime.

## Context

Techne already establishes Provider-Neutral Execution, Clear Separation of Responsibilities, Security and Privacy as Design Inputs, and Evolvable by Default. The [[AI Execution Fabric]] separates workload requirements from infrastructure selection. It does not yet state that an autonomous agent task should receive its own filesystem and security boundary, bootstrapped from a portable profile, rather than inherit an interactive editor session or shared host workspace.

`KI-HARNESS-RTP-012` now records the corresponding executable substrate analysis. It separates the persistent controller, isolated task environment, bootstrap profile, agent runtime, authoritative Git state, and review evidence. `DOTFILES-UE-020` uses Cheztoi as the working name for one personal bootstrap profile and projection of that wider contract.

Techne is the canonical owner of the engineering model, layer taxonomy, technology landscape, and remote-agent working modes for this concern. `TECHNE-OPS-002` owns the persistent supervised-session proof. `KI-HARNESS-RTP-012` should consume the accepted model when defining a portable executable contract; it must not become the authoritative provider-comparison, working-style, or engineering-principle record.

## Boundary

Do not select or adopt a sandbox provider, define the harness's executable capability contract, provision infrastructure, or turn Cheztoi into the name of the general architecture. Do not imply that every interactive agent conversation requires a remote environment or that isolation removes the need for Git coordination and accountable review.

## Shaping

Add a concise principle expressing that independently acting agent tasks should run within isolated, disposable or explicitly resumable environments described by portable profiles. Connect it to the existing provider-neutral, security, responsibility-separation, and evolvability principles rather than restating those principles.

Extend [[AI Execution Fabric]] so execution tier, sandbox substrate, bootstrap profile, and agent runtime are independent selection axes. Describe the controller as the owner of identity, policy, credential brokerage, lifecycle, and result integration, while the sandbox owns bounded task execution in a fresh repository clone.

Update the [[Engineering Estate]] or its diagrams only where needed to make the controller, sandbox, profile, and runtime boundaries legible. Assess relevant technologies in [[Technology Radar]] only after their architectural role and evidence threshold are clear.

Coordinate the repository-owned outcomes without absorbing their implementation: `TECHNE-OPS-002` proves the persistent supervised working style; `KI-HARNESS-RTP-012` defines the portable lifecycle and conformance contract; `DOTFILES-UE-020` implements the residual Cheztoi profile and projection; and `tools-ki` receives shared compiler, CLI, or adapter work only once multiple proofs establish a reusable boundary.

Define the bootstrap-profile inputs that the harness contract must accept: pinned tools, KI bootstrap and repair, XDG layout, Git and shell prerequisites, runtime configuration templates, explicit state classes, and a fail-closed health check. Keep the profile consumable without chezmoi at runtime.

Set a proving sequence that exercises the same profile in a private fresh clone through at least two materially independent adapters. Use open artifacts and ordinary evidence at the hand-off boundary so a provider snapshot cannot become the only recoverable state.

The intended principle, affected canonical notes, coordinated repository outcomes, evidence sources, and review assertions are now concrete enough for enactment.

## Current state

Techne already defines provider-neutral execution, responsibility separation, security as a design input, execution tiers, and accountable review. It names Herdr as a persistent execution runtime but does not distinguish attached, persistent supervised, and unattended isolated work or separate controller, sandbox, profile, and runtime selection axes. The Stream contains the current technology evidence and a provider-neutral proving sequence; no provider selection or canonical implementation commitment is needed for this enactment.

## Steps

- [ ] Add an isolated-agent-execution principle that makes independently acting work, proportional isolation, portable declaration, explicit authority, evidence return, and teardown or governed persistence visible without requiring isolation for every interactive exchange.
- [ ] Extend [[Operating Model]] with the three working modes and deliberate transition boundaries for operator presence, session continuity, authority, credentials, observation, control, recovery, and review.
- [ ] Extend [[AI Execution Fabric]] so execution tier, sandbox substrate, bootstrap profile, and agent runtime are independent selection axes governed by workload constraints.
- [ ] Extend [[Engineering Estate]] with controller, task-environment, bootstrap-profile, and agent-runtime responsibilities while preserving the existing component roles and accountable integration boundary.
- [ ] Create `ADR-KI-TECHNE-001` recording the provider-neutral model, alternatives, consequences, and review triggers before treating the architecture as settled.
- [ ] Update the editable estate diagram only if the textual responsibility model is not legible without it; otherwise record explicitly that no diagram change is needed.
- [ ] Reconcile the Stream discussion against the enacted notes, retaining provider evidence and open proof work here rather than copying the landscape into canonical principles.

## Files touched

- `Pillars/Engineering Practice/Foundations/Principles.md`
- `Pillars/Engineering Practice/Operating Model/Operating Model.md`
- `Pillars/Engineering Practice/Architecture/AI Execution Fabric.md`
- `Pillars/Engineering Practice/Architecture/Engineering Estate.md`
- `Admin/Governance/Decisions/ADR-KI-TECHNE-001-govern-isolated-agent-execution.md`
- `Admin/Governance/Decisions/Decisions.md`
- `Pillars/Engineering Practice/Architecture/Diagrams/Engineering Estate.mmd` and its generated SVG only if the textual review establishes that the existing diagram would misrepresent the new boundaries
- This Stream record

## Verify

- The canonical model distinguishes attached interactive, persistent supervised, and unattended isolated work without prescribing one runtime or provider.
- Controller, task environment, bootstrap profile, agent runtime, Git, change management, and human review have distinct responsibilities and an explicit integration boundary.
- Execution placement and task isolation remain separate decisions, with security, continuity, state, credential, network, recovery, and evidence consequences visible.
- `ADR-KI-TECHNE-001` records the decision, alternatives, consequences, and evidence-driven review triggers.
- Wikilinks resolve, Markdown passes the authoring audit, the KB Streams audit passes, and the existing estate description remains internally consistent.

## Dependencies / blocks

No build dependency blocks enactment. `TECHNE-OPS-002` supplies later hands-on evidence for persistent supervised sessions but is not required to state the three-mode boundary. `KI-HARNESS-RTP-012` consumes the accepted model and retains its own executable-contract lifecycle.

## Delegation

Keep this enactment in one coordinator-owned lane because the principle, operating model, architecture, estate responsibilities, and decision rationale must use one vocabulary. Mechanical link and Markdown checks may run independently, but canonical prose should not be split across writers.

## Discussion

### Principle shape

The durable technique is not Docker, Kubernetes, or Cheztoi. It is that one independently acting agent task receives one isolated execution environment, created from a portable declaration, with explicit state, credential, network, evidence, and teardown boundaries.

This complements Provider-Neutral Execution: workload constraints choose an eligible execution target, while the isolation principle defines how the task is contained once placed there. It also makes Clear Separation of Responsibilities operational by keeping the controller, sandbox substrate, bootstrap profile, and agent runtime replaceable.

### Working modes

The operating model should distinguish attached interactive work, persistent human-supervised remote work, and unattended isolated execution. These modes may use overlapping tools, but they have different expectations for operator presence, session continuity, authority, credentials, observation, control, recovery, and evidence return.

`TECHNE-OPS-002` owns the Zed, Herdr, and Mosh evidence for persistent supervised sessions. This proposal owns the unattended isolated-execution principle and the boundary between modes. The Harness receives only the executable capability and conformance consequences of the accepted model.

### Layer model

The persistent controller owns session identity, policy, credential brokerage, lifecycle, and result integration. The sandbox substrate supplies the filesystem, process, network, and isolation boundary. The bootstrap profile declares the required environment. The agent runtime performs the bounded task. Git and the selected change-management process remain authoritative outside any one sandbox session.

Execution tier, isolation mechanism, environment profile, and agent runtime are independent choices. A local microVM and a remotely scheduled Kubernetes sandbox can consume the same profile; different agent runtimes can operate inside either without changing the governing principle.

### Profile and artifact boundary

Classify candidate dotfiles inputs as portable prerequisite, agent capability, personal preference, secret-bearing state, or machine-specific state. Cheztoi should contain only the portable subset and render independently consumable artifacts with exact feature or package locking where supported.

Use [the Development Container specification](https://github.com/devcontainers/spec/blob/main/docs/specs/devcontainer-reference.md) as the primary portable development-environment projection and [the OCI Image specification](https://github.com/opencontainers/image-spec/blob/main/spec.md) for image packaging and transport. Chezmoi may produce these artifacts, but consuming them must not require the full personal dotfiles repository.

### Reference mapping

- **Fly.io agent infrastructure and Sprites:** [Fly.io agent infrastructure](https://fly.io/ai-agents/) and [Sprites](https://fly.io/sprites/) provide a hosted reference for persistent agent controllers paired with isolated, checkpointable execution environments.
- **Grok Bot:** [Grok Bot](https://x.ai/bot) is a managed-product reference for always-on teammates with their own computers and multi-agent hand-offs; it primarily informs the controller and cockpit layer.
- **Grok Build:** [Grok Build](https://github.com/xai-org/grok-build) is an open-source coding-agent harness and terminal interface with Agent Client Protocol support; it primarily informs the agent-runtime and interaction layer rather than the sandbox substrate.
- **Agent Sandbox:** [Kubernetes SIG Apps Agent Sandbox](https://agent-sandbox.sigs.k8s.io/docs/) is the emerging neutral control-plane model to follow for sandbox identity, claims, templates, and warm pools; its v1beta1 status does not make Kubernetes a mandatory first implementation.
- **Docker Sandboxes:** [Docker Sandboxes](https://docs.docker.com/ai/sandboxes/) is the practical first local adapter for proving one task per isolated private clone without making Docker part of the principle.
- **Cheztoi:** one personal, reproducible bootstrap profile containing the portable subset of dotfiles knowledge; it is neither the controller nor the sandbox.
- **Dev Container and OCI:** open artifact boundaries for describing and distributing the environment independently from a provider's snapshot format.

[Daytona](https://github.com/daytonaio/daytona) is the strongest current second-adapter candidate when open-source control-plane operation, OCI compatibility, self-hosting, or bring-your-own-cloud matter. [E2B](https://docs.e2b.dev/) is the alternative when rapid hosted validation and a focused sandbox SDK matter more than self-hosting. [Coder](https://coder.com/docs/ai-coder/agents/architecture), [Cloudflare Sandbox SDK](https://developers.cloudflare.com/sandbox/), [Modal Sandboxes](https://modal.com/docs/guide/sandboxes), and Fly Sprites remain specialised references for organisational control planes, edge control, elastic compute, and durable agent homes.

The initial proving sequence should use Docker Sandboxes locally with a private clone, render the same profile through Dev Container and OCI artifacts, and then use Daytona or Agent Sandbox as a materially independent second implementation. Provider APIs remain behind adapters and their snapshots remain acceleration rather than authority.

### State and authority

Git commits, patches, canonical work records, manifests, logs, and review evidence remain authoritative and portable. Sandbox snapshots are reconstructible acceleration or explicitly governed persistence, never the sole hand-off record.

Credentials should be scoped, short-lived, and injected at runtime, preferably through the controller or a proxy. Network access should be bounded by task policy. A fresh clone removes host-filesystem contention but does not remove competing claims, branch conflicts, or change-record coordination.

### Knowledge and implementation ownership

Techne is accountable for the durable engineering principle, working modes, conceptual execution model, technology landscape, cross-repository coherence, and evidence review. `ki-agentic-harness` is responsible for reusable sandbox capability semantics and conformance tests. Dotfiles is responsible for the Cheztoi profile instance and approved personal remote-session configuration. `tools-ki` may eventually become responsible for a provider-neutral compiler, CLI, or adapter surface once multiple proofs establish that boundary.
