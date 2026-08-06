# Engineering Estate

## Purpose

The engineering estate is the set of components used to turn engineering intent into governed, observable work.

This chapter defines the architectural role of each current component and the boundaries between them.

It is not an installation guide or an integration contract.

Component-specific configuration, APIs, and operational procedures belong in their authoritative repositories or future operating documentation.

## Estate Overview

| Component | Architectural role | Primary responsibility |
| --- | --- | --- |
| Hermes Agent | Intent and planning capability | Interprets objectives, retains relevant working context, and develops plans. |
| tools-mgit | Deterministic orchestration layer | Executes defined engineering operations and coordinates repeatable workflows. |
| Herdr | Persistent execution runtime | Hosts work that must continue beyond a single interactive engineering session. |
| Zed | Engineering interface | Provides the primary environment through which engineers inspect, change, and review work. |
| Knowledge Islands | Governed knowledge layer | Organises governed knowledge, context, decisions, and their evolution. |
| Tailscale | Private connectivity layer | Connects authorised engineering environments and services across network boundaries. |
| llama.cpp | Local model execution runtime | Provides an implementation option for local model inference. |
| MLX-LM | Local model execution runtime | Provides an implementation option for local model inference on suitable hardware. |

## Responsibility Boundaries

### Hermes Agent

Hermes Agent is responsible for intent, contextual reasoning, and planning.

It may propose a course of action, but it does not replace deterministic engineering controls or the accountable review of material changes.

### tools-mgit

tools-mgit is responsible for deterministic orchestration and engineering operations.

It translates approved or defined work into repeatable actions and provides the control boundary around work that requires predictable execution.

### Herdr

Herdr is responsible for persistent execution.

It provides the runtime boundary for work that must outlive an individual interaction or engineering client.

### Zed

Zed is the engineering interface.

It is where engineers inspect context, develop changes, and review the outcomes of automated or manual operations.

### Knowledge Islands

Knowledge Islands is responsible for governed knowledge.

It provides the durable context within which engineering decisions, patterns, and documentation can be discovered, evaluated, and evolved.

### Tailscale

Tailscale provides private connectivity between authorised parts of the engineering estate.

It supports remote engineering without making network location the primary trust boundary.

### Local AI Runtimes

llama.cpp and MLX-LM are local execution options within the estate.

They support workloads where locality, privacy, latency, cost, or offline operation favour local model inference.

They are implementation choices, not the definition of the local AI strategy.

## Interaction Model

The estate separates engineering intent from deterministic execution.

Hermes Agent develops or refines intent and plans; tools-mgit performs defined operations; and Herdr provides persistence where an operation requires it.

Zed remains the primary engineering interface for human inspection and review.

Knowledge Islands supplies governed context to the engineering practice and receives durable knowledge created by it.

Tailscale provides private connectivity where components or engineers operate across locations.

[[AI Execution Fabric]] selects an appropriate execution target for AI-enabled workloads.

Local runtimes are one possible target within that fabric, alongside managed APIs, elastic compute, and future dedicated infrastructure.

The [[Engineering Estate.svg|estate interaction diagram]] is generated from its [[Engineering Estate.mmd|editable Mermaid source]].

## Current Constraints and Open Questions

The estate describes responsibilities, not a fully specified integration topology.

The following areas require future decisions or operating guidance:

- the interfaces and hand-off formats between planning and deterministic orchestration;
- the lifecycle, identity, and observability model for persistent execution;
- the access-control and data-classification model across local and remote execution; and
- the selection process for local and managed AI runtimes.

These questions should be resolved through Architecture Decision Records or operational chapters when an implementation requires a concrete commitment.
