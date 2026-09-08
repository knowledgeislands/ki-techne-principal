---
note_type: stream-proposal
id: TECHNE-GOV-004
area: GOV
title: Decision-records audit follow-up
aliases:
  - Decision-Records Audit Follow-up Proposal
theme: knowledge-governance
priority: high
horizon: now
status: done
dependencies: []
blocks: [TECHNE-GOV-005]
blocked_by: []
baseline_ref: a10df6374174dbf589330eefa8e5bd526bda7b44
---

# Decision-Records Audit Follow-up

## Goal

Establish a conformant Techne-local Decision Records collection root so architectural decisions can be recorded without changing the shared ecosystem-fundamentals record.

## Context

The collection currently contains only `GDR-KI-FUNDAMENTALS-001`, a deliberately shared ecosystem decision whose foreign scope does not establish Techne's local decision series. The `ki-decision-records` audit therefore fails because the collection does not begin with a local record adopting the Decision Records instrument.

`TECHNE-GOV-005` requires a new Techne architecture decision before its model can be enacted. That work should build on a conformant local collection rather than retitle or fork the shared fundamentals decision.

## Boundary

Do not modify `GDR-KI-FUNDAMENTALS-001`, change its shared-record status, rewrite the Decision Records standard, create the isolated-agent architecture decision in this item, or alter unrelated governance knowledge.

## Current state

`ki repo audit --skill ki-decision-records --repo .` reports exactly one failure: the collection root does not adopt Decision Records. No `GDR-TECHNE-*` record exists, so `001` is the next local governance serial.

## Steps

- [x] Create `GDR-TECHNE-001-adopting-decision-records.md` as the local governance root using the universal Decision Record structure.
- [x] State the decision to use typed, living Decision Records in the canonical KB collection while retaining deliberately shared foreign records in the same reveal-order index.
- [x] Add the local adoption record to `Decisions.md` before the shared ecosystem-fundamentals record.
- [x] Run the Decision Records, authoring, work, and KB Streams audits.

## Files touched

- `Admin/Governance/Decisions/GDR-TECHNE-001-adopting-decision-records.md`
- `Admin/Governance/Decisions/Decisions.md`
- This Stream record

## Verify

- The local record ID, filename, title, metadata, sections, and index entry satisfy the Decision Records standard.
- `GDR-KI-FUNDAMENTALS-001` remains byte-for-byte unchanged.
- The collection presents the local instrument decision before dependent Techne decisions while retaining the shared record.
- `ki repo audit --skill ki-decision-records --repo .` passes.
- `ki repo audit --skill ki-authoring --repo .` passes.
- `ki repo audit --skill ki-work --repo .` and `ki repo audit --skill ki-repo-kb-streams --repo .` pass.

## Dependencies / blocks

No external dependency blocks this repair. It blocks `TECHNE-GOV-005` because that item needs a conformant collection for `ADR-KI-TECHNE-001`.

## Delegation

No delegation is useful for this three-file, tightly coupled governance repair.

## Review

### Delivered

Implemented the approved three-file repair from immutable baseline `a10df6374174dbf589330eefa8e5bd526bda7b44`. Commit `451d4f43ce7835470e7ae2d176d9bbca4cfd0283` creates Techne's local adoption record, places it first in the reveal-order index, and advances this Stream without modifying the shared ecosystem-fundamentals record.

### Summary of changes

Added `GDR-TECHNE-001: Adopting Decision Records` with the universal metadata and Nygard sections. Updated `Decisions.md` to list the local adoption root before `GDR-KI-FUNDAMENTALS-001`. Preserved the planned boundary: no isolated-agent ADR, shared-record edit, standard change, or unrelated governance change was included.

### Verification

`ki repo audit --skill ki-decision-records --repo .`, `ki repo audit --skill ki-authoring --repo .`, `ki repo audit --skill ki-work --repo .`, and `ki repo audit --skill ki-repo-kb-streams --repo .` all pass. The shared record's SHA-256 remains `357e5584b7785db3fd065dc92e2829e5d9aff2641632ca69e41cc614dd6dc11f`, matching the baseline observation.

### Outstanding concerns

None within the approved repair. `TECHNE-GOV-005` remains blocked until this record receives human acceptance.

### Post-change review

The collection now has an explicit Techne-local instrument decision without changing the cross-repository shared record. The result satisfies the stated goal and removes the only Decision Records audit failure. The change is narrow, reversible through Git, and ready for acceptance.

### Mini recap

Techne's Decision Records collection is conformant, its shared fundamentals decision is unchanged, and the isolated-agent architecture work can proceed after acceptance of this review packet.

## Done

Accepted 2026-09-09 by Kris Brown on the review packet above.

## Discussion

The local adoption root and the shared ecosystem-fundamentals record serve different scopes. Keeping both avoids mutating a byte-identical shared decision merely to satisfy Techne's local collection contract.
