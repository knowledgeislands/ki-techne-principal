# Agentic Operating Approach

## Purpose

Agentic work sits within a wider governed-work model. The personal controller may handle work mechanically, invoke bounded agentic reasoning or combine both. [[Governed Work Controller]] defines these paths and the shared operation, session and execution boundaries beneath them.

Techne is an operating architecture for governed work with agentic capability. It brings personal AI assistance, specialised agents, deterministic engineering tools and governed knowledge into one coherent practice without making any particular model, runtime, interface or infrastructure provider part of the architecture.

The approach begins with a person's objectives. A personal controller helps interpret those objectives, coordinate bounded work and engage suitable deterministic operations, agents and tools. Work may continue beyond the initiating conversation, but its context, authority, progress and outcome remain explicit and reviewable.

Techne defines the roles, boundaries and working practice. It does not claim that every role is already implemented or that the architecture is one all-encompassing software product.

## One Persona, Several Contexts

Each person has one enduring agent persona: the continuing relationship, communication style and standing preferences embodied by their personal agent controller. The same persona accompanies the person across their different responsibilities.

Those responsibilities are separated by explicit working contexts. A working context identifies the purpose and capacity in which the person is acting, the relevant knowledge and repository relationships, eligible capabilities, credential and data-handling boundaries, approval rules and resource limits. Context is the person's current hat; it is not a second persona.

Context selection must be visible before consequential action. A controller may suggest a context, but ambiguity requires clarification. An execution retains the context and authority assigned to it even when the person changes context elsewhere. Changing context cannot redirect existing work, widen its authority or permit information to cross a boundary without a separately valid grant.

A working context may refer to one or more Agoras, but it is not an Agora, a verified Agora membership or an access grant. Repository relationships help identify relevant governed knowledge; they do not establish user identity, credentials, publication authority or permission to transfer knowledge.

Kitteth is Kris's personal agent-controller instance and embodies Kris's persona. It is not the generic name for Techne, for a reusable controller implementation or for software that every person following this approach must use.

## How Work Moves

The controller first routes the request. Recognised commands may invoke deterministic operations directly; natural-language intent may use controller reasoning to select the same bounded operations or frame a workload. Reasoning cannot widen the request's context or authority.

The controller establishes intent and context, frames a bounded assignment and obtains suitable authority. The Techne Fabric then matches that authorised execution with an eligible workload footprint and execution target. The execution runs within a task environment and returns durable results and evidence through the applicable governance and review process.

Techne Fabric is the reader-facing name for the [[AI Execution Fabric]], not an additional architectural layer. It connects workload requirements, declared capabilities and policy with suitable execution capacity. Controller placement, worker placement and model-inference placement are independent choices.

The `ki` governance surface and a prospective execution-fabric operator have distinct responsibilities. `ki` governs work, knowledge and repository relationships. A fabric operator would provision, dispatch, observe and clean up execution through replaceable adapters. Governance authority does not imply infrastructure-control authority, and the architecture does not assign the prospective operator to a repository, product or provider.

## Stable Vocabulary

The established term **personal agent controller** names the persona-bearing role, but does not mean every controller action or dispatched workload requires an agent. **Personal controller** is the shorter role name used where the mechanical, agentic and hybrid paths all apply.

- **Personal controller** — the service through which a person coordinates governed mechanical, agentic and hybrid work. It maintains persona and session continuity, task identity, context binding, delegated authority, lifecycle supervision and result integration. Reasoning may interpret and propose work, while trusted deterministic boundaries enforce consequential operations.
- **Persona** — the enduring agent identity associated with one person. Persona continuity does not permit unrestricted memory sharing or identical authority across contexts.
- **Working context** — the explicit purpose and capacity in which the person is acting, together with the knowledge, relationships, capabilities and authority applicable to that capacity.
- **Working mode** — how the person and agents participate: attached interactive work, persistent human-supervised work or unattended isolated work. Context answers which hat; mode answers how work proceeds. [[Operating Model]] defines these modes and their lifecycle.
- **Workload footprint** — a reusable declaration of the runtime, tools, environment requirements, capabilities and permitted operating envelope for mechanical, agentic or hybrid work. It may include an agent runtime, describes more than a software image and contains neither a particular assignment's credentials nor its repository contents.
- **Execution** — one identifiable, bounded assignment through a footprint, bound to an explicit context, repository baseline and grant of authority. It may outlive the conversation that initiated it.
- **Task environment** — the bounded filesystem, process, network and isolation environment used by an execution. An execution may recover into a replacement environment; an environment is not the task's identity.
- **Execution target** — an endpoint or pool of capacity eligible to host a task environment. Eligibility follows declared capability and policy, not connectivity or common ownership alone.
- **Deployment** — a running installation of controller, operator or worker software in a location. Moving a deployment does not create a new persona, and creating a worker does not create another personal controller.
- **Interface** — a means of interacting with work, such as a conversation channel or development editor. It owns neither persona nor task authority and must not be the sole durable record of ongoing work.

## Authority, State and Continuity

One active controller authority acts for a persona across all deployments. Relocating or recovering that controller must prevent stale deployments from dispatching work or publishing results. The architecture requires the invariant but leaves the exact consistency, fencing and recovery mechanisms to implementation decisions.

Authority is explicit, scoped, revocable and bound to an execution. Declaring a capability in a footprint or making a repository visible does not authorise its use. Human attachment to ongoing work requires a deliberate handover or coordination of write ownership rather than uncontrolled concurrent writers.

Governed repositories retain durable work, decisions, evidence and knowledge. Controller records, credentials, environment checkpoints, telemetry and transient conversation are different state classes and need their own appropriate stores and controls. Provider snapshots may assist recovery but cannot become the only recoverable record of completed work. [[Knowledge Architecture]] defines the boundary around durable knowledge.

## Architectural Commitments

The architectural commitments are one persona per person, explicit authority-bound contexts, one active controller authority, portable footprints, bounded executions and durable reviewable outcomes. Interfaces, agent runtimes, model capabilities, execution substrates and providers remain replaceable mappings onto the roles in [[Engineering Estate]].

This overview does not select a controller product, command surface, repository, provider, provisioning mechanism or deployment topology. It also does not assert that the intended fabric capabilities are already proven. Concrete implementations and operational evidence remain governed in their owning repositories and work records.

[[ADR-TECHNE-001-provider-neutral-isolated-agent-execution|ADR-TECHNE-001]] defines the provider-neutral isolation model for agent execution. [[ADR-TECHNE-002-one-persona-across-explicit-working-contexts|ADR-TECHNE-002]] records the persona and working-context architecture.

Return to [[Architecture]].
