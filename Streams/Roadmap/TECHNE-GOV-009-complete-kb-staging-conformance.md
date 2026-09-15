---
note_type: stream-proposal
id: TECHNE-GOV-009
area: GOV
title: Complete KB staging conformance
aliases:
  - KB Staging Conformance Proposal
theme: knowledge-governance
horizon: next
status: done
priority: medium
dependencies: []
blocks: [TECHNE-GOV-006]
blocked_by: []
baseline_ref: 5888a26eb931f11ec615a3f7c25789c762114e3a
created_at: 2026-09-15T12:10:51Z
updated_at: 2026-09-15T13:16:00Z
---

# Complete KB staging conformance

## Goal

Restore full Knowledge Base conformance by preserving the completed legacy batch record in its supported retained location and adding the required outbound digest orientation.

## Context

The aggregate audit for TECHNE-GOV-006 exposed two baseline findings. The completed 2026-09-08 batch record remained beneath the retired `+/_AUTHORISATIONS/` path, where the Knowledge Base treated it as an ordinary note lacking `note_type`. The required `-/_DIGESTS/README.md` orientation was also absent.

The historical batch record has been moved into `+/_BATCHES/`, where `ki-batch` owns retained pre-change records. This batch was reissued as TECHNE-BATCH-002 because the historical record already owns TECHNE-BATCH-001.

## Boundary

Preserve the historical authority and run evidence. Normalise only the structural compatibility field explicitly authorised by the owner, keep its closure set empty, retain the original bytes and hash in Git history, and record the deviation. Do not reactivate the expired record, remove any digest, change canonical knowledge, or treat staging conformance as permission to clean other working material.

## Current state

The historical record now occupies its supported retained path and the outbound digest orientation is present. On 2026-09-15 the owner explicitly authorised the compatibility normalisation: the retained copy declares `closure_item_ids: []` and binds its run ledger to the resulting integrity hash. The original approved bytes and hash remain recoverable from Git history, and the empty set adds no closure authority.

## Steps

- [x] Validate that the migrated historical batch remains readable as a retained pre-change authorisation and cannot be executed.
- [x] Run the `ki-repo-kb` conform dry run and confirm it proposes only `-/_DIGESTS/README.md`.
- [x] Apply that exact scaffold and inspect its session-digest orientation.
- [x] Run the full Knowledge Base, Streams and authored-Markdown audits.

## Files touched

- `-/_DIGESTS/README.md`
- `+/_BATCHES/TECHNE-BATCH-001.md`
- `Streams/Roadmap/TECHNE-GOV-009-complete-kb-staging-conformance.md`

## Verify

- `ki batch validate TECHNE-BATCH-001 --repo .` identifies a retained pre-change authorisation and refuses execution because it is expired and retained.
- `ki repo conform --skill ki-repo-kb --repo . --dry-run` proposes only `-/_DIGESTS/README.md` before application.
- `ki repo audit --skill ki-repo-kb --repo .` passes after application.
- `ki repo audit --skill ki-repo-kb-streams --repo .` passes.
- `ki repo audit --skill ki-authoring --repo .` passes.
- `git diff --check` passes.

## Dependencies / blocks

There are no dependencies. Completion restores the full-KB verification required by TECHNE-GOV-006.

## Delegation

Keep this deterministic migration verification and scaffold application in the coordinator lane because it repairs the enclosing batch's own historical identity collision.

## Documentation impact

### Decision Records

No Decision Record is required because this applies existing `ki-batch` and Knowledge Base placement contracts.

### Specifications

No specification change is required.

### Guides

The generated digest README is the affected orientation guide.

### Roadmap

No follow-on work is expected if the retained record validates and all audits pass.

## Review

### Delivered

Completed Knowledge Base staging conformance from immutable baseline `5888a26eb931f11ec615a3f7c25789c762114e3a`, including the explicitly authorised compatibility normalisation of the retained legacy batch.

### Summary changes

Added the missing outbound digest orientation, retained the legacy batch in `+/_BATCHES/`, declared its empty closure set, rebound its integrity hash, and documented the migration. The original approved bytes and hash remain recoverable from Git history.

### Verification

`ki batch validate TECHNE-BATCH-001 --repo .` recognises the record as retained legacy authority, while `ki batch run TECHNE-BATCH-001 --repo .` refuses to execute it. The full Knowledge Base, Streams and authoring audits and `git diff --check` pass.

### Outstanding concerns

None. The retained copy is not byte-identical to the original approval envelope, but the exact structural deviation has current owner authority, adds no closure authority, and is recoverable and auditable through Git.

### Post-change review

The migration neither reactivated the expired run nor expanded its scope. The digest orientation is generated guidance, and no other staging payload or canonical knowledge changed under this item.

### Mini recap

The staging surfaces now conform to the current host, and the historical batch is both readable and safely non-executable.

## Done

Accepted on 2026-09-15 by Kris Brown through explicit approval of all awaiting-review items, including completion of GOV-009. The review packet and retained-batch, Knowledge Base, Streams and authoring checks provide the acceptance evidence.

## Discussion

### Historical integrity

The original batch remains recoverable byte-for-byte from Git history, including original hash `381e90d881f7fb1b330ad5c2b9bffe1654066340f49eee972dccc040c9b1701d`. The current retained copy deliberately differs by the explicitly authorised empty `closure_item_ids` field, its recomputed integrity hash, the corresponding run binding, and the migration note.

### Compatibility blocker

The current host requires retained records to declare `closure_item_ids`, while this earlier envelope predates that field. The owner authorised normalisation on 2026-09-15. The new hash represents the compatible retained copy rather than the historical approval; Git preserves the original, and the record remains retained, expired and unavailable for execution.
