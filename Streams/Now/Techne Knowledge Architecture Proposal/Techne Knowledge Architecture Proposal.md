---
type: stream-proposal
title: Techne Knowledge Architecture Proposal
status: awaiting-review
priority: high
dependencies: []
---

# Techne Knowledge Architecture Proposal

## Overview

Migrate Techne's pre-Knowledge-Islands handbook structure into the canonical base zones so the repository root contains only the base structure and its orientation. The settled internal engineering discipline will live in one Engineering Practice pillar; active foundation work will live in Streams; external source material will enter Resources only when it exists independently of Techne.

## Inputs

- **Document:** Existing `Architecture/`, `Operating-Model/`, `Technology-Radar/`, `Diagrams/`, `Roadmap/`, and `SUMMARY.md` material.
- **Decision:** Approved direction: the root folders are limited to `+/`, `-/`, `Admin/`, `Calendar/`, `Pillars/`, `Resources/`, and `Streams/`.
- **Decision:** The Engineering Practice pillar is the canonical destination for Techne's settled internal handbook.

## Outputs

- **Artefact:** `Pillars/Engineering Practice/` with modular foundations, architecture, operating-model, technology-posture, and diagram material.
- **Artefact:** Now Streams record that preserves the Phase 1 context as work in motion.
- **Artefact:** The local Enactment Process and an explicit Streams process binding. | Artefact | Root orientation, memory, and links that identify the Engineering Practice pillar as Techne's canonical knowledge. |

## Checklist

- [x] Create the Engineering Practice pillar, its memory anchor, and concise navigation notes.
- [x] Move the foundations, architecture, operating-model, technology-radar, and diagram artefacts into the pillar without changing their substantive claims.
- [x] Preserve the Phase 1 roadmap context in this active proposal, then remove the legacy `Roadmap/` folder.
- [x] Add the local Enactment Process note and declare its Streams binding.
- [x] Update internal links to shortest-unique wikilinks and update root orientation and memory guidance.
- [x] Remove the superseded top-level handbook folders and summary after their content has canonical destinations.
- [x] Verify the Knowledge Base structure, Streams structure, authoring conformance, and moved-link integrity.

## Open Questions

None. The approved direction is to establish one Engineering Practice pillar now; future pillars require a separate decision when Techne develops a distinct major knowledge domain.

## Design

### Canonical destinations

- **`Architecture/`:** `Pillars/Engineering Practice/Foundations/` and `Pillars/Engineering Practice/Architecture/`.
- **`Operating-Model/`:** `Pillars/Engineering Practice/Operating Model/`.
- **`Technology-Radar/`:** `Pillars/Engineering Practice/Technology/`.
- **`Diagrams/`:** `Pillars/Engineering Practice/Architecture/Diagrams/`.
- **`Roadmap/Phase-1.md`:** This proposal's transferred Phase 1 context. | `SUMMARY.md` | `Pillars/Engineering Practice/Foundations/Techne v0.1 Foundations.md` |

### Diagram policy

Each generated SVG moves with its editable Mermaid source into the Architecture diagrams area. The diagrams index will identify both files and the architectural note that explains the diagram.

### Phase 1 continuity

The legacy Phase 1 roadmap is work in motion, not settled knowledge. Its intent transfers into this proposal: bootstrap Techne, establish its architecture, model the tools-mgit estate, and integrate Zed and Herdr. Any continuing work after this migration receives its own active stream or proposal rather than recreating a top-level roadmap directory.

## Governance

This proposal follows the [[Enactment Process]].
