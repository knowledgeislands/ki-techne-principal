# Governed Work Controller

## Purpose

The personal controller is the enduring service through which a person coordinates governed work. It accepts intent, binds the applicable working context and authority, chooses a bounded way to perform the work, supervises its lifecycle and integrates its outcome. The work may be mechanical, agentic or hybrid.

Agentic support is a first-class controller capability, not the controller's universal implementation mechanism. Reasoning is valuable for interpreting natural language, resolving ambiguity, planning and synthesising outcomes. Deterministic mechanisms remain preferable for recognised commands, policy enforcement, admission, cancellation, lifecycle state and other operations whose correctness or repeatability matters.

## Request Paths

The controller provides two complementary request paths:

- A **deterministic path** maps a recognised command or structured request directly to a bounded controller operation.
- An **agentic path** uses reasoning to interpret intent, ask clarifying questions, select a registered operation or frame a bounded workload.

Both paths converge on the same explicit operations and authority checks. Controller reasoning may propose an operation and prepare its inputs, but it does not gain unrestricted shell, Kubernetes, credential or provider access. Consequential effects occur through deterministic admission and operation boundaries that are independently testable and observable.

An interface such as Telegram may expose both paths. The presence of a conversational interface does not make every interaction agentic, and a command syntax does not prevent the controller from maintaining a continuing persona and session.

## Workload Forms

- A **mechanical workload** runs a purpose-built program with predictable inputs, outputs and failure behaviour.
- An **agentic workload** runs an eligible agent runtime where reasoning, synthesis or adaptation contributes material value.
- A **hybrid workload** combines deterministic preparation, admission, tools or verification with one or more bounded agentic steps.

All three forms use the same architectural concepts for objective, context, authority, execution identity, target eligibility, evidence, recovery and cleanup. A workload form does not itself select a provider, target, model or isolation substrate.

## Identity and Placement

The following identities remain distinct:

- A **controller session** is a logical continuity boundary for interaction, context and task coordination. It may outlive a client connection and may cause several executions.
- A **workload** is a registered or explicitly framed way of producing an outcome, including its required capabilities and operating envelope.
- An **execution** is one bounded invocation of a workload, bound to an objective, context, authority, inputs, evidence destination and lifetime.
- A **task environment** is the disposable or explicitly resumable filesystem, process and network boundary in which one execution runs.
- A **worker** supplies eligible execution capacity. It does not own the persona, controller session, execution authority or durable outcome.

A controller session is therefore not a pod, model process or Kubernetes object. An execution may recover into a replacement task environment without changing its identity or authority. A worker need not retain a permanently running agent, and mechanical work does not require an agent runtime at all.

Controller placement, worker placement and model-inference placement remain independent. A retained controller deployment may also expose a local execution target, but sharing infrastructure does not merge their responsibilities. Additional targets are justified only by workload requirements such as isolation, capability, capacity, trust, locality or lifecycle.

## Controller Responsibilities

The controller owns:

- persona and controller-session continuity;
- explicit working-context and authority binding;
- a registry of bounded controller operations and workloads;
- deterministic validation and admission for consequential actions;
- execution creation, target selection, supervision, cancellation and result integration;
- routing between direct mechanical handling and agentic interpretation;
- presentation of progress, failure and evidence through replaceable interfaces.

The controller does not make transient conversation the sole durable record of accepted work. It does not allow model reasoning to widen an authority grant, infer credentials from connectivity or bypass the review boundary of the governed outcome.

## Progressive Mechanisation

Agentic behaviour can establish value while a task remains exploratory or its decision rules are not yet stable. Observed recurring behaviour may then become a named workload with explicit inputs, outputs and evidence. When the behaviour becomes sufficiently simple, frequent and reliable, it may become a direct deterministic controller operation.

This is an evidence-led progression, not a requirement to eliminate reasoning:

1. Explore a valuable outcome through bounded agentic work.
2. Identify repeated structure and establish a registered workload.
3. Move stable preparation, policy, validation and verification into deterministic mechanisms.
4. Promote a whole operation to a direct handler only when doing so improves reliability, cost or comprehensibility without discarding needed judgement.

Mechanical workloads may also be introduced directly when their behaviour is already understood. The common controller and execution boundaries let both paths evolve without making the agent runtime, cluster or interface the architecture.

## Relationship to Techne Fabric

The controller establishes intent, context and authority, then requests execution through Techne Fabric when work needs a task environment. Fabric matches a workload footprint to an eligible target and supervises the provider-neutral execution lifecycle described by [[Techne Fabric Execution Contract]]. A workload footprint declares the runtime, tools, environment and operating constraints required by mechanical, agentic or hybrid work; an agent runtime is optional.

[[Agentic Operating Approach]] places the controller within the person's wider relationship with Techne. [[Engineering Estate]] separates its responsibilities from governance, deterministic operations, fabric operation, task execution, interfaces, knowledge and model inference. [[AI Execution Fabric]] defines target selection and placement.

Return [[Architecture]].
