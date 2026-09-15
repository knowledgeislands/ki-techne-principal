---
note_type: stream-proposal
id: TECHNE-GOV-009
area: GOV
title: Complete KB staging conformance
aliases:
  - KB Staging Conformance Proposal
theme: knowledge-governance
horizon: next
status: in-progress
priority: medium
dependencies: []
blocks: [TECHNE-GOV-006]
blocked_by: []
baseline_ref: 5888a26eb931f11ec615a3f7c25789c762114e3a
created_at: 2026-09-15T12:10:51Z
updated_at: 2026-09-15T12:16:00Z
---

# Complete KB staging conformance

## Goal

Restore full Knowledge Base conformance by preserving the completed legacy batch record in its supported retained location and adding the required outbound digest orientation.

## Context

The aggregate audit for TECHNE-GOV-006 exposed two baseline findings. The completed 2026-09-08 batch record remained beneath the retired `+/_AUTHORISATIONS/` path, where the Knowledge Base treated it as an ordinary note lacking `note_type`. The required `-/_DIGESTS/README.md` orientation was also absent.

The historical batch record has been moved into `+/_BATCHES/`, where `ki-batch` owns retained pre-change records. Its approved payload and run evidence remain intact, with a migration note appended after the run ledger. This batch was reissued as TECHNE-BATCH-002 because the historical record already owns TECHNE-BATCH-001.

## Boundary

Preserve the historical authority payload and run evidence. Do not reactivate the expired record, alter its approved fields, remove any digest, change canonical knowledge, or treat staging conformance as permission to clean other working material.

## Current state

The historical record now occupies its supported retained path and the outbound digest orientation is present. The installed `ki` host still rejects the older record because it lacks the later `closure_item_ids` field. Adding an empty field and recomputing the approved hash would preserve operational safety but would alter the historical approval envelope, so that migration is stopped pending explicit authority.

## Steps

- [ ] Validate that the migrated historical batch remains readable as a retained pre-change authorisation and cannot be executed.
- [x] Run the `ki-repo-kb` conform dry run and confirm it proposes only `-/_DIGESTS/README.md`.
- [x] Apply that exact scaffold and inspect its session-digest orientation.
- [x] Run the full Knowledge Base, Streams and authored-Markdown audits.

## Files touched

- `-/_DIGESTS/README.md`
- `Streams/Roadmap/TECHNE-GOV-009-complete-kb-staging-conformance.md`

The historical batch path migration belongs to the enclosing batch preparation repair and is not rewritten during this item's delivery.

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

## Discussion

### Historical integrity

The original batch remains recoverable byte-for-byte from Git history. The current retained copy preserves its approved frontmatter and delivery ledger, and the appended migration note records only its path correction.

### Compatibility blocker

The current host requires retained records to declare `closure_item_ids`, while this earlier envelope predates that field. Normalising the envelope would require a new integrity hash even when the closure set remains empty. Do not represent that new hash as the original approval without explicit owner authority; the record remains retained, expired and unavailable for execution meanwhile.
