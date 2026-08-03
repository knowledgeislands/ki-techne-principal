---
type: stream-proposal
title: Techne Principal Conformance Proposal
status: rolled-out
priority: high
dependencies:
  - Techne Knowledge Architecture Proposal.md
---

# Techne Principal Conformance Proposal

## Overview

Conform Techne to the principal Knowledge Base contract and make the required governance surfaces useful expressions of Techne's own authority, relationships, conventions, and change process.

## Inputs

| Type         | Detail                                                                                                            |
| ------------ | ----------------------------------------------------------------------------------------------------------------- |
| Decision     | Techne is the canonical engineering knowledge base for the Knowledge Islands ecosystem.                           |
| Decision     | [[GDR-KI-FUNDAMENTALS-001]] defines the six primary repositories and their distinct authority.                    |
| Prerequisite | [[Techne Knowledge Architecture Proposal]] established the current five-zone structure and is `rolled-out`.       |
| Document     | The `ki-principal` standard requires the principal governance surface and an always-loaded Enactment gate anchor. |

## Outputs

| Type     | Detail                                                                                                        |
| -------- | ------------------------------------------------------------------------------------------------------------- |
| Artefact | A complete, locally meaningful principal surface under `Admin/Governance/` and `Admin/Operations/Processes/`. |
| Artefact | KI configuration and conformance records that declare `ki-decision-records` and `ki-principal`.               |
| Decision | Techne's existing owner, authority boundary, repository relationships, and local conventions remain explicit. |

## Checklist

- [x] Declare `ki-decision-records` as a KB capability and declare `ki-principal` in `.ki-config.toml`.
- [x] Replace the Charter's owner placeholder with the accountable Techne owner.
- [x] Create `Admin/Governance/Known Lands.md` from Techne's established ecosystem authority relationships.
- [x] Create `Admin/Governance/Conventions/Conventions.md` as the local authoring, linking, routing, and governance entry point.
- [x] Move and strengthen the Enactment Process at `Admin/Operations/Processes/Enactment Process.md`.
- [x] Add the Processes index and update Governance, Operations, and configuration links to the canonical paths.
- [x] Record the two newly declared capabilities in `Admin/Governance/Conformance.md`.
- [x] Run principal, decision-record, Streams, KB, and authoring audits and review the local content judgmentally.

## Open Questions

None. The repository already identifies itself as Techne Principal, its authority boundary is established, and the user has directed adoption of `ki-principal` with judgmental conformance.

## Design

### Preserve local authority

The conform will not import Arcadia's identity or legacy metadata. `Known Lands` will interpret the shared six-repository decision from Techne's point of view, while `Conventions` will collect the local rules already distributed across repository guidance and the Knowledge Base structure.

### Make the process entry point operational

The existing Enactment Process has the right policy but is in the pre-principal location. Its canonical replacement will continue to defer the lifecycle definition to `ki-kb-streams` while stating Techne's approver, canonical zones, exceptions, and rollout evidence expectations. The old path will not remain as a duplicate authority.

### Avoid a redundant decision record

No new Decision Record is needed. Techne's principal identity and cross-repository authority already have standing in the Charter, README, and [[GDR-KI-FUNDAMENTALS-001]]; this proposal conforms their operational expression without creating a separate decision.

## Rollout Evidence

On 2026-08-04, targeted audits passed for `ki-principal`, `ki-decision-records`, `ki-kb-streams`, `ki-kb`, and `ki-authoring` after the canonical edits.

The judgmental review found that the principal surface is locally substantive: the Charter names Techne's accountable owner and authority boundary; Known Lands expresses Techne's actual relationship to the five other primary repositories; Conventions records the base's existing language, linking, placement, and governance rules; and the Enactment Process states Techne's approver, protected zones, lifecycle, exceptions, and rollout discipline. None of the new entry points is empty scaffolding or borrowed Arcadia identity.

## Governance

This proposal follows the [[Enactment Process]].
