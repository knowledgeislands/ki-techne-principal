---
note_type: stream-proposal
id: TECHNE-GOV-003
area: GOV
title: Adopt compositional repository ignores
aliases:
  - Adopt Compositional Repository Ignores Proposal
theme: knowledge-governance
horizon: next
status: done
priority: medium
dependencies: [TECHNE-GOV-008]
blocks: []
blocked_by: []
baseline_ref: 5888a26eb931f11ec615a3f7c25789c762114e3a
created_at: 2026-08-29T05:03:00Z
updated_at: 2026-09-15T13:16:00Z
transferred_from: TRD-ed88fe40
---

# Adopt compositional repository ignores

## Goal

Confirm and close Techne's adoption of the compositional `ki-repo` ignore contract while preserving Knowledge Base-specific exclusions and keeping canonical knowledge untouched.

## Context

The required outcome was previously carried by `TRD-ed88fe40`, originating from ADR-KI-HARNESS-013; this receiver-owned roadmap record replaces that trade projection.

Commit `7361962` introduced the marker-bounded managed ignore section. The implementation predates this record's lifecycle evidence, so the remaining work is to verify the current composer output and record an accountable review without manufacturing a new `.gitignore` change.

This is repository-governance work in `Streams/Roadmap/`. It changes no settled knowledge in `Admin/`, `Pillars/`, or `Resources/`.

## Boundary

Do not change canonical engineering knowledge, introduce a second `.gitignore` writer, rewrite a conforming `.gitignore`, or absorb unrelated repository-conformance findings. Do not remove local state merely because a path was historically ignored.

## Current state

The root `.gitignore` contains one valid marker-bounded `ki-repo` section and a terminal unmanaged section. The current composer reports the file as conforming, with no malformed markers or unmanaged rules, and a dry-run conform proposes no `.gitignore` change. No `.ki/` directory or tracked legacy audit or conform state exists.

The full `ki-repo` audit currently reports separate working-area README drift. [[TECHNE-GOV-008-conform-working-area-orientation]] owns that repair so this item can retain its ignore-specific boundary.

## Steps

- [x] Verify commit `7361962` contains the adopted ignore composition and that the current `.gitignore` has not drifted from it.
- [x] Run the current ignore composer and confirm it reports one conforming managed section, no malformed markers and no unmanaged rules.
- [x] Confirm a `ki-repo` conform dry run proposes no `.gitignore` change and that no tracked or irreplaceable `.ki/` state depends on retired ignore rules.
- [x] After TECHNE-GOV-008, run the repository, Streams and authored-Markdown audits.
- [x] Record the existing implementation and current verification in the review packet without changing `.gitignore`.

## Files touched

- `Streams/Roadmap/TECHNE-GOV-003-adopt-compositional-repository-ignores.md`

## Verify

- The current composer reports `conforming: true`, no malformed markers and no unmanaged rules.
- `git diff 7361962 -- .gitignore` is empty.
- `ki repo conform --skill ki-repo --repo . --dry-run` proposes no `.gitignore` write.
- `ki repo audit --skill ki-repo --repo .` passes after TECHNE-GOV-008.
- `ki repo audit --skill ki-repo-kb-streams --repo .` passes.
- `ki repo audit --skill ki-authoring --repo .` passes.
- The repository diff contains no canonical-zone change attributable to this item.

## Dependencies / blocks

TECHNE-GOV-008 must repair the unrelated working-area README drift before the full repository audit can verify this item. No external dependency remains.

## Delegation

Keep the evidence reconciliation and lifecycle update in the coordinator lane because the implementation is already present and the only intended write is this record.

## Documentation impact

### Decision Records

No Decision Record is required because ADR-KI-HARNESS-013 already owns the shared compositional-ignore contract.

### Specifications

No specification change is required; this is receiver-local repository conformance.

### Guides

No guide change is expected because the work does not alter Techne's knowledge or enactment workflow.

### Roadmap

Retain this record through review. No follow-on item is currently required.

## Review

### Delivered

Reconciled the already-delivered compositional ignore implementation against immutable batch baseline `5888a26eb931f11ec615a3f7c25789c762114e3a`. Commit `7361962` remains the implementation evidence; this delivery records current verification without manufacturing a new `.gitignore` diff.

### Summary changes

Updated only this roadmap record. The root `.gitignore` was not changed because it already matches the current composer and contains no retained Knowledge Base-specific rule requiring migration.

### Verification

`git diff 7361962 -- .gitignore` is empty. The current composer reports one conforming managed section, no malformed markers, and no unmanaged rules. The conform dry run proposes no `.gitignore` write, `.ki/` is absent, and the repository, Streams and authoring audits pass after GOV-008.

### Outstanding concerns

None. The separate working-area README drift was repaired by GOV-008 rather than absorbed into this item's boundary.

### Post-change review

The compositional ignore contract is present, current, and verified. Canonical knowledge and local state were untouched, and the item is ready for acceptance.

### Mini recap

Techne's `.gitignore` adoption is now supported by current evidence and an honest lifecycle record; no new ignore change was necessary.

## Done

Accepted on 2026-09-15 by Kris Brown through explicit approval of all awaiting-review items. The review packet and current repository audits provide the acceptance evidence.

## Discussion

### Canonical-zone boundary

The root `.gitignore` is repository operating state rather than settled engineering knowledge. The roadmap record supplies enactment authority, but the delivered change remains outside `Admin/`, `Pillars/` and `Resources/`.

### Cleanup boundary

The durable source reference is `TRD-ed88fe40` and ADR-KI-HARNESS-013. The Harness outbound projection can be retired through its owning process without losing the receiver's work or provenance.
