---
note_type: stream-proposal
id: TECHNE-OPS-006
area: OPS
title: Evaluate Fly.io substrate
aliases:
  - Fly.io Agent Substrate Proposal
theme: operational-tooling
horizon: triage
status: done
intake_disposition: rejected
priority: medium
dependencies: []
blocks: []
blocked_by: []
baseline_ref: null
transferred_from: KI-HARNESS-RTP-010
created_at: 2026-09-16T11:12:27Z
updated_at: 2026-09-20T10:32:57Z
---

# Evaluate Fly.io Agent Substrate

## Goal

Decide whether Fly.io warrants a bounded proof as a remote agent execution substrate within Techne's provider-neutral execution model.

## Context

This intake transfers the Fly.io signal from `KI-HARNESS-RTP-010`, where no Harness-owned delivery remains. Techne owns the engineering model, technology investigations, provider comparisons, and operational proofs; the Harness owns only reusable portable agent capability contracts that later evidence may justify.

The accepted architecture separates portable agent footprints and durable Git-backed evidence from replaceable execution providers. `TECHNE-OPS-003` pioneers that boundary through Kubernetes on AWS and a second conforming Kubernetes target. Fly.io is materially different because its Machines platform may offer a smaller managed footprint but does not automatically satisfy the Kubernetes portability boundary, so it needs its own comparison rather than being silently treated as the second target.

## Boundary

Do not recommend Fly.io, create an account, provision infrastructure, incur spend, handle live credentials, or change the provider-neutral architecture from this intake. Do not duplicate the generic investigation method or absorb the AWS/Kubernetes pioneer. Any future proof must name one workload and make isolation, recovery, credential, egress, lifecycle, evidence, cost, cleanup, and exit criteria explicit.

## Intake disposition

**Outcome:** Rejected.

**Rationale:** The retained K3s controller and its registered local execution target satisfy the current substrate need. No named workload demonstrates a gap that Fly.io would resolve, so retaining a provider comparison would encourage infrastructure selection before product need.

**Approval:** Kris Brown explicitly instructed Techne to drop the Fly.io substrate for now on 20 September 2026. No retained target applies. A future workload may generate a new intake if it exposes a concrete capability gap in the chosen approach.

## Done

Closed as rejected Triage intake on 20 September 2026 without adoption, implementation, Fly.io account creation, infrastructure provisioning or spend.

## Discussion

### Investigation route

First compare Fly.io's supported execution and lifecycle model with the capabilities required by the Techne Fabric: portable workload inputs, bounded authority, recoverable state, observable execution, explicit credential and network boundaries, durable result evidence, teardown, cost, and provider exit. Only adopt a proof if that comparison identifies a concrete advantage or unanswered risk that cannot be resolved from current primary evidence.

### Relationship to existing work

Keep `TECHNE-OPS-003` focused on portable Kubernetes execution and its second-cluster portability claim. A Fly.io proof may compare against that evidence, but it should not weaken the established separation between a portable footprint and a provider adapter. Route only a demonstrated reusable hand-off or capability consequence back to a separately adopted Harness record.

### Promotion condition

Adopt this item only after naming the exact agent workload, the decision the proof would inform, a cost ceiling, data and credential boundaries, pass and fail criteria, cleanup evidence, and the repository that would own any implementation.
