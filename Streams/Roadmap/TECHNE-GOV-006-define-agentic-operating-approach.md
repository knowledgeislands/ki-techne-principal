---
note_type: stream-proposal
id: TECHNE-GOV-006
area: GOV
title: Define agentic operating approach
aliases:
  - Techne Agentic Operating Approach
theme: knowledge-governance
horizon: triage
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-14T02:17:23Z
updated_at: 2026-09-14T02:17:23Z
---

# Define Agentic Operating Approach

## Goal

Give readers one clear introduction to Techne's overall approach to agentic work, with a stable vocabulary connecting personal controllers, working contexts, Knowledge Islands and portable execution. Make it possible to understand the purpose and role boundaries before choosing any particular agent product or infrastructure.

## Context

The owner endorsed the one-persona, multiple-contexts direction and requested its capture as Techne's overall approach on 2026-09-14. The introduction and definitions below preserve that agreed conceptual direction. This record is architectural intake, not an approved implementation plan or evidence of a deployed system; canonical enactment remains a separate lifecycle step.

[[Engineering Estate]], [[AI Execution Fabric]], [[Operating Model]] and [[Knowledge Architecture]] already describe much of the model. [[TECHNE-GOV-005-define-isolated-agent-execution]] added the isolated-task responsibilities and working modes and remains awaiting review. Those notes lack a single reader-facing introduction connecting personal identity, multiple professional contexts, declared footprints and executions. Their product-led descriptions also need reconciliation with explicitly replaceable architectural roles.

This is a distinct synthesis and terminology outcome, not a duplicate of the isolated-execution enactment, the supervised-session proof in [[TECHNE-OPS-002-define-remote-agent-working-style]], or the infrastructure proof in [[TECHNE-OPS-003-pioneer-aws-agent-execution]].

## Boundary

Capture and clarify the intended operating architecture without claiming that it is implemented. Do not select a mandatory model, runtime, messaging service or sandbox product; redefine Agora membership; grant repository or organisational authority; create controller repositories; provision infrastructure; retire existing repositories; or change canonical notes through this intake capture.

Techne retains its wider engineering-discipline scope. Calling this an agentic operating architecture does not turn the knowledge base into an executable product, displace another repository's canonical authority, or make Kubernetes a requirement for everyone following Techne.

## Discussion

### Reader-facing introduction

Techne is an operating architecture for agentic work: a way to bring personal AI assistance, specialised agents, engineering tools and governed knowledge into a coherent working practice.

Techne starts with a person's objectives. A personal agent controller helps interpret those objectives, coordinate work and engage the appropriate agents and tools. Work can continue independently of the conversation, with clear permissions, observable progress and reviewable results.

The same controller accompanies a person across their different responsibilities. Working on a business, maintaining a shared project or handling a private matter does not require a different artificial identity. It requires the right working context: the relevant knowledge, responsibilities, permissions and capabilities.

Knowledge Islands supplies governed knowledge and repository relationships that give each context substance. The Techne Fabric connects work with suitable execution environments, whether they run in the cloud, on a personal server or across both. The controller's location and the location of its workers are independent choices.

Agents operate through defined footprints, receive bounded assignments and return durable outcomes to the repositories where the work belongs. A person can delegate work, inspect its progress or enter an environment directly when hands-on participation is useful.

Techne defines the roles, boundaries and working practice. Particular models, agent runtimes, interfaces and infrastructure providers are replaceable implementations. The intended outcome is one continuous point of personal coordination, multiple explicit working contexts and portable, governed execution.

### Core definitions

- **Techne** is the overall engineering approach: principles, operating model, architectural contracts and implementation patterns for AI-native work. The phrase agentic operating system describes the ambition at this level; it does not mean a machine operating system or one all-encompassing application.
- **Techne Fabric** is the execution part of that architecture, corresponding to the existing [[AI Execution Fabric]]. It describes how workload requirements, declared capabilities and policies meet eligible execution targets. Implementations supply the provisioning, routing, lifecycle and observation mechanisms; the fabric is not itself one mandatory server or cluster.
- **Personal agent controller** is the service through which a person coordinates agentic work. It maintains task continuity, applies delegated authority and supervises executions across the fabric. Reasoning may propose work, but trusted deterministic controls enforce consequential operations.
- **Persona** is the enduring agent identity embodied by that controller: its relationship with its person, communication style and standing preferences. Persona continuity does not imply unrestricted memory sharing or identical authority in every context.
- **Working context** identifies the purpose and capacity in which the person is acting. It selects relevant knowledge, repository relationships, eligible footprints, permissions and approval rules. It is the person's current hat, not another persona.
- **Working mode** describes participation and continuity: attached interactive work, persistent human-supervised work, or unattended isolated work. Context answers which hat; mode answers how the person and agents are participating.
- **Agent footprint** is a reproducible declaration of an agent's runtime, tools, environment requirements and permitted operating envelope. An image packages software; the footprint also describes configuration, capability and lifecycle requirements. A portable bootstrap profile supplies the environment-preparation subset of that footprint.
- **Execution** is one identifiable assignment carried out through a footprint, bound to an explicit working context, repository baseline and grant of authority. It can outlive the initiating conversation and returns a result with evidence.
- **Task environment** is the bounded filesystem, process, network and isolation environment used by an execution. Its lifetime is separate from the task's identity: recovery may require a replacement environment, and an explicitly persistent workspace may support sequential assignments.
- **Execution target** is an eligible endpoint or pool of capacity capable of hosting an environment. Eligibility depends on capabilities and policy, not merely on connectivity or common ownership.
- **Deployment** is a running installation of software in a particular location. Moving a controller's deployment does not create a new persona; creating another worker does not create another personal controller.
- **Interface** is a means of interaction, such as a messaging channel or a remote-development editor. It does not own task authority, persona identity or the sole durable copy of work.

### Kitteth and reusable software

Kitteth is the owner's personal agent controller, embodying their agentic persona. Kitteth is not the generic name for the controller software or for Techne. Another person can follow the same approach and use the same reusable implementation with their own persona, contexts and delegated authority.

The intended personal repository, provisionally named `ki-techne-kitteth`, holds the persona and references to its contexts, approved footprints and deployment configuration. It is a personal definition, not a fork of the reusable controller implementation. Credentials and sensitive runtime state do not belong in its Git history. Repository creation, ownership and visibility remain implementation decisions.

Reusable controller software supplies capabilities shared by personal instances. Its source repository, interfaces and implementation language are not selected by this introduction. The personal instance may maintain a catalogue of supported footprints and a record of ongoing executions; each working context exposes only its eligible subset.

### One persona and several hats

The owner's examples are Knowledge Islands work, legal work, and Humans, Not Robots company work. These are illustrative working contexts, not newly declared Agoras, verified memberships or grants of access. The public architectural explanation needs no private matter names, client details, account identifiers or credentials.

A working context identifies the purpose, the person or organisation on whose behalf work is done, relevant repository and knowledge scopes, permitted capabilities, credential and data-handling boundaries, review requirements, and applicable resource limits. The same individual may act in several capacities without those capacities acquiring each other's authority.

Context selection must be visible. The controller may suggest a context, but an ambiguous request needs clarification before consequential action. A messaging conversation is not automatically the context, and one global current-context variable must not silently govern every task.

An execution retains its assigned context and authority while the person changes hats in another conversation. Authority remains subject to revocation and expiry; a deliberate scope change needs a new validated grant. A context switch must not redirect existing work or widen its permissions.

Shared personal preferences may be reusable across contexts. Matter-specific memory, retrieved documents, working files, model inputs, logs and results must respect their own context boundaries. Any cross-context transfer requires explicit, policy-permitted authority; one persona is not a licence to combine all accessible knowledge.

### Relationship to Knowledge Islands and Agoras

Knowledge Islands provides governed repositories, durable context, decisions and evidence. An Agora is a purposeful collection of independently governed repositories with reciprocal membership, as defined by `ki-agora`. It is neither a controller, a persona, a filesystem workspace nor an access-control grant.

A working context may reference one or more Agoras, and an Agora may be relevant to more than one context. This relationship is not necessarily one-to-one. Membership and declared repository roles help establish which repositories belong together; they do not establish the controller's user identity, repository permissions, publication authority or permission to transfer knowledge between contexts.

The controller must resolve the applicable repository relationships and obtain suitable authority separately. An editor projection of an Agora does not prove that every projected repository is available or authorised for an unattended worker.

### Footprints, capabilities and execution

A footprint describes the tools and runtime needed for a class of work, pinned software or image references, preparation and health checks, compatible target capabilities, resource and network limits, state handling, and whether human attachment is supported. It can be reused for many assignments without embedding a particular task's credentials or repository contents in an image.

The execution binds that reusable definition to a particular objective, repository baseline, selected context, authorised operations, evidence destination and lifetime. Declaring a capability in a footprint or skill does not enforce permission. Trusted dispatch, credential and integration boundaries must constrain the actual operations.

Supported footprints, context-eligible footprints and currently running executions are different sets. An available coding footprint may be disallowed in a restricted context, and an eligible footprint need not consume resources until work is dispatched.

The detailed profile schema, execution protocol and conformance tests remain downstream work. The introduction establishes the concepts without making every field above a settled public API.

### Working lifecycle and human participation

The intended lifecycle is to establish intent and context, frame bounded work, validate authority, select a suitable footprint and target, supervise execution, return evidence for review, and retain durable outcomes. Chat acknowledges and tracks the request while execution proceeds independently; it must not be the only route to recover pending work.

Human participation is deliberate. A person may inspect an execution, approve an action or attach to a persistent environment through a suitable editor. Switching from unattended execution to direct human editing requires an explicit transfer or coordination of write ownership, not two uncontrolled writers in the same checkout.

The first repository-writing policy should be conservative: one active write assignment per repository, separate clones and branches, and serial integration with baseline validation. Independent read-only work can run concurrently. External and human changes still require detection; a controller-local claim is not a universal repository lock.

### State, identity and authority

Git and the selected change-management process retain durable work, decisions, results and review. They are not a substitute for every form of operational state. The controller needs a small durable record of task identities, pending work, approvals, context bindings, ownership, message deduplication and recovery references. Telemetry and large artifacts need suitable governed storage rather than indiscriminate commits to repositories.

Provider snapshots and environment disks can support continuity but must not become the only recoverable record of completed work. Credentials remain separately managed, scoped and revocable. A reasoning component must not gain infrastructure-administrator or unrestricted repository authority merely because it operates as the personal assistant.

There should be one active controller authority per persona across all deployments. One replica in each of two clusters does not satisfy that requirement. Relocation must prevent a stale controller from dispatching work or publishing results; leases without enforcement at consequential operation boundaries are insufficient. An explicit drain-and-move procedure is an acceptable first implementation. The exact consistency and fencing mechanisms remain to be designed.

### Deployment direction and cost acceptance

The owner's initial deployment direction is cloud-first in the dedicated Techne AWS footprint, using Kubernetes. The discussed approximately USD 73 monthly EKS control-plane charge is accepted by the owner as a design assumption, not a reason to defer cloud capability. This records the owner's tolerance for that standing charge; it is not a new price quotation, a total-running-cost estimate or unlimited spending authority.

Mac Studio capacity is a later local execution option, potentially avoiding that cloud control-plane charge for an independently operated local target. The architecture permits the personal controller to run locally while dispatching cloud workers, or to run in the cloud while local capacity is unavailable. It does not require a stretched cloud-and-home Kubernetes cluster.

Controller placement, worker placement and model-inference placement remain independent. Portability means preserving the declared contract on compatible targets, not assuming identical hardware, operating-system capabilities or process snapshots everywhere. CPU architecture, Linux versus native macOS tooling, persistent storage and recovery semantics require target-specific evidence.

### Technology candidates and non-goals

Hermes is a candidate for reasoning and conversational capabilities. Herdr is a candidate for persistent supervised-session capabilities. Agent Sandbox is the preferred Kubernetes environment-lifecycle candidate to evaluate. Existing deterministic tooling such as `tools-mgit` may implement defined operations. None defines the architectural role or becomes mandatory through this capture.

Messaging and editor choices are similarly replaceable. Telegram is the initial conversational preference and Zed the intended human-in-the-middle interface. The core approach should not depend on one channel or editor, and their presence does not establish authentication or authority by itself.

OpenClaw is not a requirement. The old personal experiment may be retired through separately authorised work after checking retained persona material, services, hooks and credentials. Coder is not a required control plane. The reusable orchestration layer should avoid proprietary feature gates; third-party runtime, model and service dependencies still need explicit licensing and operational review when selected.

### Intended canonical home and reconciliation

The intended first deliverable is a reader-facing `Agentic Operating Approach.md` note in `Pillars/Engineering Practice/Architecture/`, linked from [[Architecture]] and [[Engineering Practice]]. It should introduce the purpose and vocabulary and direct readers to detailed role, placement, lifecycle and knowledge notes. It should not become a deployment manual or a second roadmap.

[[Engineering Estate]] should describe architectural roles before mapping candidate or selected implementations onto them. [[AI Execution Fabric]] should explain that Techne Fabric is the reader-facing name for that existing architectural concern, not an additional competing layer. [[Operating Model]] should distinguish working context from working mode and make context-bound authority and human handover explicit. [[Knowledge Architecture]] should retain the distinction between governed knowledge and operational state.

Canonical enactment should assess whether the new persona and context boundaries require an additional Architecture Decision Record or an amendment to the existing decision. This capture neither reopens nor accepts [[TECHNE-GOV-005-define-isolated-agent-execution]]. The existing source material is available for synthesis, so its pending review is not represented as a missing-build dependency.

The Harness retains executable capability and conformance work; reusable software stays in its owning implementation repository; personal definitions stay in their personal repository. The existing AWS and supervised-session records retain their proof outcomes. Any revised scope, cross-repository handoff or separately captured delivery item needs its own honest lifecycle rather than an implied commitment from this narrative.

### Questions for subsequent shaping

The agreed conceptual direction is clear enough to preserve. Subsequent planning must settle the exact canonical-note edits, generic implementation ownership, context declaration and activation rules, permitted cross-context preferences and knowledge transfers, credential and policy enforcement, and the durable operational-state boundary.

The resulting overview should let a new reader explain Techne, distinguish Kitteth from reusable software, distinguish a context from an Agora or working mode, distinguish a footprint from an execution or deployment, and identify which capabilities are intended versus proven. It must remain understandable without knowing Hermes, Herdr, Kubernetes or any particular model provider.
