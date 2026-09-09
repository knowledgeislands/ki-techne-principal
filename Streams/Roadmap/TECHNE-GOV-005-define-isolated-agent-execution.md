---
note_type: stream-proposal
id: TECHNE-GOV-005
area: GOV
title: Govern isolated agent execution
aliases:
  - Isolated Agent Execution Proposal
theme: knowledge-governance
horizon: next
status: awaiting-review
priority: medium
dependencies: []
blocks: []
blocked_by: []
baseline_ref: 9a35c318992672e5d6b21ad46debe88030c77222
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

- [x] Consolidate current estate records, Codex execution surfaces, installed local tooling, available implementation skills, and external sandbox evidence into this proposal.
- [x] Add an isolated-agent-execution principle that makes independently acting work, proportional isolation, portable declaration, explicit authority, evidence return, and teardown or governed persistence visible without requiring isolation for every interactive exchange.
- [x] Extend [[Operating Model]] with the three working modes and deliberate transition boundaries for operator presence, session continuity, authority, credentials, observation, control, recovery, and review.
- [x] Extend [[AI Execution Fabric]] so execution tier, sandbox substrate, bootstrap profile, and agent runtime are independent selection axes governed by workload constraints.
- [x] Extend [[Engineering Estate]] with controller, task-environment, bootstrap-profile, and agent-runtime responsibilities while preserving the existing component roles and accountable integration boundary.
- [x] Create `ADR-TECHNE-001` recording the provider-neutral model, alternatives, consequences, and review triggers before treating the architecture as settled.
- [x] Review the editable estate diagram and record that no change is needed because it does not depict the newly separated generic execution roles or imply a conflicting topology.
- [x] Reconcile the Stream discussion against the enacted notes, retaining provider evidence and open proof work here rather than copying the landscape into canonical principles.

## Files touched

- `Pillars/Engineering Practice/Foundations/Principles.md`
- `Pillars/Engineering Practice/Operating Model/Operating Model.md`
- `Pillars/Engineering Practice/Architecture/AI Execution Fabric.md`
- `Pillars/Engineering Practice/Architecture/Engineering Estate.md`
- `Admin/Governance/Decisions/ADR-TECHNE-001-provider-neutral-isolated-agent-execution.md`
- `Admin/Governance/Decisions/Decisions.md`
- `Pillars/Engineering Practice/Architecture/Diagrams/Engineering Estate.mmd` and its generated SVG only if the textual review establishes that the existing diagram would misrepresent the new boundaries
- This Stream record

## Verify

- The canonical model distinguishes attached interactive, persistent supervised, and unattended isolated work without prescribing one runtime or provider.
- Controller, task environment, bootstrap profile, agent runtime, Git, change management, and human review have distinct responsibilities and an explicit integration boundary.
- Execution placement and task isolation remain separate decisions, with security, continuity, state, credential, network, recovery, and evidence consequences visible.
- `ADR-TECHNE-001` records the decision, alternatives, consequences, and evidence-driven review triggers.
- Wikilinks resolve, Markdown passes the authoring audit, the KB Streams audit passes, and the existing estate description remains internally consistent.

## Dependencies / blocks

No build dependency blocks enactment. `TECHNE-OPS-002` supplies later hands-on evidence for persistent supervised sessions but is not required to state the three-mode boundary. `KI-HARNESS-RTP-012` consumes the accepted model and retains its own executable-contract lifecycle.

## Delegation

Keep this enactment in one coordinator-owned lane because the principle, operating model, architecture, estate responsibilities, and decision rationale must use one vocabulary. Mechanical link and Markdown checks may run independently, but canonical prose should not be split across writers.

## Review

### Delivered

Implemented the provider-neutral isolated-agent execution model from immutable baseline `9a35c318992672e5d6b21ad46debe88030c77222`. Commit `5f3191eb960f50ba5629d8a9fd04c0d5461557d0` adds the governing architecture and Decision Record without selecting or provisioning a provider.

### Summary changes

Added proportionate isolation to [[Principles]], three working modes to [[Operating Model]], independent execution-selection axes to [[AI Execution Fabric]], and explicit controller, task-environment, bootstrap-profile, agent-runtime, and integration responsibilities to [[Engineering Estate]]. Added `ADR-TECHNE-001` and its collection entry. The conformant local identity is `ADR-TECHNE-001`, replacing the draft's earlier `ADR-KI-TECHNE-001` proposal. Review established that the current estate diagram does not need changing because it does not depict these generic roles. Commit `dde5de56f4e030cc92bb11fb9a4e8540dc45fcf1` also repaired the pre-existing `GDR-TECHNE-001` note-type metadata exposed by the full KB audit.

### Verification

`ki repo audit --skill ki-work --repo .`, `ki repo audit --skill ki-repo-kb-streams --repo .`, `ki repo audit --skill ki-decision-records --repo .`, `ki repo audit --skill ki-authoring --repo .`, and `ki repo audit --skill ki-repo-kb --repo .` all pass. The authorised batch payload still resolves unchanged as SHA-256 `381e90d881f7fb1b330ad5c2b9bffe1654066340f49eee972dccc040c9b1701d`.

### Outstanding concerns

The hands-on proofs remain deliberately outside this architecture enactment. `TECHNE-OPS-002` waits for a named Mac Studio or personal-server access path and environment details. `TECHNE-OPS-003` waits for a user-started AWS SSO session, live account evidence, cost authority, and teardown approval. Neither blocks review of this provider-neutral model.

### Post-change review

The enacted notes now distinguish attached interactive, persistent supervised, and unattended isolated work; separate placement from isolation; retain Git and change management as authoritative; and keep provider-specific infrastructure behind adapters. No external system was contacted, no infrastructure was mutated, and the dedicated branch remains unmerged for consolidated acceptance.

### Mini recap

Techne now owns the durable execution model. Operational proofs are separately visible and waiting for their explicit inputs, while Harness and dotfiles implementation remain outside this batch.

## Discussion

### Principle shape

The durable technique is not Docker, Kubernetes, or Cheztoi. It is that one independently acting agent task receives one isolated execution environment, created from a portable declaration, with explicit state, credential, network, evidence, and teardown boundaries.

This complements Provider-Neutral Execution: workload constraints choose an eligible execution target, while the isolation principle defines how the task is contained once placed there. It also makes Clear Separation of Responsibilities operational by keeping the controller, sandbox substrate, bootstrap profile, and agent runtime replaceable.

### Working modes

The operating model should distinguish attached interactive work, persistent human-supervised remote work, and unattended isolated execution. These modes may use overlapping tools, but they have different expectations for operator presence, session continuity, authority, credentials, observation, control, recovery, and evidence return.

`TECHNE-OPS-002` owns the Zed, Herdr, and Mosh evidence for persistent supervised sessions. This proposal owns the unattended isolated-execution principle and the boundary between modes. The Harness receives only the executable capability and conformance consequences of the accepted model.

### Estate evidence

- **Techne architecture:** [[AI Execution Fabric]] already separates workload requirements from local, managed-API, elastic, and future dedicated execution tiers. [[Engineering Estate]] assigns persistent execution to Herdr, private connectivity to Tailscale, engineering interaction to Zed, and deterministic operations to tools-mgit.
- **Techne working style:** [[Define Remote Agent Working Style]] owns the proof for attached work and persistent human-supervised sessions, including Zed over SSH, Herdr continuity, observation and recovery. This proposal owns unattended isolated execution and the deliberate transition into or out of that mode.
- **Harness contract:** `KI-HARNESS-RTP-012` holds the prospective provider-neutral lifecycle and conformance contract. `KI-HARNESS-RTP-010` is a downstream Fly.io proof candidate, not authority to select Fly.io.
- **Personal bootstrap:** `DOTFILES-UE-020` waits for this model and the Harness profile contract before projecting a portable Cheztoi profile from personal source state.
- **Delivery tooling:** `tools-ki` has no current sandbox adapter. Its possible compiler, CLI, or adapter role remains deferred until at least two implementations demonstrate a reusable seam.
- **Earlier estate direction:** Arcadia's June 2026 draft Technē note proposed a hybrid Mac Studio and AWS EKS estate. Treat that as historical design input: current Techne architecture retains AWS Elastic Execution at Trial and does not make EKS or Kubernetes the settled runtime.

### Current Codex and agent surfaces

- **Codex local:** A Local chat runs directly in the selected project directory on the chosen Mac. It is useful as an attached baseline but is not an independently provisioned task environment.
- **Codex worktree:** A Worktree chat runs on the same Mac in a separate Git worktree. It isolates concurrent repository changes, not the host filesystem, credentials, network, or process boundary.
- **Codex cloud:** A Cloud chat runs in an OpenAI-managed container from a selected repository revision with setup and maintenance scripts. It is an immediately available remote execution surface, but its managed container and environment contract are not a portable KI substrate.
- **Codex Remote and SSH hosts:** [Remote connections](https://learn.chatgpt.com/docs/remote-connections) can run chats against an always-on Mac or an SSH host using that host's projects, tools, credentials, permissions, and sandbox settings. Chat hand-off can create or reuse a worktree on the destination. This is a strong path to Mac Studio execution once the host is explicitly configured, but it remains attached or persistent supervised work unless a separate task sandbox is provisioned there.
- **Subagent threads:** Codex and the Harness `ki-subagents` family can coordinate parallel specialist threads. Subagents inherit the parent execution location and sandbox policy, so delegation is orchestration capacity rather than environment isolation.
- **Agent SDK skills:** Installed Cloudflare and OpenAI Agents SDK skills support application-level controllers and agents. The installed Cloudflare Sandbox SDK skill supports a remote sandbox adapter implementation. Skills provide implementation guidance; they do not prove a provider account, deployed control plane, credentials, or runtime availability.

### Observed workstation tooling

The 2026-09-09 inspection ran on an Apple-silicon MacBook, not the Mac Studio, so it is evidence for the current control workstation only and must not be projected onto the Studio.

- **Ready interaction and bootstrap tools:** Codex CLI, Claude Code, Zed, VS Code, Git, GitHub CLI, chezmoi, mise, SSH, Tailscale, and Herdr are installed. No project-scoped Dev Container or container build definition was found across the six canonical repositories.
- **Partial Kubernetes and AWS client layer:** `kubectl`, Helm, k9s, AWS CLI, and AWS CDK are installed. The selected `rancher-desktop` context points to a refused loopback endpoint; Rancher Desktop itself was not found. This is stale client configuration, not a running local cluster.
- **Missing local substrate:** Docker, Podman, Docker Sandboxes `sbx`, Colima, Lima, kind, minikube, k3d, and other inspected local container or VM engines were not found.
- **Missing remote-provider clients:** Daytona, E2B, Coder, Fly, Modal, `eksctl`, Terraform, OpenTofu, and Pulumi CLIs were not found. Their absence does not prevent SDK or API use, but no local operator path is currently established.
- **Mac Studio unknowns:** The Studio's reachability, remote-control or SSH setup, installed tools, repository roots, container runtime, Kubernetes state, Herdr service mode, and credentials boundary remain unobserved. [[Define Remote Agent Working Style]] should establish the supervised access path; this proposal should then decide which isolated adapter, if any, runs on that host.

### AWS footprint opportunity

The supplied account evidence and a locally configured `knowledge-islands-techne` AWS profile establish a dedicated AWS administrative footprint as a plausible elastic-execution target. They do not establish which resources already exist. The profile's SSO token was expired during the 2026-09-09 inspection, so live regional resources, quotas, network topology, CDK bootstrap state, and current spend remain unverified. Account identifiers and sign-in details are sensitive operational details and must not be copied into this record.

- **Available client layer:** AWS CLI, AWS CDK, `kubectl`, Helm, and k9s are installed. No CDK application or other infrastructure-as-code project was found in the inspected canonical repositories.
- **EKS Auto Mode:** [EKS Auto Mode](https://docs.aws.amazon.com/eks/latest/userguide/automode.html) can manage control-plane-adjacent infrastructure, node provisioning, scaling, networking, load balancing, and block storage while retaining Kubernetes APIs. It is the lowest-operations EKS starting point, but its managed, immutable nodes may constrain custom runtime classes needed for gVisor or Kata isolation; prove compatibility rather than assuming it.
- **EKS on Fargate:** [EKS Fargate](https://docs.aws.amazon.com/eks/latest/userguide/fargate.html) gives each Pod a separate VM, CPU, memory, storage, and network boundary. Its lack of privileged containers, DaemonSets, EBS mounts, and dynamic persistent-volume provisioning may conflict with Docker-in-Docker, Agent Sandbox controllers, warm pools, or persistence patterns. Treat it as a candidate to test, not a presumed Agent Sandbox host.
- **ECS on Fargate:** [ECS Fargate security](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/fargate-security-considerations.html) provides isolated task execution without Kubernetes. It may be the smallest AWS adapter for one-shot agent work when the Kubernetes API, claims, and warm pools add no value.
- **CodeBuild:** [CodeBuild on-demand environments](https://docs.aws.amazon.com/codebuild/latest/userguide/create-project.html) provide short-lived managed build containers and automatic scaling. They are a useful bounded-job control but do not supply the resumable sandbox lifecycle or stable identity required for every agent mode.
- **CDK projection:** AWS CDK can own repeatable VPC, IAM, ECR, EKS or ECS, logging, budget, and teardown resources and apply Kubernetes manifests or Helm charts. CDK should remain one provider adapter behind the portable execution contract, not become the contract itself.
- **Security and cost boundary:** Administrative access may bootstrap the footprint, but controllers and task environments need separate least-privilege roles, short-lived credentials, bounded egress, encrypted state, audit logs, mandatory ownership and expiry tags, budget alarms, default time-to-live, and a tested destroy path. EKS retains a per-cluster charge even when workload nodes scale to zero, with separate compute, storage, address, and network charges documented in [EKS pricing](https://aws.amazon.com/eks/pricing/).

### Prospective Techne execution tool

A distinct execution tool is plausible, but its boundary should follow the evidence rather than the AWS implementation name.

- **`ki` remains the governance tool:** It selects repositories, manages knowledge and skills, and runs the governed work lifecycle. It should not acquire provider credentials or silently become an infrastructure control plane.
- **A prospective `techne` tool manages execution:** Its eventual surface could plan, create, inspect, execute, transfer evidence, checkpoint, suspend, resume, and destroy task environments through local, Kubernetes, and managed-provider adapters.
- **Profiles and task manifests are inputs:** The tool should consume one portable bootstrap profile, immutable repository baseline, task authority, network and credential policy, result destination, and cleanup policy. Git commits, patches, logs, manifests, and review packets remain outputs independent of the provider.
- **CDK is an implementation backend:** An AWS adapter may synthesize and deploy CDK stacks, install Agent Sandbox resources with Helm or Kubernetes manifests, and expose safe stack outputs. Equivalent local or hosted adapters should not need to understand CloudFormation.
- **Begin as a proof, not a product:** The first slice should be a narrow, reviewable CDK project and command script that deploys one disposable environment, runs one bounded repository task, returns evidence, and destroys cleanly. A dedicated executable or repository should be established only after the local and AWS proofs reveal a stable shared lifecycle.

### Layer model

The persistent controller owns session identity, policy, credential brokerage, lifecycle, and result integration. The sandbox substrate supplies the filesystem, process, network, and isolation boundary. The bootstrap profile declares the required environment. The agent runtime performs the bounded task. Git and the selected change-management process remain authoritative outside any one sandbox session.

Execution tier, isolation mechanism, environment profile, and agent runtime are independent choices. A local microVM and a remotely scheduled Kubernetes sandbox can consume the same profile; different agent runtimes can operate inside either without changing the governing principle.

### Profile and artifact boundary

Classify candidate dotfiles inputs as portable prerequisite, agent capability, personal preference, secret-bearing state, or machine-specific state. Cheztoi should contain only the portable subset and render independently consumable artifacts with exact feature or package locking where supported.

Use [the Development Container specification](https://github.com/devcontainers/spec/blob/main/docs/specs/devcontainer-reference.md) as the primary portable development-environment projection and [the OCI Image specification](https://github.com/opencontainers/image-spec/blob/main/spec.md) for image packaging and transport. Chezmoi may produce these artifacts, but consuming them must not require the full personal dotfiles repository.

### Reference mapping

- **Kubernetes execution:** [Kubernetes SIG Apps Agent Sandbox](https://agent-sandbox.sigs.k8s.io/docs/) supplies `Sandbox`, `SandboxTemplate`, `SandboxClaim`, and `SandboxWarmPool` APIs, stable identity, optional persistence, hibernation, scheduled deletion, and runtime choice including gVisor or Kata Containers. It is the clearest Kubernetes-native substrate reference, but requires an operating cluster, storage, networking, policy, and controller lifecycle around it.
- **Kubernetes workspaces and control plane:** [Coder Agents](https://coder.com/docs/ai-coder/agents/architecture) separates the agent loop and provider credentials in its control plane from tool execution in user-owned workspaces. [Coder on Kubernetes](https://coder.com/docs/install/kubernetes) can provision that control plane and workspace templates on a cluster. It is a broader self-hosted development platform than the minimum sandbox contract and should be assessed as controller plus workspace system, not treated as equivalent to Agent Sandbox.
- **OpenAI-managed execution:** [Codex cloud environments](https://learn.chatgpt.com/docs/environments/cloud-environment) provide repository checkout, setup, cached environment, bounded internet policy, execution, diff, and pull-request hand-off. They are a useful managed baseline against which KI portability and evidence requirements can be tested.
- **Local microVM execution:** [Docker Sandboxes](https://docs.docker.com/ai/sandboxes/) runs supported coding agents in isolated microVMs and proxies credentials from the host. Its normal project workflow shares the host project read-write, so the KI proof must use a mountless sandbox or an independently cloned repository rather than claiming the default shared-workspace path satisfies private-clone isolation.
- **Remote sandbox services:** [Daytona](https://www.daytona.io/docs/) offers persistent OCI-compatible sandboxes, snapshots, lifecycle and network controls, including bring-your-own compute; [E2B](https://docs.e2b.dev/) offers on-demand isolated Linux VMs with templates and pause or resume; [Cloudflare Sandbox SDK](https://developers.cloudflare.com/sandbox/) exposes isolated container execution, files, processes, services, storage mounts, and outbound interception through Workers; [Modal Sandboxes](https://modal.com/docs/guide/sandboxes) provides elastic arbitrary-code sandboxes; and [Fly.io Sprites](https://fly.io/sprites/) provides persistent Firecracker microVMs, checkpoints, sleep and resume.
- **Selection posture:** Agent Sandbox and Coder are the principal Kubernetes-based references. Docker Sandboxes is the strongest local-isolation candidate for the Mac Studio. Codex Cloud is the lowest-friction managed baseline. Daytona, E2B, Cloudflare, Modal, and Fly provide materially different remote proofs; none is selected by this proposal.
- **Grok Bot:** [Grok Bot](https://x.ai/bot) is a managed-product reference for always-on teammates with their own computers and multi-agent hand-offs; it primarily informs the controller and cockpit layer.
- **Grok Build:** [Grok Build](https://github.com/xai-org/grok-build) is an open-source coding-agent harness and terminal interface with Agent Client Protocol support; it primarily informs the agent-runtime and interaction layer rather than the sandbox substrate.
- **Cheztoi:** one personal, reproducible bootstrap profile containing the portable subset of dotfiles knowledge; it is neither the controller nor the sandbox.
- **Dev Container and OCI:** open artifact boundaries for describing and distributing the environment independently from a provider's snapshot format.

The candidate proving sequence should use Codex Worktree as a no-new-substrate control, Docker Sandboxes with a mountless or private clone as the local-isolation proof, and Agent Sandbox on a disposable local or remote Kubernetes cluster as the materially independent proof. Run the same Dev Container and OCI bootstrap artifacts in each. Add one hosted provider only when it tests a requirement those proofs cannot, such as durable suspension, organisational control, edge placement, or burst scale. Provider APIs remain behind adapters and provider snapshots remain acceleration rather than authority.

### State and authority

Git commits, patches, canonical work records, manifests, logs, and review evidence remain authoritative and portable. Sandbox snapshots are reconstructible acceleration or explicitly governed persistence, never the sole hand-off record.

Credentials should be scoped, short-lived, and injected at runtime, preferably through the controller or a proxy. Network access should be bounded by task policy. A fresh clone removes host-filesystem contention but does not remove competing claims, branch conflicts, or change-record coordination.

### Knowledge and implementation ownership

Techne is accountable for the durable engineering principle, working modes, conceptual execution model, technology landscape, cross-repository coherence, and evidence review. `ki-agentic-harness` is responsible for reusable sandbox capability semantics and conformance tests. Dotfiles is responsible for the Cheztoi profile instance and approved personal remote-session configuration. `tools-ki` may eventually become responsible for a provider-neutral compiler, CLI, or adapter surface once multiple proofs establish that boundary.
