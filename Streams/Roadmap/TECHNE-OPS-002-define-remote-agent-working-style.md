---
note_type: stream-proposal
id: TECHNE-OPS-002
area: OPS
title: Define remote agent working style
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
---

# Define Remote Agent Working Style

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

The supported-interface comparison and proof design are complete enough to execute once a target exists. Herdr is installed locally at `/opt/homebrew/bin/herdr`, but the inspected SSH configuration names no personal-server host and the inspected Zed configuration names no remote server. The server operating system, repository root, access path, service mode, and exposure authority therefore remain unresolved.

## Steps

- [ ] Name the personal-server operating system, canonical repository root, SSH host or access path, intended Herdr service mode, and authentication boundary.
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

Hands-on proof remains blocked on a named Mac Studio or personal-server target and access path. Resume when its operating system and hardware, canonical repository root, SSH or Codex Remote path, installed runtimes, container or Kubernetes substrate, intended supervised versus unattended use, service mode, and exposure authority can be inspected. No local roadmap dependency blocks the analysis or operating-model design.

## Discussion

### Working-mode boundary

An attached interactive session assumes a present operator and may share the operator's workstation context. A persistent supervised session survives client disconnect while retaining explicit human observation and control. An unattended isolated task receives bounded authority and returns evidence through the change-management and review boundary. Moving between modes must be deliberate because identity, credentials, continuity, and recovery expectations change.

### Evaluation evidence

Use [Zed remote-development documentation](https://zed.dev/docs/remote-development), [Herdr's primary repository](https://github.com/herdrdev/herdr), [Herdr remote-persistence documentation](https://herdr.dev/docs/persistence-remote/), [Herdr session-state documentation](https://herdr.dev/docs/session-state/), [Herdr socket API documentation](https://herdr.dev/docs/socket-api/), and [Mosh documentation](https://mosh.org/) as the supported-interface baseline. Compare local-first operation, filesystem and Git access, authentication, data egress, automation surfaces, remote-session semantics, and portable versus runtime-specific capability.

### Ownership

Techne owns the working style, responsibility model, evidence comparison, and technology posture. Dotfiles owns approved personal configuration. The Harness owns only reusable agent capabilities and executable conformance contracts derived from the accepted model.
