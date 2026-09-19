---
note_type: stream-proposal
id: TECHNE-OPS-008
area: OPS
title: Establish ki-techne-tools monorepo island
aliases:
  - Techne Tools Monorepo Proposal
theme: operational-tooling
horizon: next
status: done
priority: high
dependencies: []
blocks: [TECHNE-OPS-007]
blocked_by: []
baseline_ref: 0299112334c3ad1d4963797f0ee6f3b3cbd49adf
created_at: 2026-09-18T07:56:58Z
updated_at: 2026-09-19T10:48:28Z
---

# Establish ki-techne-tools Monorepo Island

## Goal

Establish `knowledgeislands/ki-techne-tools` as the implementation-owning monorepo island for Techne controllers, command-line interfaces, bootstrap tooling, deployment resources, provider adapters and other installable artefacts.

## Context

The `TECHNE-OPS-007` proof has crossed from architecture and evidence into an executable controller, Kubernetes resources, CloudFormation templates and secret-bootstrap behaviour. Keeping those artefacts in Techne Principal would turn a canonical engineering knowledge base into a product repository with release, dependency and operational lifecycles it explicitly does not own.

Arcadia Principal remains the canonical home for Knowledge Islands philosophy and model and explicitly does not mandate tooling implementation. Techne Principal translates that philosophy into engineering practice and owns architectural roles, boundaries, decisions and proof evidence. [[Engineering Estate]] and [[Techne Fabric Execution Contract]] deliberately leave the personal-controller and execution-fabric implementation owner unassigned; this proposal supplies that owner without transferring architectural authority.

Multiple small implementation repositories would separate controller, CLI, provider and deployment changes that share one release and integration boundary. A monorepo provides one root toolchain, one integration test surface and one governed product roadmap while allowing independently installable artefacts and packages.

## Boundary

Keep `ki-arcadia-principal` and `ki-techne-principal` as knowledge-base islands. Do not move canonical principles, architecture, decisions or sanitised proof evidence into the implementation repository.

Create one public sibling repository named `ki-techne-tools` under the `knowledgeislands` organisation only after its repository identity, licence, package manager, release ownership and initial workspace shape are approved. Prefer a Turborepo-compatible workspace if the selected implementation languages and packaging model justify it; do not adopt Turborepo merely as a name for an otherwise undefined monorepo.

Enforce root-owned dependency installation and prohibit package-local installation or ungoverned nested `node_modules` trees. Keep normative portable contracts in `ki-specifications`; implementation types and clients may consume or realise them without becoming their authority.

Retain the existing OPS-007 controller EC2 stack while repository work proceeds. Do not destroy, recreate or expand the live infrastructure as part of repository establishment. Pause bot-secret injection and live controller deployment until the executable source has an approved implementation home and the migration path preserves the already-verified checksums and proof baseline.

Do not silently absorb `tools-ki`, `tools-mgit`, Harness or unrelated engineering products. The new island owns Techne execution products and their installable artefacts, not every Knowledge Islands tool.

## Current state

`knowledgeislands/ki-techne-tools` is published through commit `4574998` on `origin/main`. It carries the KI repository contract, MIT licence, Bun `1.4.1` root workspace, Turborepo `2.10.13`, controller and bootstrap workspaces, Kubernetes resources, AWS adapters, provenance and operating guidance. Root checks reject package-local `node_modules` and lockfiles.

GitHub reports the expected description, topics, Issues, disabled Projects and Wiki, squash-only merges, automatic branch deletion, update-branch support, Dependabot security updates, secret scanning with push protection and MIT licence.

Reciprocal trade declarations pass locally. Agora member consent is published in `ki-techne-tools`, and the Agora home declaration commit `47b863df3cd6f4ceaf293fbfffa6b1107c23356e` is present on the Harness `origin/main`. Fresh `ki-all` and `ki-fnd` Agora audits report zero findings.

The retained controller remains instance `i-09b1ed39bc4735eda` in AWS account `655383751458`, region `eu-west-1`. On 19 September 2026, the package was re-uploaded from `ki-techne-tools`; the remote controller source matched SHA-256 `4efbca43184429c22265de6f0cb255c2437667f8599dfe555742752020a2f5c5`. K3s reported Secret encryption enabled, rotation stage `reencrypt_finished` and matching server hashes. The `techne-controller` namespace still contained no Secret or Deployment before OPS-007 resumed.

## Steps

- [x] Record the Techne architectural decision assigning the personal-controller and execution-fabric implementation role to `ki-techne-tools` without transferring Techne Principal's architectural authority.
- [x] Bootstrap the local repository with the universal KI repository contract, MIT licence, local-roadmap declaration, root engineering controls, directional working areas and repository orientation.
- [x] Declare reciprocal Agora and trade relationships with Techne Principal and the relevant KI islands without granting cross-repository write authority.
- [x] Configure GitHub description, topics, squash-only merges, linear history, automatic branch deletion, Projects, security and dependency settings to the KI repository contract.
- [x] Establish one Bun `1.4.1` root workspace and Turborepo task graph with a root-only installation rule and a check that rejects nested `node_modules` or lockfiles.
- [x] Create the initial product structure for the controller application, bootstrap tooling, Kubernetes deployment resources, AWS infrastructure adapters and end-to-end proof fixtures without speculative empty packages.
- [x] Migrate the executable OPS-007 source, tests, manifests, CloudFormation and operational scripts with source-commit provenance; retain sanitised results and canonical learning in Techne Principal.
- [x] Run the migrated offline test suite and both AWS CloudFormation validations from `ki-techne-tools`, confirming behaviour and source checksums before changing the live controller.
- [x] Enable K3s Secret encryption at rest through versioned infrastructure and a verified live migration before any Telegram Secret is admitted.
- [x] Re-upload the controller package from `ki-techne-tools`, prove the non-retention bootstrap route and resume OPS-007 without recreating the retained EC2 stack.
- [x] Replace Techne Principal's temporary executable tree with retained evidence, provenance and links only after the new repository commit and live checksum verification succeed.

## Files touched

- `Admin/Governance/Decisions/ADR-TECHNE-003-techne-tools-implementation-ownership.md`
- `Admin/Governance/Decisions/Decisions.md`
- `Pillars/Engineering Practice/Architecture/Engineering Estate.md`
- `Pillars/Engineering Practice/Architecture/Techne Fabric Execution Contract.md`
- `.ki.toml`
- `Streams/Roadmap/TECHNE-OPS-007-define-long-running-controller-and-registered-execution-targets.md`
- `Streams/Roadmap/TECHNE-OPS-008-establish-ki-techne-tools-monorepo-island.md`
- `-/TECHNE-OPS-007-kubernetes-controller-proof/`
- `../ki-techne-tools/.ki.toml`
- `../ki-techne-tools/README.md`
- `../ki-techne-tools/LICENSE`
- `../ki-techne-tools/package.json`
- `../ki-techne-tools/turbo.json`
- `../ki-techne-tools/apps/controller/`
- `../ki-techne-tools/packages/bootstrap/`
- `../ki-techne-tools/deploy/kubernetes/`
- `../ki-techne-tools/infra/aws/`
- `../ki-techne-tools/docs/roadmap/`

## Verify

- Audit Techne Principal with `ki-authoring`, `ki-decision-records`, `ki-repo-kb-streams`, `ki-repo-kb`, `ki-agora` and `ki-trades`.
- Audit `ki-techne-tools` with `ki-repo`, `ki-authoring`, `ki-git`, `ki-work-roadmap`, `ki-agora` and `ki-trades`; retain the explicit non-TypeScript `coverage-engineering = false` boundary and verify its Python/shell workspace through `bun run test`.
- Confirm GitHub repository settings and public security features match the declared contract.
- Run the root workspace checks without creating a package-local dependency directory or lockfile.
- Run the migrated controller unit tests, shell checks, Kubernetes manifest validation and CloudFormation validation.
- Compare migrated controller and deployment-resource checksums with the approved OPS-007 source before any intentional path-only transformation.
- Confirm K3s reports Secret encryption enabled and re-encryption finished before creating the Telegram Secret.
- Confirm the retained controller instance, VPC and security group identities remain unchanged through migration.
- Confirm no credential value enters either repository, chat, shell history, SSM Run Command parameters or retained evidence.
- Run `git diff --check` and inspect the exact staged paths independently in both repositories.

## Dependencies / blocks

Repository identity, visibility and local checkout are available. Existing AWS and Telegram preflights remain valid, but OPS-007 live deployment waits for this item's repository migration and Secret-encryption gates. `TECHNE-OPS-008` therefore blocks continued implementation of `TECHNE-OPS-007` without requiring the retained controller stack to stop.

Creating and pushing the initial public repository history is approved. Any package publication, container publication, release, controller deployment or destructive cleanup remains outside repository-bootstrap authority until its named verification gate passes.

## Delegation

Keep repository ownership, cross-repository moves, Git commits and live-controller continuity in one coordinator lane. Do not delegate secret handling or live AWS mutation. Isolated checks may be delegated only if they require no credential and cannot race shared working trees.

## Documentation impact

The implementation-owner decision and two architecture notes change canonically through this proposal. The new repository README must explain its product boundary, relationship to Techne Principal, root-only workspace rule and entry points. OPS-007 retains proof evidence and links to the implementation source; no duplicate canonical architecture is created in the product repository.

## Review

### Delivered

From immutable baseline `0299112334c3ad1d4963797f0ee6f3b3cbd49adf`, established and published `knowledgeislands/ki-techne-tools` as the implementation-owning Techne monorepo, assigned that role through `ADR-TECHNE-003`, migrated the controller proof with provenance, published reciprocal Agora consent, verified the retained controller package, and retired the duplicate executable tree from Techne Principal while retaining sanitised evidence.

### Summary changes

- Added the KI repository contract, MIT licence, Bun/Turborepo root workspace, controller application, bootstrap package, Kubernetes resources, AWS adapters, operating guide, provenance and local roadmap in `ki-techne-tools`.
- Added reciprocal Techne Principal trade routes and `ki-all`/`ki-fnd` membership, with the Harness home declarations published separately.
- Recorded implementation ownership in Techne Principal architecture and decision records without transferring architectural authority.
- Re-uploaded the secret-free package to the retained controller, verified its source checksum and K3s Secret-encryption state, then replaced Techne Principal's temporary executable copy with provenance and its sanitised results area.
- Kept `ki-engineering` intentionally undeclared because Bun and Turborepo orchestrate Python and shell workspaces with no TypeScript surface; the explicit `coverage-engineering = false` repository check and root test gate preserve that boundary.

### Verification

- `bun run test` passed the root-only dependency-layout check, shell checks and 11 controller unit tests.
- `AWS_PROFILE=knowledge-islands-techne AWS_REGION=eu-west-1 bun run ki:aws:validate` validated both CloudFormation templates.
- GitHub reported the expected public identity, topics, MIT licence, squash-only merging, update-branch support, automatic branch deletion, Dependabot security updates, secret scanning and push protection.
- `ki repo audit` passed Techne Principal authoring, decision-record, Streams, KB, Agora and trade gates.
- `ki repo audit` passed Techne Tools repository, authoring, Git, roadmap, Agora and trade gates.
- Fresh `ki-all` and `ki-fnd` audits reported zero findings.
- SSM package upload completed successfully; the retained controller reported source SHA-256 `4efbca43184429c22265de6f0cb255c2437667f8599dfe555742752020a2f5c5`, Secret encryption enabled, rotation stage `reencrypt_finished` and matching server hashes.
- `git diff --check` passed in both repositories.

### Outstanding concerns

None within `TECHNE-OPS-008`. Telegram credential admission, controller deployment and local/remote execution proofs remain governed by `TECHNE-OPS-007`.

### Post-change review

The implementation boundary now matches the architectural decision: Techne Principal retains authority and evidence, while Techne Tools owns runnable artefacts and deployment operations. No credential entered Git, chat, an SSM command parameter or retained evidence. The retained EC2 controller stack was not recreated, and the work is ready for acceptance.

### Mini recap

`TECHNE-OPS-008` delivered the published monorepo island, migrated the controller implementation, verified its live package continuity and removed the duplicate implementation from the knowledge base. The declared checks pass, and subsequent live proof work returns to `TECHNE-OPS-007`.

## Done

Accepted by Kris Brown on 19 September 2026 through the explicit instruction to complete all recap actions, after review of the evidence committed at `e79488dbce0f3ab83cba5e25740112e581ce2c58`.

## Discussion

### Proposed product boundary

An initial repository may contain controller and CLI applications, shared controller and target packages, bootstrap and provider adapters, Kubernetes and cloud deployment resources, and end-to-end tests. Exact directories, language and package boundaries belong to planning and must follow actual release cohesion rather than a speculative package taxonomy.

### Existing proof migration

The executable OPS-007 package currently under `-/TECHNE-OPS-007-kubernetes-controller-proof/` is migration input, not the new repository's unquestioned production architecture. Preserve its dependency-free proof behaviour, security boundaries and tests while separating retained evidence from reusable implementation.

### Repository relationships

The new island should import engineering knowledge from Techne Principal, consume accepted portable contracts from `ki-specifications`, and export implementation evidence or work through governed trade routes. It should not acquire authority to edit either source directly merely because it implements their decisions.

### Promotion condition

Adopt this work only after confirming the repository identity, ownership boundary, initial workspace and package-install policy, the OPS-007 migration sequence, relationship declarations, verification gates and treatment of the retained controller stack.
