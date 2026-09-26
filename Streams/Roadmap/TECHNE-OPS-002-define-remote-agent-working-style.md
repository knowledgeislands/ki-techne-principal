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
updated_at: 2026-09-26T16:05:00Z
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

A target has now been inspected and partly resolved. Covering Paperclip task: `KIS-7`.

**Resolved.** The target is the deployed Techne controller host: a single-node K3s control plane on Ubuntu 24.04 LTS, two processors and four gigabytes of memory, sixteen-gigabyte encrypted root volume with about twelve gigabytes free, running continuously and reporting the cluster healthy. The access path is the AWS Systems Manager session service over the instance's existing outbound HTTPS allowance. That path requires no inbound exposure: the instance security group has no ingress rules at all, the instance has no SSH key pair, and none is needed. The authentication boundary is therefore an identity permission that can be scoped and revoked centrally, rather than key material held on one machine. The exposure authority for this target is the repository owner, recorded on `KIS-7`.

**Resolved by evidence, not assumption.** The session service was observed to survive a severed connection rather than a clean detach: after the local transport was killed outright, the far-side shell and its session worker were still alive on the host, and the service's resume operation returned a working stream for that same session. A terminal multiplexer is already installed on the host. These are the transport properties the persistent human-supervised mode depends on, and they hold.

**Unresolved.** The canonical repository root is not yet chosen, and capacity is the reason: a full archipelago checkout is about nine gigabytes against roughly twelve gigabytes free, which fits but leaves little headroom for runtimes and images. No agent runtime, Node or Bun runtime, or Herdr installation exists on the host, so the intended Herdr service mode cannot be exercised there yet and the Zed remote and Herdr legs of the proof remain unrun. Whether this host should carry the supervised mode at all, given that it would then share a blast radius with the controller, is an open decision carried by `TECHNE-TOOLS-OPS-008` in the Harness.

**Mode scope.** For the unattended isolated mode this substrate is a good fit and is already governed in the Harness. For the persistent human-supervised mode the access path is now proven but the host is not yet provisioned, so no supervised host is named. The attached interactive mode remains the operator's own machine and is out of scope for this item. The horizon stays `waiting-for` because the supervised host decision and the repository root are still open, and promoting it is a separate adoption decision.

**Write-root enforcement for the unattended isolated mode, decided 2026-09-26.** The repository owner selected a host sandbox with a private clone per task as the enforcement mechanism for agents that change repositories, in preference to leaving the read-only rule as convention and in preference to waiting for the Kubernetes substrate. Covering Paperclip task: `KIS-10`. The decision was needed because the rule was previously convention and review alone: on this platform the process sandbox that would bound a write root is unavailable, and a write to an absolute path outside every declared root was observed to succeed with no prompt.

The mechanism is a named permission profile on the Codex CLI lane, whose write root on this platform is the operating system's own sandbox, granting the task's private clone and nothing else. A clone is required rather than a worktree because all worktrees of one repository share a single ref store, object database and configuration, so a run permitted to commit inside a worktree is necessarily also permitted to rewrite or delete refs belonging to the operator. That follows from the worktree layout rather than from any host, and so it holds on the Kubernetes substrate too. The clone must be made with `git clone --no-hardlinks`: cloning from a local path otherwise hardlinks both loose objects and packfiles, leaving object files inside the clone that are the same inodes as the original's, and one in-place write there can leave both copies unreadable. `--shared` and `--reference` are both excluded, and for different reasons: the first leaves the clone no objects of its own, and the second still hardlinks.

_Exposure authority._ None is required and none is granted. The mechanism withdraws write access rather than adding reachability: no port, endpoint, service, account or identity permission is involved, and the change is confined to one lane's adapter configuration on the operator's own machine. The profile itself is machine configuration and belongs to dotfiles under this item's Boundary; Techne records the decision and its terms, not the configuration.

_Revocation scope._ Deleting the named profile and the adapter argument that selects it restores the lane's previous behaviour on the next run, with no residue and nothing to migrate. The mechanism is expected to be retired rather than maintained: it is superseded when the unattended isolated mode moves to a kernel-enforced write root on the Kubernetes substrate, which is the adapter design carried by `KIS-8`.

_Not yet built, and the reason matters._ Clone per task has no realiser in the harness, which realises a worktree and nothing else, so adopting this lane is an implementation rather than a configuration change. The realisation is to clone the harness-realised worktree, which keeps the recorded base revision and the worktree lifecycle intact, and to return the result by fetching from the worktree side onto the base ref before the workspace is closed. The ordering is load-bearing: the agent's commits live in the clone's own object database, so until that fetch runs they are invisible to every terminal check the harness performs.

**Governing-record gap.** The Context above names `TECHNE-GOV-005` as the record governing unattended agents in isolated task environments. No such record exists in this repository: `Streams/Roadmap/` holds no `GOV` record at all, while `_ISSUES.md` records thirteen allocated `GOV` identifiers. Until that record is written or the reference is corrected, this item is the only Techne home for the decision above, and it is recorded here for that reason rather than because the enforcement mechanism belongs to the remote working style.

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
