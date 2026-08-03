---
type: stream-proposal
title: Agora Profile Setup Proposal
status: draft
priority: medium
dependencies: []
---

# Agora Profile Setup Proposal

## Overview

Establish Agora as the Knowledge Islands name and profile contract for opening one deliberately bounded multi-project workspace through the `ki` CLI.

This proposal covers profile loading and Zed window creation only. It does not define the wider engineering environment, select a terminal, govern agent workflows, create a Tools area, or make Agora the name for every engineering interface.

## Inputs

- **Decision:** The provisional Cockpit name is replaced by Agora.
- **Decision:** Agora profiles are chezmoi-managed files under `~/workspaces/ki-agoras/` with the `.ki-agora` extension.
- **Decision:** The current renderer is Zed; the profile remains explicit about its tool.
- **Decision:** macOS and Finder file association is phase 2 and is not part of the current implementation.

## Outputs

- **Artefact:** `ki agora list|show|open` in `tools-ki`.
- **Artefact:** Managed `.ki-agora` profiles in the chezmoi source repository.
- **Contract:** A named `[projects]` table, a required `primary` key, and stable ordering for remaining project keys.
- **Evidence:** CLI tests and one visual acceptance run against the applied `ki-fnd` profile.

## Checklist

- [x] Replace the provisional Cockpit command and profile terminology with Agora.
- [x] Implement and test `ki agora list|show|open`.
- [x] Define the `.ki-agora` profile contract with named `[projects]` entries.
- [x] Open the primary project with `zed -n` and remaining projects with `zed -a` in stable key order.
- [x] Move managed profiles to `~/workspaces/ki-agoras/` and apply them through chezmoi.
- [x] Record macOS and Finder `.ki-agora` file association as explicitly deferred phase 2 work.
- [ ] Run `ki agora open ki-fnd` and confirm visually that Zed opens the expected project windows.

## Open Questions

None for the profile contract. Visual acceptance remains an execution check rather than a design question.

## Design

### Profile contract

```toml
name = "Knowledge Islands Fundamentals"
tool = "zed"
primary = "techne"

[projects]
techne = "/absolute/path"
tools-ki = "/absolute/path"
```

`primary` identifies the project opened first with `zed -n`. Remaining projects open with `zed -a` in English lexical key order. Profile project keys are names, not an array, so `primary` can refer to one unambiguously.

### Phase boundary

Phase 1 is complete when the CLI loads an applied profile and the resulting Zed windows pass visual acceptance. Phase 2 may add macOS and Finder `.ki-agora` file association for double-click opening; it requires separate design and implementation work.

### Delivered configuration

The initial managed profiles are `ki-fnd.ki-agora`, `ki-mcps.ki-agora`, `personal.ki-agora`, `hnr.ki-agora`, and `legal.ki-agora`. A profile may carry no projects until its intended scope is deliberately populated.

The active CLI has been source-linked and verified for `list` and `show`. Automated tests verify the profile contract, primary-first invocation, stable remaining-project order, and rejection of the retired `cockpit` command.

## Governance

This proposal follows the [[Enactment Process]].
