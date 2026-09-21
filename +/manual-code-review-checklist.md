---
note_type: pillars/note
created: 2026-09-20T00:00:00Z
updated: 2026-09-20T00:00:00Z
reviewed:
tags:
  - topic/engineering-practice
author: Mixed
---

# Manual Repository Review Checklist

## Purpose

This checklist captures the high-level judgement a person applies to each repository: whether it meets its needs and fulfils its place in the wider ecosystem. It moves from ecosystem fit and repository responsibility through architecture and implementation to detailed evidence and final disposition.

Each item is atomic and answerable yes or no. An item that needs a paragraph to answer is hiding a second item.

Items were derived from recurring review requests across the estate between August and September 2026. The checklist is a living record: when a review finds something this list did not ask for, add the question here.

## How to use it

Not every section applies to every repository. Start at repository purpose, work in order through each applicable section, and record why any section does not apply.

A failed item is a finding, not a blocker. Record it, decide whether it lands now or becomes a roadmap item, and move on.

Prefer deleting an item that never fires over keeping it out of completeness.

## Repository purpose

- [ ] The repository fulfils its delineated responsibility within the wider project ecosystem.

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

## Decision records and documentation

- [ ] Amend an existing decision record in place rather than creating a successor that merely clarifies or expands scope.
- [ ] Supersede a decision record only when the decision is genuinely reversed.
- [ ] Decision records describe the current state, consolidated, rather than accumulating history.
- [ ] A shared decision record is updated coherently in every repository that projects it.
- [ ] Documentation states the present state and not the journey to it.
- [ ] Every guide under `docs/guides/` lives in an explicit audience subdirectory, such as `user/`, `developer/`, or `agent/`.
- [ ] Every cross-reference resolves, and cites the record that is actually current.
- [ ] No document repeats content that another document owns; it links instead.
- [ ] The README positions the repository within the estate.
- [ ] Anything that could be a skill has been made one.
- [ ] Less is more, and comprehension is the goal.

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
- [ ] No gate was made to pass by widening an ignore list rather than fixing the cause.
- [ ] Every suppression comment added in this change names a reason.

## Closing the review

- [ ] Claims about the live state were verified against the live state, not recalled.
- [ ] Every finding is either fixed, recorded as a roadmap item, or explicitly accepted.
- [ ] Anything learned that generalises was routed back into the relevant skill or practice note.
- [ ] Anything this review needed to ask, and this checklist did not, has been added above.
