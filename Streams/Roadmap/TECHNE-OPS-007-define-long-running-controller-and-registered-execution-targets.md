---
note_type: stream-proposal
id: TECHNE-OPS-007
area: OPS
title: Define long-running controller and registered execution targets
aliases:
  - Persistent Controller and Target Registry Proposal
theme: operational-tooling
horizon: triage
status: draft
priority: high
dependencies: []
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-16T21:59:23Z
updated_at: 2026-09-16T21:59:23Z
---

# Define Long-running Controller and Registered Execution Targets

## Goal

Define and prove one long-running personal controller that connects outbound to Telegram, retains controller identity and policy, registers multiple execution clusters, and dispatches bounded work to ephemeral Kubernetes Jobs without making worker nodes or chat transport authoritative.

## Context

[[AI Execution Fabric]], [[Engineering Estate]] and [[Techne Fabric Execution Contract]] already distinguish the persistent controller from execution targets and disposable task environments. The implementation repository, controller runtime, state model, fencing mechanism and target-registration contract remain deliberately unassigned.

The intended topology now has two different lifetimes. The controller is a long-running service that receives operator intent and supervises work. Registered clusters may already exist or may be provisioned temporarily; Kubernetes Jobs and their worker capacity remain ephemeral. Telegram provides an outbound control and notification surface through Bot API long polling, not the authority or durable record of work.

This outcome is distinct from `TECHNE-OPS-002`, which concerns persistent human-supervised remote development sessions. It is also outside [[TECHNE-OPS-003-pioneer-aws-agent-execution|TECHNE-OPS-003]], whose local orchestration proves one disposable K3s target without implementing the controller.

## Boundary

Define controller identity, single-active-instance fencing, durable minimal state, outbound Telegram interaction, target registration, capability and health observation, dispatch, credential brokerage, evidence return, recovery and cluster deregistration.

Treat the controller as a long-running service or process, not a Kubernetes Job. Treat Telegram messages as requests and observations subject to authenticated policy checks, replay protection and reconciliation; do not make chat history the queue, audit log or source of truth. Prefer Bot API long polling for the initial outbound-only transport and expose no public webhook listener.

Do not select a controller product, repository, programming language, database, hosting provider or cluster technology in this Triage record. Do not create a Telegram bot, credential, public endpoint or live infrastructure. Do not require registered clusters to be provisioned by the controller: registration and capacity lifecycle are independent capabilities.

## Current state

The architecture assigns controller responsibilities but no current repository owns an implementation. There is no executable controller, target registry, Telegram integration, fencing mechanism or accepted persistent-state model.

`TECHNE-OPS-003` is the first planned disposable target proof. It can provide evidence about target descriptors, dispatch, result return and teardown, but its shell orchestration must not become the controller by accident.

## Steps

- [ ] Define the long-running controller lifecycle, identity, single-active-instance fencing, restart and recovery behaviour.
- [ ] Define a registered-target record covering identity, capability profile, connection adapter, lifecycle owner, health, trust boundary, cost or expiry policy and deregistration.
- [ ] Define outbound Telegram long polling, operator authentication, command acknowledgement, replay protection, notification and recovery semantics without treating Telegram as durable authority.
- [ ] Define dispatch from controller to a registered target, per-execution credential delivery, observation, cancellation, evidence return and reconciliation.
- [ ] Distinguish persistent pre-registered clusters from provider adapters that can create and destroy capacity; require neither capability to impersonate the other.
- [ ] Select the implementation repository, runtime, controller host and smallest durable state store only after the contracts and recovery needs are understood.
- [ ] Prove one controller instance can dispatch the same bounded footprint to the disposable K3s target and one independently registered target, then survive its own restart without duplicating work or losing reconciliation state.
- [ ] Route normative schemas, reusable capabilities and provider-specific adapters to their owning repositories as separately accepted work.

## Files touched

- This Stream record while the proposal remains in Triage
- Canonical Techne architecture or operating-model notes only through a separately approved Ready plan
- A separately selected controller implementation repository after adoption and ownership review
- Receiver-owned specification, Harness or provider-adapter records only through explicit trades

## Verify

- The controller and execution-target lifetimes are independently modelled.
- Exactly one controller instance may act for the persona after restart, failover or network partition.
- Telegram long polling requires outbound connectivity only, and Telegram loss or replay cannot create authority or duplicate consequential work.
- A target can be registered without granting a workload cluster-admin or provider-administrator credentials.
- Existing and ephemeral clusters use the same registration boundary while retaining different lifecycle owners.
- Controller restart preserves execution identity, dispatch state, evidence reconciliation and cancellation decisions.
- Git and the selected change-management process remain authoritative for governed work and review.

## Dependencies / blocks

No local roadmap item is a hard dependency for architectural exploration. Adoption should wait until `TECHNE-OPS-003` supplies evidence about the smallest target descriptor and evidence return, and until the intended controller host, implementation owner, Telegram bot identity and credential boundary can be named.

## Delegation

Keep controller authority, fencing, durable state and repository ownership decisions in one coordinator lane. Transport research, target-descriptor fixtures and failure-case modelling may later be separated after adoption.

## Documentation impact

### Decision Records

A controller implementation commitment, durable-state authority or fencing choice may require a new Decision Record because no existing record selects those mechanisms.

### Specifications

Accepted controller-to-target, target-registration and evidence-reconciliation schemas belong in `ki-specifications` after implementation evidence makes them stable enough to standardise.

### Guides

An operator guide will be required for controller recovery, credential rotation, target registration, Telegram disconnection and emergency fencing before live use.

### Roadmap

This record is unadopted Triage. It may move to Soon or Next only with explicit approval after `TECHNE-OPS-003` evidence clarifies the minimum implementation boundary.

## Discussion

### Intended topology

The controller maintains outbound contact with Telegram and invokes registered execution targets through replaceable adapters. A cluster supplies capacity; a Kubernetes Job performs one bounded execution; returned evidence crosses back to the controller and governed repository workflow. Neither Telegram nor the cluster becomes the durable authority for the work.

### Cluster registration

Registration should describe a target the controller may select, not assert that the controller created or owns it. A persistent home cluster, a manually managed remote cluster and an on-demand K3s instance may all register through the same conceptual boundary while exposing different lifecycle capabilities.

### Telegram boundary

Telegram Bot API `getUpdates` supports long polling and is mutually exclusive with a webhook. Long polling fits the outbound-only first boundary, but update offsets, authenticated operator identity, duplicate delivery and unavailable transport all need deliberate recovery behaviour.

### Primary source entry points

- [Telegram Bot API](https://core.telegram.org/bots/api)
- [[Techne Fabric Execution Contract]]
- [[AI Execution Fabric]]
- [[Engineering Estate]]
