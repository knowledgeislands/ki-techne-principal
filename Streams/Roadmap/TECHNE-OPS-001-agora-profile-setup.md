---
type: stream-proposal
id: TECHNE-OPS-001
area: OPS
title: Agora Profile Setup
aliases:
  - Agora Profile Setup Proposal
theme: operational-tooling
horizon: now
status: draft
priority: medium
dependencies: []
blocks: []
blocked_by: []
baseline_ref: null
transferred_from: Streams/Now/Agora Profile Setup Proposal/Agora Profile Setup Proposal.md
---

# Agora Profile Setup

## Goal

Complete visual acceptance of the Agora profile launcher so one named profile opens its declared projects as separate Zed projects in a single window, with the primary project first.

## Context

Agora is the Knowledge Islands name and profile contract for opening a deliberately bounded Zed window through the `ki` CLI. The profile contract, managed profiles, CLI commands, and automated tests are already delivered in their owning repositories. This record retains the remaining bounded acceptance work.

## Boundary

This work does not define the wider engineering environment, select a terminal, govern agent workflows, create a Tools area, or make Agora the name for every engineering interface. macOS and Finder file association remains deferred to a separate phase.

## Current state

The `ki agora list|show|open` commands, chezmoi-managed `.ki-agora` profiles, and automated profile-contract tests are complete. The remaining gap is a visual check of the applied `ki-fnd` profile in Zed.

## Steps

- [ ] Create one empty Zed window, then open every profile project with `zed -e` in reverse visual order.
- [ ] Run `ki agora open ki-fnd` and confirm visually that Zed opens the expected separate project roots in one window.

## Files touched

- No Techne canonical note is planned to change.
- The visual acceptance run concerns the applied `ki-fnd` Agora profile and the `tools-ki` CLI.

## Verify

- `ki agora open ki-fnd` opens one Zed window.
- The expected project roots appear as separate Zed projects.
- The primary project appears first in the sidebar.

## Dependencies / blocks

The visual test requires the applied `ki-fnd` profile and a locally available Zed application. No roadmap item blocks the work.

## Discussion

### Profile contract

```toml
name = "Knowledge Islands Fundamentals"
tool = "zed"
primary = "techne"

[projects]
techne = "/absolute/path"
tools-ki = "/absolute/path"
```

`primary` identifies the project displayed first. The requested visual order is primary first, then remaining project keys in English lexical order. The launcher creates an empty window with `zed -n`, then invokes every profile project with `zed -e` in reverse visual order. Zed prepends each incoming project, so adding the primary last places it first in the sidebar.

### Phase boundary

Phase 1 is complete when the CLI loads an applied profile and each named root appears as a separate Zed project in one window during visual acceptance. Phase 2 may add macOS and Finder `.ki-agora` file association for double-click opening; it requires separate design and implementation work.

### Delivered configuration

The initial managed profiles are `ki-fnd.ki-agora`, `ki-mcps.ki-agora`, `personal.ki-agora`, `hnr.ki-agora`, and `legal.ki-agora`. A profile may carry no projects until its intended scope is deliberately populated.
