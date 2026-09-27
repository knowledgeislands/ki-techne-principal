---
note_type: stream-proposal
id: TECHNE-OPS-002
area: OPS
title: Remote agent working style
aliases:
  - Remote Agent Working Style Proposal
theme: operational-tooling
horizon: waiting-for
status: draft
priority: medium
dependencies: []
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-08T22:33:40Z
updated_at: 2026-09-27T05:20:00Z
---

# Remote Agent Working Style

## Goal

Define and validate the Knowledge Islands working style for persistent, human-supervised remote agent sessions, including continuity, identity, observation, control, recovery, and accountable hand-off.

## Context

Techne's [[Operating Model]] already assigns persistent execution beyond an interactive session to Herdr and reserves detailed remote-engineering practice for a future chapter. `TECHNE-GOV-005` separately governs unattended agents in isolated task environments. The operating model still needs to distinguish an attached interactive session, a persistent supervised remote session, and an unattended isolated task without treating their runtimes or transports as interchangeable.

This proposal receives the useful analysis formerly held by `KI-HARNESS-RTP-004`. Zed remote development keeps its interface local while source access, terminals, tasks, and language tooling run on an SSH-reached host. Herdr addresses persistent named sessions, detach and reattach, observation and control, agent-state reporting, and native session restoration. Mosh is a separate roaming terminal transport rather than a Zed remote-development transport.

## Boundary

Do not select a general sandbox substrate, redefine the Harness executable capability contract, replace the working Zed setup, expose an unauthenticated service, or conflate editor reconnection, terminal persistence, child-process survival, agent orchestration, and native agent-session restoration. Personal SSH, Zed, Herdr service, and machine configuration remain dotfiles responsibilities after the working style is accepted.

## Shaping

Define three explicit operating modes and their transition boundaries: attached interactive work, persistent human-supervised remote work, and unattended isolated execution. State which component owns session identity, repository identity, observation, control, process continuity, native runtime recovery, result integration, and review in each mode.

Validate the supervised mode with a bounded Zed and Herdr proof on a named personal-server target. Record Mosh only if a roaming terminal outside Zed is an evidenced requirement. Use the result to correct [[Operating Model]], [[Engineering Estate]], and [[AI Execution Fabric]] without turning one product into the architectural model.

Promote this proposal when the server operating system, canonical repository root, SSH access path, intended Herdr service mode, exposure boundary, and exact pass or fail criteria are known.

## Current state

The supported-interface comparison and proof design are complete enough to execute once a target exists. Herdr is installed locally at `/opt/homebrew/bin/herdr`, but the inspected SSH configuration names no personal-server host and the inspected Zed configuration names no remote server.

A target has now been inspected and partly resolved. Covering Paperclip task: `KIS-7`, formerly keyed `KNO-7` before the project was re-established against an admitted repository baseline.

**Resolved.** The target is the deployed Techne controller host: a single-node K3s control plane on Ubuntu 24.04 LTS, two processors and four gigabytes of memory, sixteen-gigabyte encrypted root volume with about twelve gigabytes free, running continuously and reporting the cluster healthy. The access path is the AWS Systems Manager session service over the instance's existing outbound HTTPS allowance. That path requires no inbound exposure: the instance security group has no ingress rules at all, the instance has no SSH key pair, and none is needed. The authentication boundary is therefore an identity permission that can be scoped and revoked centrally, rather than key material held on one machine. The exposure authority for this target is the repository owner, recorded on `KIS-7`.

**Resolved by evidence, not assumption.** The session service was observed to survive a severed connection rather than a clean detach: after the local transport was killed outright, the far-side shell and its session worker were still alive on the host, and the service's resume operation returned a working stream for that same session. A terminal multiplexer is already installed on the host. These are the transport properties the persistent human-supervised mode depends on, and they hold.

**Decided by the repository owner on 2026-09-27, recorded on `KIS-7`.** The Techne controller host carries the persistent human-supervised mode, and it holds a single repository working copy rather than the full archipelago checkout. Capacity drove the second decision: an archipelago checkout is about nine gigabytes against roughly twelve gigabytes free, which fits but leaves no headroom for the runtimes and images the supervised mode needs. The first decision knowingly accepts a shared blast radius, because a supervised session and the deterministic controller then share one node, one root volume, and one kubelet, so a runaway build on the supervised side can starve the controller that `TECHNE-OPS-007` depends on. That consequence is accepted deliberately and belongs in the provisioning item's boundary rather than being rediscovered during the proof.

**Unresolved.** Which single repository the canonical root holds is not yet named, and neither is the intended Herdr service mode. Neither can be settled before provisioning, because the host carries no agent runtime, no Node or Bun runtime, and no Herdr installation today. `TECHNE-TOOLS-OPS-008` in the Harness carries that provisioning at horizon `triage`, so it is captured but not yet ready and no one is authorised to deliver it. Until it is, the Zed remote and Herdr legs of the proof remain unrun, not for want of a target or an access path but for want of anything installed to detach from.

**Mode scope.** For the unattended isolated mode this substrate is a good fit and is already governed in the Harness. For the persistent human-supervised mode the target, the access path, the authentication boundary, and now the host are all named, and the transport properties are proven, so only provisioning stands between this record and the proof. The attached interactive mode remains the operator's own machine and is out of scope for this item. The horizon stays `waiting-for` because every proof leg is still unrun and promotion additionally needs the repository root and the Herdr service mode; promoting it is a separate adoption decision.

## Steps

- [x] Name the supervised host, its operating system, the access path, and the authentication boundary.
- [ ] Name the single repository the canonical root holds and the intended Herdr service mode, once the host is provisioned.
- [ ] Observe the Zed-only baseline through an intentional SSH disconnect and reconnect.
- [ ] Run the Herdr proof through detach and reattach, dropped SSH, durable child-process survival, blocked or idle agent state, repository identity, and simultaneous observer versus controller behaviour.
- [ ] Restart Herdr separately and record layout restoration, terminal-process loss or survival, and native Codex or Claude Code session restoration.
- [ ] Decide whether Mosh adds a required roaming-terminal path outside Zed.
- [ ] Enact the accepted working modes, responsibility boundaries, recovery expectations, and review points in Techne's canonical operating-model notes.
- [ ] Route any approved personal implementation to dotfiles and any reusable executable contract or conformance requirement to the Harness.

## Files touched

- `Pillars/Engineering Practice/Operating Model/Operating Model.md`
- `Pillars/Engineering Practice/Architecture/Engineering Estate.md`
- `Pillars/Engineering Practice/Architecture/AI Execution Fabric.md`
- `Pillars/Engineering Practice/Technology/Technology Radar.md` only if the evidence supports a technology posture
- This Stream record and any separately approved receiver-owned implementation records

## Verify

- The operating model distinguishes attached, persistent supervised, and unattended isolated modes.
- Reconnection evidence distinguishes editor recovery, terminal-process ownership, service restart, and native agent-session restoration.
- The proof records session, repository, and process identity before and after disconnect and restart.
- Authentication, exposure, repository permissions, data egress, observation, control, and recovery boundaries are explicit.
- Product findings remain evidence for the working style rather than becoming the architecture itself.

## Dependencies / blocks

The hands-on proof is no longer blocked on naming a target. The host, its operating system and hardware, the access path, the authentication boundary, the exposure authority, the Kubernetes substrate, and the supervised versus unattended split are all inspected, decided, and recorded above.

The proof is now blocked on provisioning that host with an agent runtime and Herdr, which `TECHNE-TOOLS-OPS-008` in the Harness carries at horizon `triage`. That item must reach a ready state and be approved before any Zed or Herdr leg can run, because installing runtimes on a running controller is an infrastructure change and the owner's approval is the gate.

Two further constraints belong to the proof rather than to the host, and are recorded here so they are not mistaken for host faults. The agent adapter that would otherwise drive Herdr cannot start it at all: the adapter redirects the home directory to a path long enough that Herdr's control socket exceeds the platform's socket-path limit, so Herdr evidence must come from an operator terminal or from an adapter change. And host death mid-run stays out of scope for this item, because session persistence is process persistence on a live host rather than run durability; that gap belongs to the remote-adapter design.

No local roadmap dependency blocks the analysis or operating-model design.

## Discussion

### Working-mode boundary

An attached interactive session assumes a present operator and may share the operator's workstation context. A persistent supervised session survives client disconnect while retaining explicit human observation and control. An unattended isolated task receives bounded authority and returns evidence through the change-management and review boundary. Moving between modes must be deliberate because identity, credentials, continuity, and recovery expectations change.

### Evaluation evidence

Use [Zed remote-development documentation](https://zed.dev/docs/remote-development), [Herdr's primary repository](https://github.com/herdrdev/herdr), [Herdr remote-persistence documentation](https://herdr.dev/docs/persistence-remote/), [Herdr session-state documentation](https://herdr.dev/docs/session-state/), [Herdr socket API documentation](https://herdr.dev/docs/socket-api/), and [Mosh documentation](https://mosh.org/) as the supported-interface baseline. Compare local-first operation, filesystem and Git access, authentication, data egress, automation surfaces, remote-session semantics, and portable versus runtime-specific capability.

### Ownership

Techne owns the working style, responsibility model, evidence comparison, and technology posture. Dotfiles owns approved personal configuration. The Harness owns only reusable agent capabilities and executable conformance contracts derived from the accepted model.
