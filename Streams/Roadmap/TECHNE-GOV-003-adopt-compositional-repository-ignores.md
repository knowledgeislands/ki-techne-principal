---
note_type: stream-proposal
id: TECHNE-GOV-003
area: GOV
title: Adopt compositional repository ignores
aliases:
  - Adopt Compositional Repository Ignores Proposal
theme: knowledge-governance
horizon: next
status: draft
priority: medium
dependencies: []
blocks: []
blocked_by: []
baseline_ref: null
transferred_from: TRD-ed88fe40
---

# Adopt compositional repository ignores

## Goal

Bring Techne's root `.gitignore` under the current compositional `ki-repo` contract while preserving Knowledge Base-specific exclusions and keeping canonical knowledge untouched.

## Context

The current `ki-repo` audit fails FILES-6 because the root `.gitignore` predates marker-bounded managed sections and the terminal unmanaged section. The required outcome was previously carried by `TRD-ed88fe40`, originating from ADR-KI-HARNESS-013; this receiver-owned roadmap record replaces that trade projection.

This is repository-governance work in `Streams/Roadmap/`. It changes no settled knowledge in `Admin/`, `Pillars/`, or `Resources/`.

## Boundary

Do not change canonical engineering knowledge, introduce a second `.gitignore` writer, or discard Knowledge Base-specific exclusions. Remove any retired `.ki/audits/` or `.ki/conform/` rule only after confirming no tracked or irreplaceable local state depends on it.

## Current state

The root `.gitignore` contains macOS, editor, and generated runtime-link rules without Knowledge Islands managed markers or a terminal unmanaged section. `ki repo audit --skill ki-repo --repo .` reports exactly one FILES-6 failure.

## Steps

- [ ] Preview the `ki-repo` conform proposal and classify every existing ignore as shared managed policy or preserved Knowledge Base-specific policy.
- [ ] Apply the composed `.gitignore` with marker-bounded managed sections and one terminal unmanaged section.
- [ ] Confirm no canonical zone content, Streams record other than this item, or runtime source is changed.
- [ ] Re-run the repository, Streams, and authored-Markdown audits.

## Files touched

- `.gitignore`
- `Streams/Roadmap/TECHNE-GOV-003-adopt-compositional-repository-ignores.md`

## Verify

- `ki repo audit --skill ki-repo --repo .`
- `ki repo audit --skill ki-repo-kb-streams --repo .`
- `ki repo audit --skill ki-authoring --repo .`
- Confirm the repository diff contains no canonical-zone change.

## Dependencies / blocks

There are no local blockers. The installed Harness exposes the current composer and the receiver retains independent planning, implementation, review, and acceptance authority.

## Documentation impact

### Decision Records

No Decision Record is required because ADR-KI-HARNESS-013 already owns the shared compositional-ignore contract.

### Specifications

No specification change is required; this is receiver-local repository conformance.

### Guides

No guide change is expected because the work does not alter Techne's knowledge or enactment workflow.

### Roadmap

Retain this record through review. No follow-on item is currently required.

## Discussion

### Canonical-zone boundary

The root `.gitignore` is repository operating state rather than settled engineering knowledge. The roadmap record supplies enactment authority, but the delivered change must remain outside `Admin/`, `Pillars/`, and `Resources/`.

### Cleanup boundary

The durable source reference is `TRD-ed88fe40` and ADR-KI-HARNESS-013. Once this record is committed, the Harness outbound projection is redundant and can be retired without losing the receiver's work or its provenance.
