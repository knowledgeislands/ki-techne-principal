# Engineering Estate

## Purpose

The engineering estate is the set of components used to turn engineering intent into governed, observable work.

This chapter defines the stable architectural roles and the boundaries between them before mapping current or candidate components onto those roles.

It is not an installation guide or an integration contract.

Component-specific configuration, APIs, and operational procedures belong in their authoritative repositories or future operating documentation.

## Architectural Roles

The personal-controller role coordinates governed work across deterministic, agentic and hybrid paths. Its reasoning capability is optional for a particular request; its identity, policy and lifecycle responsibilities are not. [[Governed Work Controller]] defines the detailed boundary.

- **Personal controller** — maintains persona and session continuity, task identity, context binding, delegated authority, lifecycle supervision and result integration across mechanical, agentic and hybrid work. Reasoning may propose work, while trusted deterministic boundaries enforce consequential operations.
- **Governance layer** — selects and advances governed work, knowledge and repository relationships without acquiring execution-provider authority.
- **Deterministic operations layer** — performs defined engineering operations repeatably and exposes an accountable control boundary.
- **Execution-fabric operator** — prospectively matches an authorised execution with an eligible footprint and target, then manages provisioning, dispatch, observation, evidence return and cleanup through replaceable adapters.
- **Task environment** — supplies the bounded filesystem, process, network and isolation boundary for one execution.
- **Agent runtime** — performs the authorised assignment inside the task environment.
- **Engineering interface** — lets a person inspect, change, review or deliberately attach to work.
- **Governed knowledge layer** — retains durable context, decisions, evidence and relationships without becoming the store for every kind of operational state.
- **Private connectivity layer** — connects authorised people, environments and services without making network location the primary trust boundary.
- **Model execution capability** — supplies eligible inference independently of controller and worker placement.

## Current and Candidate Mappings

- **Hermes Agent** is a candidate personal-controller reasoning and conversational capability. It does not define the controller role.
- **`ki-techne-harness`** owns runnable personal-controller and execution-fabric-operator implementations while preserving those roles as separate components.
- **`ki`** implements governance workflows for repositories, knowledge, skills and work. It is not the execution-fabric operator and should not silently acquire provider credentials or infrastructure-control responsibilities.
- **tools-mgit** is the current deterministic engineering-operations mapping.
- **Herdr** is the current persistent supervised-execution mapping.
- **Zed** is the current primary engineering-interface mapping.
- **Knowledge Islands** is the governed knowledge and repository-relationship mapping.
- **Tailscale** is the current private-connectivity mapping.
- **llama.cpp** and **MLX-LM** are current local model-execution options.

`ki-techne-harness` is the selected product repository for the execution-fabric operator and personal-controller implementation. Its command surface and internal component boundaries remain product decisions governed by the architectural roles in this chapter.

## Ownership Boundaries

Techne owns the architectural roles, relationships and decision criteria. `ki-specifications` owns accepted normative portable contracts. `ki-agentic-harness` owns reusable agentic capabilities, while `tools-ki` owns deterministic CLI and platform behaviour it implements. Governance authority does not grant infrastructure-control authority.

`ki-techne-harness` owns implementations of the personal-controller and execution-fabric-operator roles. Techne Principal retains their architectural meaning and boundaries; assigning one product repository does not merge the roles or make that repository authoritative for governed work, credentials or accepted outcomes. [[Techne Fabric Execution Contract]] defines the hand-off those implementations must preserve.

## Work Execution Responsibilities

These responsibilities apply to mechanical, agentic and hybrid workloads. Agent-specific responsibilities specialise the common workload boundary rather than defining every execution.

These responsibilities describe replaceable architectural roles rather than requiring one product for each role.

### Controller

The controller owns task or session identity, selected working context, delegated policy, credential brokerage, lifecycle supervision, and result integration. It selects or invokes an eligible execution target without making that target authoritative for the work. One persona across several contexts does not permit state or authority to cross their boundaries.

### Task Environment

The task environment supplies the bounded filesystem, process, network, and isolation boundary. It begins from an immutable repository baseline and is disposable unless an explicit persistence and recovery policy applies.

### Bootstrap Profile

The bootstrap profile declares the tools, capabilities, configuration shape, state classes, and readiness checks required by the task. It remains consumable independently of one workstation configuration manager or provider snapshot.

### Workload Footprint

A workload footprint declares the runtime, tools, environment and operating constraints needed for one class of work. It may select a purpose-built program, an agent runtime or a hybrid composition. It contains no assignment credentials or repository contents.

### Agent Footprint

The footprint is the reusable declaration for a class of agent work. It includes its agent runtime, tools, environment and bootstrap requirements, compatible target capabilities, resource and network constraints, state behaviour, health checks and supported forms of human attachment. A footprint does not embed a particular assignment's credentials or repository contents.

### Agent Runtime

The agent runtime performs the authorised task inside the selected environment. Changing the runtime must not change the repository baseline, authority, network policy, evidence contract, or review boundary implicitly.

### Integration Boundary

Git and the selected change-management process retain authoritative source, work state, result evidence, and review. Controllers and environments may cache or checkpoint state, but provider-native snapshots are not the sole recoverable hand-off.

Controller records for task identity, context binding, approvals, ownership, deduplication and recovery remain operational state. Credentials remain separately managed. Neither category becomes canonical knowledge merely because the controller uses governed repositories.

[[Techne Fabric Execution Contract]] defines the immutable execution bindings and evidence envelope crossing this integration boundary.

## Interaction Model

The estate separates engineering intent, governance and deterministic controls from fabric operation and task execution.

Current or candidate mappings may combine roles, but their responsibilities remain distinct. Hermes Agent may develop or refine intent and plans; `ki` governs work and knowledge; tools-mgit performs defined operations; and Herdr provides persistence where an operation requires it.

Zed remains the primary engineering interface for human inspection and review.

Knowledge Islands supplies governed context to the engineering practice and receives durable knowledge created by it.

Tailscale provides private connectivity where components or engineers operate across locations.

The Techne Fabric in [[AI Execution Fabric]] matches an authorised execution with an eligible footprint and target.

Local runtimes are one possible target within that fabric, alongside managed APIs, elastic compute, and future dedicated infrastructure.

The [[Engineering Estate.svg|estate interaction diagram]] is generated from its [[Engineering Estate.mmd|editable Mermaid source]]. It is an illustrative mapping of named components, not a normative inventory of stable roles or a commitment to retain those products.

## Current Constraints and Open Questions

The estate describes responsibilities, not a fully specified integration topology.

The following areas require future decisions or operating guidance:

- the interfaces and hand-off formats between personal coordination, governance, deterministic operations and fabric operation;
- the lifecycle, identity, and observability model for persistent execution;
- the access-control and data-classification model across local and remote execution; and
- the selection process for local and managed AI runtimes.

These questions should be resolved through Architecture Decision Records or operational chapters when an implementation requires a concrete commitment.
