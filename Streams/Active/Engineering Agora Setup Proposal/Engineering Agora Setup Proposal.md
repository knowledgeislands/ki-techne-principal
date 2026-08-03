---
type: stream-proposal
title: Engineering Agora Setup Proposal
status: draft
priority: medium
dependencies: []
---

# Engineering Agora Setup Proposal

## Overview

Establish an engineering Agora for orienting, navigating, editing, reviewing, and coordinating AI-assisted work across the engineering estate.

The Agora combines a live operations surface for concurrent agent and terminal work with a focused engineering interface for navigation, editing, and review. The work will configure and validate that practical arrangement in the existing production environment, preserving productivity throughout the transition.

The aim is a coherent Agora practice, not a narrow editor-for-editor substitution. Zed, VS Code, Ghostty or Warp, Codex, Claude Code, Git, and Herdr retain distinct, complementary roles.

## Inputs

- **Document:** Engineering Platform Adoption Handover, received 2026-08-03 from the architecture handover conversation.
- **Document:** [[Technology Radar]], which currently records Zed as Adopt and VS Code as Hold.
- **Decision:** Zed is the adopted primary engineering interface, to be configured incrementally with production productivity preserved throughout the transition.
- **Decision:** Live, concurrent agent and terminal work requires an Agora surface beyond Zed's single active agent panel.
- **Decision:** Techne distinguishes architectural components from replaceable implementation choices.
- **Decision:** Agora profiles are chezmoi-managed configuration and are opened through the `ki agora` command surface; Zed is the initial renderer.

## Outputs

- **Decision:** A defined operating boundary for Ghostty or Warp, Zed, VS Code, Claude Code, Codex, Git, Herdr, and Knowledge Islands within the engineering Agora.
- **Artefact:** A configured and validated Agora for Techne authoring, architecture, and documentation work.
- **Artefact:** A concise configuration record, verification evidence, and any required canonical-change checklist retained in this proposal.
- **Artefact:** A canonical [[Tools]] area at `Pillars/Engineering Practice/Tools/`, with an index and a durable operating note for each tool materially discussed in Techne.

## Checklist

- [x] Inspect the existing Zed installation, version, settings, extensions, authentication, and project-opening workflow without changing them.
- [ ] Select the live operations surface: Ghostty, Warp, or a defined division between them.
- [ ] Define the initial Agora workflows and operating boundaries for Ghostty or Warp, Zed, VS Code, Claude Code, Codex, Git, Herdr, and Knowledge Islands.
- [ ] Configure the live operations surface for concurrent, repository-scoped agent and terminal sessions.
- [ ] Configure Zed for Techne authoring, architecture, documentation, navigation, and review work, preserving useful existing settings.
- [ ] Define safe project and worktree handling, Git review, and hand-off between the live operations surface and Zed.
- [ ] Define when interactive agent work remains in the Agora and when it becomes persistent work hosted by Herdr.
- [ ] Validate the Agora on representative Techne work and record any constraints or follow-up configuration.
- [ ] Record the resulting configuration and working practice in this proposal.
- [ ] Define the Tools-area note shape and its initial roster.
- [x] Define the chezmoi-managed Agora profile contract and initial named profiles for use by `ki agora`.
- [ ] Prepare the exact canonical rollout: add [[Tools]] to [[Engineering Practice]], create `Tools/Tools.md`, and create the initial tool notes.
- [ ] Identify any exact canonical changes required, update this proposal, and resolve it for ready submission.

## Open Questions

- Should Ghostty, Warp, or a defined combination become the live operations surface?
- What standard pane, tab, and working-directory layout should make concurrent work legible without widening agent scope unnecessarily?
- Which Techne repositories and worktrees should form the initial Agora workspace?
- What triggers work to move from an interactive agent or terminal session into Herdr's persistent execution runtime?
- Which existing Zed settings, extensions, key bindings, and authentication should be preserved?

## Design

### Agora intent

The engineering Agora is the working environment through which the engineer sees and steers concurrent work.

It must make active agent sessions, terminal activity, repository scope, changes, and review states legible without collapsing the distinct roles of the underlying tools.

The Agora does not erase the distinct roles of other tools. Claude Code and Codex remain available for AI-assisted work, Git remains the source of versioned truth, and VS Code remains available where it is the better tool for a task.

The initial setup covers Techne authoring, architecture, and documentation work, providing a focused, lower-risk configuration surface.

### Operating boundaries

- **Ghostty or Warp:** Provides the live operations surface for concurrent, repository-scoped agent and terminal sessions. The chosen surface must make active work observable and easy to arrange without changing source-of-truth controls.
- **Zed:** Maintains the focused engineering interface: projects, files, navigation, edits, diffs, and review context.
- **Git:** Remains the versioned source of truth and the authority for repository state.
- **Codex and Claude Code:** Remain AI collaborators for reasoning, planning, implementation, and review; their work is inspected and reconciled from the Agora.
- **VS Code:** Remains available when a task, extension, or workflow is better served there.
- **Herdr:** Hosts work that must persist beyond an interactive engineering session or client.
- **Knowledge Islands:** Holds governed context, decisions, and durable engineering knowledge.

### Tools area

[[Technology Radar]] records a tool's adoption posture; the Tools area records how Techne actually uses it. The two are complementary: a tool note must not imply adoption beyond its current Radar or Engineering Estate position.

Every tool materially discussed as part of Techne work receives a durable note in `Pillars/Engineering Practice/Tools/`. Each note records its current role, boundaries, related Technology Radar posture or Engineering Estate role, practical configuration and workflow learnings, and links to the relevant canonical guidance.

The initial roster is Zed, Ghostty, Warp, VS Code, Codex, Claude Code, Git, Herdr, Hermes Agent, and tools-mgit. Existing architectural material remains the source for system roles; a corresponding tool note should link to it rather than duplicate it.

The Zed note will become the durable home for settled material from this proposal's learning log. The learning log remains here as work-in-progress evidence until the proposal is enacted.

### Agora configuration

Named Agoras are managed through `ki agora`, not through a separate executable. Chezmoi renders their declarative profiles beneath `~/workspaces/ki-agoras/`, analogous to the existing managed VS Code workspace files.

An Agora profile names a purpose, its renderer, a primary project, and independent project roots in a named `[projects]` table. The primary project opens first with `zed -n`; remaining projects open with `zed -a` in stable key order. The profile remains tool-neutral so future renderers can serve Ghostty, Warp, or another chosen surface.

```toml
name = "Knowledge Islands Fundamentals"
tool = "zed"
primary = "techne"

[projects]
techne = "/absolute/path"
tools-ki = "/absolute/path"
```

The initial Agora-profile filenames are `ki-fnd.ki-agora` for Knowledge Islands Fundamentals, `ki-mcps.ki-agora` for MCP Development, `personal.ki-agora`, `hnr.ki-agora`, and `legal.ki-agora`. Personal, HNR, and legal Agoras will be populated only with deliberately bounded project rosters; HNR is distinct from other work domains.

Phase 1 is limited to loading `.ki-agora` profiles through the `ki` CLI and opening a fresh Zed window for the primary project before adding the remaining projects. Phase 2 is explicitly deferred: macOS and Finder `.ki-agora` file association for double-click opening is not implemented.

### Configuration principles

The setup should be incremental, reversible, and grounded in the user's existing working practices.

Prefer native capabilities and a small, understandable configuration over a broad extension catalogue or duplicated tool integrations.

Preserve the user's existing configuration unless a concrete Agora workflow requires a change. Keep agent scope to a named repository or deliberately chosen multi-project workspace; do not use a broad parent directory as an agent's default working scope. Record each material choice and verify it against representative Techne work before treating it as established practice.

### Configuration record

On 2026-08-03, Zed 1.13.2 was installed at `/Applications/Zed.app` with its user settings in `~/.config/zed/settings.json`.

The existing settings register the `codex-acp` and `claude-acp` external agents. The `codex` and `claude` command-line clients are also available. Techne has no `.zed` or VS Code project configuration and is currently a single Git worktree on `main`.

At initial inspection, `session.trust_all_worktrees` was `true`. The Agora setup chose to restore Zed's secure default and trust known project roots deliberately.

Zed supports multiple repository-scoped agent threads, but presents one live Agent Panel per window. It therefore remains an effective focused engineering interface rather than the live operations surface for tiled, concurrent agent work.

On 2026-08-03, the user settings were updated to restore Zed's per-worktree trust default. The Zed Agent now auto-approves routine inspection commands, ordinary in-project file edits, writes, and directory creation. It continues to require confirmation for other terminal commands, Git history changes and pushes, path moves and deletion, and it blocks edits to common secret-file and credential paths.

On 2026-08-03, `tools-ki` implemented `ki agora list|show|open` and validated the named-project profile contract. The managed profiles were renamed to `~/workspaces/ki-agoras/*.ki-agora`; no chezmoi apply was performed. CLI verification confirmed the primary-first Zed invocation and stable ordering of remaining project keys.

### Learning log

#### 2026-08-03 — Codex instructions and skills

Codex builds a layered instruction chain from `AGENTS.md` files, with nearer project guidance overriding broader guidance. Skills available through `.agents/` are not read wholesale: Codex sees their metadata and loads the complete `SKILL.md` only when the user's request matches the skill.

**Sources:** [Codex `AGENTS.md` guidance](https://learn.chatgpt.com/docs/agent-configuration/agents-md.md); [Codex skills guidance](https://developers.openai.com/plugins/concepts/skills.md).

#### 2026-08-03 — Zed user settings

The user-level Zed configuration is held in `~/.config/zed/settings.json`. It holds personal editor preferences, external-agent registrations, and the Zed Agent tool-permission policy; it is not a project configuration file.

**Sources:** User configuration inspection; [Zed settings guidance](https://zed.dev/docs/configuring-zed).

#### 2026-08-03 — Projects and threads

Use `Cmd+O` to add a folder as another project in the current Zed window. Each project has its own thread group. Use `Ctrl+Tab` to move through recently active threads without leaving the Agent Panel.

**Source:** [Zed windows and projects guidance](https://zed.dev/docs/windows-and-projects).

#### 2026-08-03 — External-agent activity detail

Zed renders Codex ACP activity as individual Thinking and command cards in the Agent Panel. The available card-level chevrons permit inspection on demand, but no documented Zed setting currently collapses all external-agent activity by default or supplies a summary-first transcript view. Continue with the current display for now; revisit this if Zed adds a global collapse control or a compact external-agent transcript mode.

**Sources:** Direct use of the Zed Agent Panel; [Zed Agent Panel guidance](https://zed.dev/docs/ai/agent-panel); [Zed external-agents guidance](https://zed.dev/docs/ai/external-agents).

## Governance

This proposal follows the [[Enactment Process]].
