---
note_type: stream-proposal
id: TECHNE-OPS-008
area: OPS
title: Establish ki-techne-tools monorepo island
aliases:
  - Techne Tools Monorepo Proposal
theme: operational-tooling
horizon: next
status: ready
priority: high
dependencies: []
blocks: [TECHNE-OPS-007]
blocked_by: []
baseline_ref: 0299112334c3ad1d4963797f0ee6f3b3cbd49adf
created_at: 2026-09-18T07:56:58Z
updated_at: 2026-09-18T08:01:08Z
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

## Discussion

### Proposed product boundary

An initial repository may contain controller and CLI applications, shared controller and target packages, bootstrap and provider adapters, Kubernetes and cloud deployment resources, and end-to-end tests. Exact directories, language and package boundaries belong to planning and must follow actual release cohesion rather than a speculative package taxonomy.

### Existing proof migration

The executable OPS-007 package currently under `-/TECHNE-OPS-007-kubernetes-controller-proof/` is migration input, not the new repository's unquestioned production architecture. Preserve its dependency-free proof behaviour, security boundaries and tests while separating retained evidence from reusable implementation.

### Repository relationships

The new island should import engineering knowledge from Techne Principal, consume accepted portable contracts from `ki-specifications`, and export implementation evidence or work through governed trade routes. It should not acquire authority to edit either source directly merely because it implements their decisions.

### Promotion condition

Adopt this work only after confirming the repository identity, ownership boundary, initial workspace and package-install policy, the OPS-007 migration sequence, relationship declarations, verification gates and treatment of the retained controller stack.

## Current state

`knowledgeislands/ki-techne-tools` exists as a public GitHub repository with `main` and one initial README commit. A clean local sibling checkout exists at `../ki-techne-tools`. The repository has no licence, description, `.ki.toml`, workspace, package manifest or release contract. GitHub Issues are enabled, Wiki is disabled and Projects remains enabled pending repository conformance.

The OPS-007 controller implementation remains under Techne Principal's temporary `-/` area. Its retained controller stack is running in AWS account `655383751458`, region `eu-west-1`, on instance `i-09b1ed39bc4735eda`. K3s is ready and the secret-free proof package is uploaded, but no Telegram Secret or controller Deployment has been created.

The Knowledge Islands TypeScript repositories use Bun `1.4.1`. This repository will use Bun workspaces at the root and Turborepo for task orchestration. Packages may carry manifests but must not run package-local installation, create package-local lockfiles or retain nested dependency trees.

## Steps

- [ ] Record the Techne architectural decision assigning the personal-controller and execution-fabric implementation role to `ki-techne-tools` without transferring Techne Principal's architectural authority.
- [ ] Bootstrap the local repository with the universal KI repository contract, MIT licence, engineering and local-roadmap declarations, directional working areas and repository orientation.
- [ ] Declare reciprocal Agora and trade relationships with Techne Principal and the relevant KI islands without granting cross-repository write authority.
- [ ] Configure GitHub description, topics, squash-only merges, linear history, automatic branch deletion, Projects, security and dependency settings to the KI repository contract.
- [ ] Establish one Bun `1.4.1` root workspace and Turborepo task graph with a root-only installation rule and a check that rejects nested `node_modules` or lockfiles.
- [ ] Create the initial product structure for the controller application, bootstrap tooling, Kubernetes deployment resources, AWS infrastructure adapters and end-to-end proof fixtures without speculative empty packages.
- [ ] Migrate the executable OPS-007 source, tests, manifests, CloudFormation and operational scripts with source-commit provenance; retain sanitised results and canonical learning in Techne Principal.
- [ ] Run the migrated offline test suite and both AWS CloudFormation validations from `ki-techne-tools`, confirming behaviour and source checksums before changing the live controller.
- [ ] Enable K3s Secret encryption at rest through versioned infrastructure and a verified live migration before any Telegram Secret is admitted.
- [ ] Re-upload the controller package from `ki-techne-tools`, prove the non-retention bootstrap route and resume OPS-007 without recreating the retained EC2 stack.
- [ ] Replace Techne Principal's temporary executable tree with retained evidence, provenance and links only after the new repository commit and live checksum verification succeed.

## Files touched

- `Admin/Governance/Decisions/ADR-TECHNE-003-assign-techne-tools-implementation-ownership.md`
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
- `../ki-techne-tools/tests/e2e/`
- `../ki-techne-tools/docs/roadmap/`

## Verify

- Audit Techne Principal with `ki-authoring`, `ki-decision-records`, `ki-repo-kb-streams`, `ki-repo-kb`, `ki-agora` and `ki-trades`.
- Audit `ki-techne-tools` with `ki-repo`, `ki-authoring`, `ki-git`, `ki-engineering`, `ki-work-roadmap`, `ki-agora` and `ki-trades`.
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
