---
note_type: admin/governance/decision
id: GDR-TECHNE-001
title: 'Adopting Decision Records'
date: 2026-09-09
status: current
decision_type: governance
decision_type_url: https://knowledgeislands.info/specifications/decision-records/gdr
---

# GDR-TECHNE-001: Adopting Decision Records

## Context

Techne maintains canonical engineering principles, architecture, operating models, and technology posture for the Knowledge Islands ecosystem. Significant standalone decisions need a consistent form that preserves their current rationale, consequences, classification, and place in the knowledge base.

The collection also retains deliberately shared decisions such as `GDR-KI-FUNDAMENTALS-001`. A shared foreign-scope record supplies ecosystem context but does not establish Techne's local decision instrument or consume a serial in a Techne-local series.

## Decision

Techne adopts typed, living Decision Records as its canonical instrument for significant standalone decisions. Records live in `Admin/Governance/Decisions/`, use the decision-type prefix and Techne scope, follow the per-prefix serial sequence, and appear in curated reveal order in `Decisions.md`. A record is edited in place when the current decision changes. Deliberately shared records may coexist in the collection when marked as shared, but remain outside Techne's local serial series.

## Consequences

- Significant architecture, governance, knowledge, strategy, product, data, security, operations, and research decisions use the corresponding Decision Record type.
- Forward work and unresolved implementation remain in Streams rather than becoming roadmap prose inside a Decision Record.
- The collection can retain shared ecosystem decisions without treating them as its local adoption root or renumbering them into the Techne series.
- Each new local record must preserve continuous numbering within its own decision-type and scope series and be placed deliberately in the reveal-order index.
