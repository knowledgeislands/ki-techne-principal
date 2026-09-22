---
note_type: stream-proposal
id: TECHNE-GOV-013
area: GOV
title: Align Techne implementation ownership
aliases:
  - Techne Implementation Ownership Alignment
theme: governance
horizon: now
status: done
priority: high
dependencies: []
blocks: []
blocked_by: []
baseline_ref: 498fbe6e7e2b4b46ad93e158057df52435264fc4
created_at: 2026-09-21T23:58:46Z
updated_at: 2026-09-22T01:08:30Z
---

# Align Techne Implementation Ownership

## Goal

Update Techne's canonical implementation-ownership decision to recognise the accepted independent `tools-techne` operator interface while retaining controller and execution-fabric implementation ownership in Techne Harness.

## Context

Techne Harness accepted `TECHNE-TOOLS-OPS-006` in commit `413b858`, completing the release-independent extraction of the `techne` CLI into `knowledgeislands/tools-techne`. `ADR-TECHNE-003` still assigns operator implementations and release concerns to one harness monorepo, so canonical architecture now trails accepted implementation evidence.

## Boundary

Clarify existing implementation ownership only. Do not redefine Techne's architecture, change runtime behaviour, alter either implementation repository, publish a release, or grant one repository authority over another.

## Current state

`ADR-TECHNE-003` assigns personal-controller and execution-fabric-operator implementations collectively to `ki-techne-harness` and treats a later repository split as hypothetical. The accepted split is now concrete: `tools-techne` owns the operator CLI and its release lifecycle, while Techne Harness owns deployable applications, runtime payloads, deployment resources and provider operations.

## Steps

- [x] Revise `ADR-TECHNE-003` to name the two independently governed implementation owners and their boundaries.
- [x] Preserve Techne Principal's authority over engineering meaning, roles, invariants and decision criteria.
- [x] State the integration boundary: the CLI consumes explicit harness interfaces or selected immutable artefacts without assuming co-located source or coupled releases.
- [x] Update the decision index and canonical execution-contract reference to the revised decision title.

## Files touched

- `Admin/Governance/Decisions/ADR-TECHNE-003-techne-harness-implementation-ownership.md`
- `Admin/Governance/Decisions/ADR-TECHNE-003-techne-implementation-ownership.md`
- `Admin/Governance/Decisions/Decisions.md`
- `Pillars/Engineering Practice/Architecture/Techne Fabric Execution Contract.md`
- `Streams/Roadmap/TECHNE-GOV-013-align-techne-implementation-ownership.md`
- `Streams/Roadmap/_ISSUES.md`

## Verify

- The decision distinguishes CLI ownership from harness runtime ownership and preserves Principal authority.
- No text claims the repositories share one release lifecycle or source tree.
- Every changed wikilink resolves uniquely.
- `ki repo audit --skill ki-authoring --repo .`, `ki repo audit --skill ki-repo-kb-streams --repo .`, `ki repo audit --skill ki-repo-kb --repo .`, `ki repo audit --skill ki-work --repo .` and `git diff --check` pass.

## Dependencies / blocks

The accepted Techne Harness `TECHNE-TOOLS-OPS-006` extraction supplies the required implementation evidence. No external decision blocks this clarification.

## Delegation

Keep the decision, index and architecture-reference edits in one lane so terminology and authority boundaries remain coherent. No delegation is needed.

## Documentation impact

### Decision Records

Amend `ADR-TECHNE-003` in place because the implementation split exercises its explicit later-separation clause rather than reversing its architectural authority model.

### Specifications

No portable specification changes. The repositories retain their own executable contracts.

### Canonical architecture

Update only the direct reference to the ownership decision; no broader architecture rewrite is required.

### Roadmap

This proposal records enactment and review evidence for the canonical decision update. It creates no implementation work.

## Review

### Delivered

Updated Techne's implementation-ownership decision from immutable baseline `498fbe6e7e2b4b46ad93e158057df52435264fc4` to recognise the accepted independent CLI and harness product boundaries.

### Summary of changes

- Renamed `ADR-TECHNE-003` from harness-only ownership to Techne implementation ownership.
- Assigned controller applications, runtime payloads and deployment operations to Techne Harness.
- Assigned operator commands, diagnostics, installation and releases to `tools-techne`.
- Defined an explicit artefact and command integration boundary with independent versioning.
- Updated the decision index and execution-contract reference.

### Verification

- Confirmed the decision preserves Techne Principal's architectural authority and grants no cross-repository write authority.
- Confirmed no changed text claims a shared source tree or coupled release lifecycle.
- Verified every changed wikilink resolves uniquely.
- Repository governance and authoring audits passed as recorded after implementation.

### Outstanding concerns

No concern blocks review. First public CLI publication and Homebrew packaging remain separately governed work in their owning repositories.

### Post-change review

The amended decision now matches accepted implementation evidence without expanding either repository's authority or changing runtime behaviour. The change is ready for owner acceptance.

### Mini recap

Techne now has one canonical implementation map: `tools-techne` owns the independently released operator interface, Techne Harness owns deployable controller and execution-fabric runtime implementation, and Techne Principal retains architecture authority.

## Done

Accepted 22 September 2026 by Kris Brown on the review packet above.

## Discussion

### Approval

Kris Brown explicitly requested progression of the Principal ownership update on 21 September 2026 after accepting the standalone CLI extraction action set.
