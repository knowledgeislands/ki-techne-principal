---
type: stream-proposal
id: TECHNE-GOV-002
area: GOV
title: Conform Streams
theme: knowledge-governance
horizon: now
status: awaiting-review
priority: high
dependencies: []
blocks: []
blocked-by: []
baseline-ref: 5d641ec598094af1ba1a2576f86e499607b8d94f
---

# Conform Streams

## Goal

Conform Techne's Streams zone to the current operational-area model, replacing legacy Focus navigation with flat roadmap work and a recurring-work template area.

## Context

The owner requested an explicit, owner-reviewed migration. The legacy `Now` folder contained two finite work records and a Focus index; neither record is recurring work or settled canonical knowledge. The architectural output is already canonical in [[Engineering Practice]].

## Boundary

This change does not accept or prune either retained roadmap item, create a Housekeeping template, alter the settled architecture, or adopt a future Trades area.

## Current state

The legacy `Streams/Now/` model has been replaced. Fixed local issuance now uses the `TECHNE` repository code with `GOV` and `OPS` area codes, and this record supplies the required review packet.

## Steps

- [x] Review and record the disposition of every legacy Streams record with the owner-authorised migration scope.
- [x] Configure the local repository code and fixed `GOV` and `OPS` issuing areas.
- [x] Create the Roadmap and Housekeeping operational areas and establish their issue-allocation ledger.
- [x] Transfer the two finite legacy records into flat roadmap records with newly allocated identities.
- [x] Remove the legacy Focus navigation and update the Streams zone orientation.
- [x] Update the Enactment Process and pillar navigation for the current lifecycle and roadmap model.
- [x] Verify the target structure, record identities, links, and authored Markdown.

## Files touched

- `.ki-config.toml`
- `Streams/`
- `Admin/Operations/Processes/Enactment Process.md`
- `Pillars/Engineering Practice/Engineering Practice.md`

## Verify

- `Streams/` has only the Roadmap and Housekeeping operational directories, apart from its zone note.
- Every retained roadmap record has a unique configured identifier, current lifecycle metadata, and a ledger high-water mark.
- No legacy Focus, Active, Background, or Dormant directory remains.
- Internal links to the architectural migration resolve to its retained roadmap record.

## Dependencies / blocks

The user's migration instruction authorises the structural work. Owner acceptance of this review packet remains the only outstanding lifecycle step.

## Review

### Delivered

Techne now uses `Streams/Roadmap/` for flat finite work and `Streams/Housekeeping/` for recurring templates.

### Summary of changes

The two legacy proposals became `TECHNE-GOV-001` and `TECHNE-OPS-001`; the Focus index was pruned; configuration and the allocation ledger establish `GOV` and `OPS` namespaces; and process navigation now uses the current lifecycle.

### Verification

The migration checks the target directory shape, record metadata, issue-ledger high-water marks, legacy-path absence, and Markdown link references. The installed native Streams audit could not run because its harness rubric registration fails before repository inspection.

### Outstanding concerns

This item awaits the owner's review and explicit acceptance. No native audit result is available until the external harness rubric-family error is resolved.

### Post-change review

Confirm that the retained records remain the intended finite work and that no recurring or canonical knowledge was incorrectly left in Streams.

### Mini recap

Streams is now an operational container, not a second Focus-based queue.

## Discussion

### Owner-reviewed disposition

The owner explicitly requested this migration and delegated local classification, area-code, identity, and high-water-mark selection. The retained legacy records are finite roadmap work: `TECHNE-GOV-001` preserves the architecture-migration review evidence and `TECHNE-OPS-001` retains the remaining Agora visual acceptance. `Streams/Now/Now.md` was navigation only and is pruned.

### Local allocation

`GOV` issues knowledge-governance work and `OPS` issues operational-tooling work. The ledger reserves `GOV` through `002` and `OPS` through `001`; these are new local allocations, not derivations from the former Focus path.
