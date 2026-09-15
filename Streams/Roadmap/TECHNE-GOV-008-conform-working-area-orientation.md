---
note_type: stream-proposal
id: TECHNE-GOV-008
area: GOV
title: Conform working-area orientation
aliases:
  - Working Area Orientation Conformance Proposal
theme: knowledge-governance
horizon: next
status: done
priority: medium
dependencies: []
blocks: [TECHNE-GOV-003]
blocked_by: []
baseline_ref: 5888a26eb931f11ec615a3f7c25789c762114e3a
created_at: 2026-09-15T11:58:28Z
updated_at: 2026-09-15T13:16:00Z
---

# Conform working-area orientation

## Goal

Bring the inbound and outbound working-area README files into line with the current `ki-repo` orientation while leaving the contents and authority of those staging areas unchanged.

## Context

The current `ki-repo` audit reports two WORK-1 failures because `+/README.md` and `-/README.md` differ from the canonical working-area orientation. A conform dry run proposes exactly those two writes and no other repository change.

The drift is independent of the compositional-ignore work in [[TECHNE-GOV-003-adopt-compositional-repository-ignores]], but it prevents that item's full repository audit from passing.

## Boundary

Change only the two working-area orientation files and this roadmap record. Do not delete, move, accept, submit or reinterpret any staged material; change trade or Agora declarations; or alter canonical knowledge.

## Current state

`ki repo audit --skill ki-repo --repo .` passes its authoring and Git dependencies but reports only the two working-area README findings. `ki repo conform --skill ki-repo --repo . --dry-run` proposes only `+/README.md` and `-/README.md`.

## Steps

- [x] Re-run the conform dry run and confirm its exact two-file proposal.
- [x] Apply the current `ki-repo` conform operation.
- [x] Inspect both resulting files and confirm they remain orientation documents rather than staging-area content.
- [x] Run the repository, Streams and authored-Markdown audits.

## Files touched

- `+/README.md`
- `-/README.md`
- `Streams/Roadmap/TECHNE-GOV-008-conform-working-area-orientation.md`

## Verify

- `ki repo conform --skill ki-repo --repo . --dry-run` proposes only the expected files before application.
- `ki repo audit --skill ki-repo --repo .` passes after application.
- `ki repo audit --skill ki-repo-kb-streams --repo .` passes.
- `ki repo audit --skill ki-authoring --repo .` passes.
- `git diff --check` passes and the diff contains no staging payload or canonical-zone change.

## Dependencies / blocks

There are no dependencies. Completion unblocks the full repository verification required by TECHNE-GOV-003.

## Delegation

This is a narrow deterministic conformance change. It can share one worker lane with TECHNE-GOV-003, provided the coordinator owns lifecycle records, integration and verification.

## Documentation impact

### Decision Records

No Decision Record is required because this applies the existing repository contract.

### Specifications

No specification changes are required.

### Guides

The generated README files are the affected orientation guidance; no additional guide is required.

### Roadmap

No follow-on work is expected if the audits pass.

## Review

### Delivered

Conformed the two working-area orientation files from immutable baseline `5888a26eb931f11ec615a3f7c25789c762114e3a` without changing staging payloads or canonical knowledge.

### Summary changes

Updated `+/README.md` and `-/README.md` to the current `ki-repo` descriptions of temporary inputs and produced outputs. No other delivery file belongs to this item.

### Verification

The pre-application dry run proposed exactly the two authorised README files. `ki repo audit --skill ki-repo --repo .`, the Streams audit, the authoring audit, and `git diff --check` all pass after application.

### Outstanding concerns

None. The conformance operation also invoked its authoring dependency while other disjoint batch work was present; coordinator review confirmed that only harmless formatting affected those owned files and their intended semantics remain intact.

### Post-change review

Both files remain orientation documents. No staging content, canonical knowledge, trade state, Agora declaration, or external system changed. The item is ready for acceptance.

### Mini recap

The inbound and outbound working areas now use the current repository orientation, removing the two WORK-1 findings and unblocking GOV-003 verification.

## Done

Accepted on 2026-09-15 by Kris Brown through explicit approval of all awaiting-review items. The review packet and current repository audits provide the acceptance evidence.

## Discussion

### Staging-area boundary

The `+` and `-` areas remain staging surfaces. Conforming their README files changes only their orientation text and grants no authority over material placed beneath them.
