# Controller Workload Evaluation

## Decision

The first useful Techne controller workload should be **on-demand repository verification at an immutable revision**. It is a mechanical workload that runs one allowlisted Knowledge Islands repository's declared verification profile and returns a sanitised structured result.

The retained `local` Kubernetes target is sufficient for the first implementation. No evidence currently justifies another cluster. The first proof should measure actual runtime and resource use; a second target becomes warranted only when a later workload demonstrates an unmet isolation, capability, capacity, trust, locality or lifecycle requirement.

This workload proves the common admission, dispatch, execution, cancellation, result and cleanup path. It does not prove natural-language interpretation, controller-session continuity or bounded agent execution.

## Evidence and Candidates

### Repository verification

**Source:** `+/manual-repo-review-checklist.md` includes repository verification, formatting, type, test and repository-audit evidence within a broader human review.

**Operator outcome:** ask whether one exact repository revision satisfies its declared automated gates and receive an unambiguous result without opening a development environment.

This is a mechanical workload. Its behaviour is understood, its authority can remain read-only and its output is useful before either human or agentic review. It exercises the execution path without introducing a model, session store or general shell surface.

### Advisory code review

**Source:** `+/manual-repo-review-checklist.md` records human judgement questions spanning ecosystem fit, stability, documentation, architecture, implementation and final disposition.

**Operator outcome:** receive prioritised, evidence-linked review findings for one immutable change after deterministic verification.

This is a hybrid workload: deterministic preparation and gate evidence surround an agentic review step. It has greater eventual value but is not the first workload because it adds model selection, context construction, prompt and tool boundaries, evaluation, possible private-source access and false-positive handling before the common execution path has been proven with useful work.

### Persistent supervised agent session

**Source:** `TECHNE-OPS-002` defines the need for named, human-supervised sessions that survive a client disconnect and preserve observation, control and recovery boundaries.

**Operator outcome:** detach from and later resume a named engineering session while retaining its repository and process identity.

This is agentic and session-oriented rather than one bounded first workload. Its proof remains blocked on a named personal-server target, SSH path, service mode and exposure authority. It should not force those unresolved choices into the retained controller proof.

### Excluded capability-shaped options

A general conversational agent, arbitrary shell execution and a workflow-engine comparison are not first-workload candidates. They name mechanisms rather than a bounded operator outcome. `TECHNE-OPS-004` and `TECHNE-OPS-005` remain correctly parked until a concrete workflow or agent-runtime gap could change an adoption decision.

## Comparison

Repository verification has the clearest immediate value, lowest authority and strongest deterministic acceptance test. It requires no model credential, produces no repository change and can run on existing capacity. Failure can be classified without asking an agent to interpret whether the work succeeded.

Advisory code review is the best subsequent agentic or hybrid proof. It should consume the verified source revision and gate result produced by the mechanical path, then add reasoning under a separate authority and evaluation boundary. Implementing it first would couple basic dispatch evidence to model behaviour and make operational failures harder to diagnose.

Persistent supervised sessions establish a different working mode. They may eventually share controller identity and workload machinery, but their continuity and human-control requirements are not prerequisites for executing one bounded verification job.

### Criteria applied

- **Repository verification** is triggered explicitly with an allowlisted repository, immutable revision and profile. It returns deterministic gate results, holds read-only authority, runs for minutes with bounded CPU, memory and storage, needs no credential for the initial public-repository proof, uses restricted source and package-registry egress, has a side-effect-free semantic key, returns a complete result envelope and recovers only through a visible new attempt. It is expected on demand before review and fits `local`.
- **Advisory code review** is triggered after verification with an immutable diff, gate result and review rubric. It returns evidence-linked findings, remains repository-read-only but requires an agent runtime, model capability, context construction, evaluation and potentially a model credential and external inference network. A rerun may produce different advice, so idempotency applies to execution identity rather than text equality. It is recurring but should follow the mechanical proof; model placement remains independent of `local` worker placement.
- **Persistent supervised agent sessions** are triggered by explicit start, detach, attach and recovery actions. They carry a live repository working context, may require write authority, survive longer than a bounded Job and need durable session state, SSH or equivalent connectivity, observation and handover controls. Their evidence is a reviewed work hand-off rather than one result envelope. Recovery semantics and the target are unresolved, so they do not fit the first-workload boundary.

## Recommended Execution Envelope

### Identity and trigger

The workload has a stable identifier such as `repository.verify`. A request supplies:

- an allowlisted repository alias;
- a full immutable Git commit identifier;
- a versioned verification-profile identifier;
- the selected working context and initiating controller request identity; and
- an optional force-rerun flag whose meaning is explicit.

The controller resolves the alias and profile from trusted configuration. It never accepts a repository URL, branch name, package command or arbitrary shell string from Telegram or another conversational interface.

### Authority

The execution may fetch the named public or otherwise pre-authorised repository revision, materialise an isolated checkout, install only lockfile-pinned dependencies required by the selected profile and run the profile's registered gates. It has no authority to modify or push the repository, create issues or checks, alter infrastructure, inspect other repositories or read controller credentials.

The initial implementation should use a public, trusted Knowledge Islands repository so that no source credential enters the worker. Private-repository support is a later authority and credential-brokerage decision.

### Runtime isolation

Run one Kubernetes Job in the execution namespace with:

- no mounted service-account token or Kubernetes API authority;
- no controller Secret, host path, privileged mode or host namespace;
- a non-root user, dropped Linux capabilities, default seccomp profile and read-only root filesystem where the toolchain permits;
- an ephemeral checkout and dependency volume deleted with the Job; and
- network egress limited to the allowlisted source host and package registries required by the locked dependency graph.

Repository dependencies and package-library folders remain inside the execution's ephemeral volume. They must never be installed in the controller image, repository root on the host, a package subfolder shared with another run or a persistent workspace. The owning repository's single-root dependency policy remains authoritative.

### Resource and lifetime bounds

Begin with one execution at a time on `local`, a maximum runtime of 15 minutes, at most 1 vCPU, 2 GiB memory and 5 GiB ephemeral storage. Treat these as first-proof ceilings rather than permanent product defaults. Record observed duration and peak resource use so the implementation can tighten or revise them from evidence.

The workload is on demand rather than scheduled. Its expected initial frequency is a few operator-requested runs per working day; concurrency remains one until evidence demonstrates a need and safe capacity for more.

Cancellation and timeout terminate the Job and proceed to cleanup. There is no implicit retry: a later retry is a new operator-visible attempt under the same repository, revision and profile identity.

### Idempotency

The semantic key is the repository alias, full commit identifier and verification-profile version. Replaying the same controller request reconciles the same execution identity rather than creating a duplicate Job. A separately requested rerun receives a new attempt identity while retaining the semantic key.

Gates must use an immutable runtime image and frozen dependency resolution. A failure to fetch, prepare dependencies or start the Job is an infrastructure error, not a failed repository gate.

### Result and evidence

The result envelope contains:

- execution and request identities;
- repository alias, resolved commit and verification-profile version;
- overall outcome: `passed`, `failed`, `infrastructure-error`, `cancelled` or `timed-out`;
- each named gate's outcome, exit code and duration;
- start, finish and total duration;
- bounded sanitised log excerpts and a digest of the complete captured output;
- observed resource use when available; and
- cleanup outcome.

The controller returns a concise summary and result identity through Telegram or the initiating interface. It does not create a general operational journal. When a result informs governed work, that work's review record retains the relevant result envelope or reference. The first implementation record in `ki-techne-harness` must retain representative pass, gate-failure, infrastructure-failure, cancellation and timeout evidence as its durable proof.

Redaction occurs before logs leave the execution boundary. Output is size-limited, binary output is rejected and truncation is visible. A digest is not treated as a confidentiality control.

### Failure and recovery

The controller distinguishes invalid requests, admission rejection, target transport failure, checkout or dependency failure, gate failure, cancellation, timeout, result-collection failure and cleanup failure. A failed or disappeared pod does not silently become a retry. Recovery preserves the request and semantic identity, records a new attempt and never widens authority.

Completion is reported only after the result envelope is collected and cleanup is either confirmed or explicitly reported as incomplete. Unknown state is a visible outcome requiring operator attention.

## Target Decision

The registered `local` target satisfies the known envelope:

- the retained `t3.medium` provides enough capacity for one conservatively bounded verification Job;
- Kubernetes Job dispatch, observation, cancellation and Telegram result return are already proven there;
- the first workload requires neither GPU capacity, provider-specific services, long-lived storage nor a different trust boundary; and
- serial execution avoids competing with the controller while measurements establish actual demand.

Colocation is acceptable for this bounded proof because the Job receives no controller credential or Kubernetes authority and uses explicit resource ceilings. If those controls cannot be enforced on `local`, implementation must stop rather than create another cluster by default.

Register another target only when observed workload evidence shows that `local` cannot meet a named requirement. Capacity pressure alone should first be addressed by scheduling and honest measurement; stronger isolation, incompatible dependencies, a distinct trust boundary or materially different lifecycle may justify separate capacity.

## Follow-on Boundary

The executable follow-on belongs in `knowledgeislands/ki-techne-harness`, the owner of personal-controller and execution-fabric implementations. A separately adopted product-roadmap item should:

- add a registered workload identity and validated request envelope rather than extend `/run` with arbitrary commands;
- construct the bounded verification Job independently of Telegram parsing;
- preserve existing target selection, replay-safe execution identity and cancellation behaviour;
- implement the isolation, resource, output, failure and cleanup rules above;
- add deterministic tests for pass, gate failure, invalid input, replay, cancellation, timeout, redaction, result truncation and cleanup failure;
- document any operator command only after its grammar is selected in the owning repository; and
- prove the workload on `local` without provisioning or registering another cluster.

Acceptance requires one successful and one intentional failing verification of an allowlisted immutable revision, evidence that no package-library folder or credential persists beyond the Job, and confirmation that the controller remains responsive throughout. Agentic review, controller-session persistence, private-repository credentials and remote targets remain separate work.

No implementation record is automatically created or adopted by this evaluation. Route it to the owning repository through the governed trade process when implementation is selected.

## Review Point

Revisit this decision after the first useful repository-verification implementation has produced runtime, resource, failure and operator-value evidence, or earlier if its isolation envelope cannot be enforced on `local`. Only then decide whether the second proof should be advisory code review, another agentic workload or a different execution target.

Return [[Architecture]].
