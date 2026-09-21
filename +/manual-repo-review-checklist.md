---
note_type: pillars/note
created: 2026-09-20T00:00:00Z
updated: 2026-09-20T00:00:00Z
reviewed:
tags:
  - topic/engineering-practice
author: Mixed
---

# Manual Repo Review Checklist

## Purpose

This checklist captures the high-level judgement a person applies to each repository: whether it meets its needs and fulfils its place in the wider ecosystem. It externalises each repository's stable baseline so its purpose, settled state, and outstanding change do not have to be held in personal memory. It moves from ecosystem fit and repository responsibility through architecture and implementation to detailed evidence and final disposition.

`Manual` means the review is deliberately invoked and interpreted, not that a person must perform every step. A person may run it directly or ask an agent to gather evidence, apply selected lenses, and draft findings for human judgement.

The checklist supplies default lenses for an ad hoc review. It is not a universal score, an automatic compliance standard, or permission to change the repository.

Each item is atomic and answerable yes or no. An item that needs a paragraph to answer is hiding a second item.

Items were derived from recurring review requests across the estate between August and September 2026. The checklist is a living record: when a review finds something this list did not ask for, add the question here.

## How to use it

Not every section applies to every repository. Start at repository purpose, work in order through each applicable section, and record why any section does not apply.

A failed item is a finding, not a blocker. Record it, decide whether it lands now or becomes a roadmap item, and move on.

Prefer deleting an item that never fires over keeping it out of completeness.

## Review method and output

- [ ] The review states its purpose before inspection begins.
- [ ] The review states its repository boundary and exclusions.
- [ ] The review states its intended readers and time horizon.
- [ ] The review states which checklist sections it applies and why any section is omitted.
- [ ] The review is read-only unless separate authority explicitly permits changes.
- [ ] A broad review uses independent product, human-experience, and engineering lenses before reconciling findings.
- [ ] Evidence covers repository orientation, current work, decisions, specifications, guides, implementation, tests, and relevant live state within scope.
- [ ] Each material claim is labelled as observed, inferred, or user-confirmed.
- [ ] Each material finding cites its evidence.
- [ ] Each material finding states its consequence and confidence.
- [ ] Each material finding proposes a durable route or explicitly recommends no action.
- [ ] Findings distinguish defects, intentional current boundaries, and future capabilities.
- [ ] The output begins with a concise outcome summary.
- [ ] The output includes a maturity scorecard for the reviewed areas.
- [ ] The output identifies the strongest choices to retain.
- [ ] The output prioritises material findings rather than presenting an undifferentiated inventory.
- [ ] The output proposes a bounded delivery sequence with dependencies.
- [ ] The output states what changed and where review evidence remains.

## Repository purpose and stability

- [ ] The repository fulfils its delineated responsibility within the wider project ecosystem.
- [ ] The repository has a clear stable baseline against which future change can be judged.
- [ ] The repository records enough of that baseline that maintaining it does not depend on personal memory.
- [ ] Every known departure from the stable baseline is explicit and represented by active work.
- [ ] The product or operating model forms a coherent path from declared intent through execution to observable outcome.
- [ ] Claims about maturity, supported environments, and wider applicability match proven use.
- [ ] Intentional current boundaries are distinguished from defects and future capabilities.

## Repository governance

- [ ] The repository declaration reflects what the repository now contains.
- [ ] The declared skill set covers every governance capability the repository uses, including capabilities without an automatic detection signal.
- [ ] Every declared runtime-bound skill is linked into the repository through a KI-managed local projection.
- [ ] No skill remains declared after the capability it governs has left the repository.
- [ ] A substantive change to a canonical zone went through the enactment process.
- [ ] The work record exists and its status matches reality.
- [ ] Commit messages follow the conventional format and describe the change, not the session.
- [ ] Staged paths are exactly the paths this work touched.
- [ ] No other writer's uncommitted work was reverted, stashed, or discarded.

## Naming and identity

- [ ] Every addressable thing has a unique identifier.
- [ ] Identifiers are stable and are never reused after retirement.
- [ ] Names follow the declared prefix or area scheme.
- [ ] A repository is named after the smallest brand that accurately covers everything it contains.
- [ ] Renames were propagated to every reference, including documentation and configuration.

## Documentation and knowledge

- [ ] Documentation presents one consolidated account of the repository's current responsibility, behaviour, and intended direction.
- [ ] A human can follow the repository's story without reconstructing it from file layout, commit history, agent-only metadata, or unstated context.
- [ ] Documentation progressively reveals purpose and concepts before procedures, implementation detail, and reference material.
- [ ] Each subject has one authoritative home; other documents link to it rather than repeating it.
- [ ] Historical change remains in version control or explicitly historical records instead of current-state guidance.
- [ ] Decision records state the current decision, its rationale, and its future consequences rather than accumulating a chronological change history.
- [ ] Amend an existing decision record in place rather than creating a successor that merely clarifies or expands scope.
- [ ] Supersede a decision record only when the decision is genuinely reversed.
- [ ] A shared decision record is updated coherently in every repository that projects it.
- [ ] Guide areas make their intended audience, task, and reading path obvious.
- [ ] Every guide under `docs/guides/` lives in an explicit audience subdirectory, such as `user/`, `developer/`, or `agent/`.
- [ ] Specifications state observable behaviour, constraints, and acceptance evidence precisely enough for implementation and review.
- [ ] Skill definitions make their triggers, ownership, dependencies, boundaries, and operating modes understandable to a human reviewer.
- [ ] Every cross-reference resolves, and cites the record that is actually current.
- [ ] The README positions the repository within the estate.
- [ ] Anything that could be a skill has been made one.

## Necessity and over-engineering

- [ ] Every file added is necessary.
- [ ] No abstraction exists for a single caller.
- [ ] No extension point exists without a concrete second case.
- [ ] No configuration option exists that nothing sets.
- [ ] Dead code is deleted rather than retained, commented out, or tested.
- [ ] Defensive branches that cannot be reached are removed rather than covered.
- [ ] The change removes at least as much complexity as it adds, or says why not.

## Structure and modularity

- [ ] The code is factorised into modules with a single clear responsibility.
- [ ] The structure still fits the problem after the evolution this code has been through.
- [ ] A module's name predicts its contents.
- [ ] Module boundaries are enforced mechanically, not by convention alone.
- [ ] No module imports across a declared ownership boundary.
- [ ] Configuration is separated from the model it configures.
- [ ] Instance-specific data is not sitting in a place reserved for generic behaviour.
- [ ] A new reader could locate the owner of any given behaviour in one attempt.
- [ ] Nothing was moved without its tests moving with it.

## Contracts and interfaces

- [ ] The public surface of each module is the smallest that serves its callers.
- [ ] Interface changes are compatible, or their incompatibility is recorded.
- [ ] Error paths return actionable information rather than a generic failure.
- [ ] Input from outside the process is validated at the boundary.
- [ ] The contract is stated somewhere a consumer will find it.
- [ ] Every operation makes its authority, effective scope, and material consequences clear before mutation.
- [ ] Selection, application, switching, and deselection semantics are explicit wherever managed state can persist.
- [ ] Concurrent mutations have an explicit ownership or serialisation model.

## Human use and configuration

- [ ] The primary user path reaches a recognisable end-to-end result before advanced mechanics are introduced.
- [ ] Realistic configuration remains readable, editable, and reviewable at its actual scale.
- [ ] Status and preview surfaces distinguish declared intent, observed state, and planned change.
- [ ] Examples are copyable, realistic, and show the result a reader should recognise.
- [ ] Human-facing rationales explain why a choice exists rather than merely restating that it is declared.

## Security and data

- [ ] Access gating is tested, not merely present.
- [ ] Default access level is the least privileged that works.
- [ ] Redaction lists were reviewed against what the code actually logs.
- [ ] Truncating a value is not being relied on as a confidentiality control.
- [ ] Filesystem access is confined to declared roots.
- [ ] No secret, token, or credential is committed or logged.
- [ ] Network egress is limited to what the component needs.
- [ ] Repository visibility matches the sensitivity of what it contains.
- [ ] Licence and copyright headers match the intended position.

## Dependencies and toolchain

- [ ] Every dependency added is used.
- [ ] Every dependency removed is genuinely unreferenced.
- [ ] Dependency updates within the last fortnight are informational; older ones are a finding.
- [ ] The toolchain is on the intended leading-edge version, not drifting behind.
- [ ] No dependency was added where an existing one already does the job.
- [ ] A new runtime dependency is justified against vendoring or a pinned reference.

## Performance, maintainability, and release

- [ ] Representative operations have explicit performance budgets and meet them against realistic data.
- [ ] Slow operations expose progress without progress masking avoidable latency in ordinary queries.
- [ ] The distribution contract does not force authored source into a monolith that raises change coupling.
- [ ] Version output, changelog, installation instructions, documentation, and released artifacts describe the same release state.
- [ ] Development-only behaviour is clearly distinguished from the latest released behaviour.
- [ ] Any published or deployed surface is demonstrably derived from declared current source, or explicitly described as independent.

## Duplication and reuse

- [ ] Repeated logic is consolidated rather than copied.
- [ ] Any deliberate duplication is justified in writing and attributable to its source.
- [ ] Vendored or generated copies record the revision they came from.
- [ ] Vendored or generated copies are checked for drift by something that fails.
- [ ] Shared configuration comes from one factory rather than parallel copies.
- [ ] The change does not introduce a second source of truth for an existing fact.
- [ ] Security-relevant logic has one authoritative definition, or a conformance contract proving equivalence.

## Tests

- [ ] Tests exercise architectural boundaries rather than internal units.
- [ ] Tests work outside-in from the contract.
- [ ] The test names describe behaviour, not implementation.
- [ ] Coverage gaps were understood before they were filled.
- [ ] No test was added merely to raise a coverage number.
- [ ] An uncovered line was resolved in preference order: cover the boundary, refactor away the impossible branch, delete the dead code, annotate the reason.
- [ ] Every security control has a test that fails when the control is removed.
- [ ] A test exists for each documented failure mode, not only the happy path.
- [ ] Fixtures contain no real personal data, credentials, or customer identifiers.
- [ ] Tests do not depend on execution order or on each other's state.

## Scripts, binaries, and operations

- [ ] Scripts are written in the project's primary language rather than a convenience dialect.
- [ ] Scripts accept arguments in the same style as their siblings.
- [ ] Scripts fail loudly with a non-zero exit rather than continuing on error.
- [ ] Anything runnable is reachable from the declared task surface.
- [ ] Website servers use a deterministic port outside tests so start and stop operations can target them reliably.
- [ ] Nothing depends on a path outside the repository without declaring it.

## Language and presentation

- [ ] British English throughout.
- [ ] ASCII hyphens only, with no em dashes or en dashes.
- [ ] One paragraph per line, with no mid-sentence breaks.
- [ ] Table rows stay within the print width, with long content moved to footnotes.
- [ ] Prose is direct, with no corporate filler.

## Automated verification

- [ ] The full verification task exits zero.
- [ ] `ki repo repair` completes without unresolved KI-managed projection repairs.
- [ ] `ki repo diag` reports every declared repository skill and its local projection healthy.
- [ ] `ki repo audit` reports `FAIL=0`.
- [ ] Formatter and linter report no findings.
- [ ] Type checking passes with no suppressed errors.
- [ ] Unused-code analysis reports no unused files, exports, or dependencies.
- [ ] Markdown lint passes.
- [ ] The lockfile is current and dependency versions are consistent across workspaces.
- [ ] Verification exercises representative real-scale data as well as minimal fixtures.
- [ ] Relevant live configuration and runtime state are compared with their declared sources without exposing private values.
- [ ] No gate was made to pass by widening an ignore list rather than fixing the cause.
- [ ] Every suppression comment added in this change names a reason.

## Closing the review

- [ ] Claims about the live state were verified against the live state, not recalled.
- [ ] Every finding is either fixed, recorded as a roadmap item, or explicitly accepted.
- [ ] The final judgement states what the repository is suitable for now and what claims it is not yet ready to make.
- [ ] Anything learned that generalises was routed back into the relevant skill or practice note.
- [ ] Anything this review needed to ask, and this checklist did not, has been added above.
