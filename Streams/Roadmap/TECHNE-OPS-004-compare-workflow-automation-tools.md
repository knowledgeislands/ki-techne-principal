---
note_type: stream-proposal
id: TECHNE-OPS-004
area: OPS
title: Compare workflow automation tools
theme: operational-tooling
horizon: next
status: ready
priority: medium
dependencies: []
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-14T02:20:28Z
updated_at: 2026-09-15T13:37:00Z
---

# Compare Workflow Automation Tools

## Goal

Determine whether n8n or Node-RED can simplify bounded Knowledge Islands workflows, using the same synthetic problem and a small scripted baseline to produce an evidence-backed role-specific recommendation.

## Context

n8n and Node-RED both provide visual workflow construction but have materially different licensing, deployment and operational models. n8n is source-available under its Sustainable Use Licence and its free Community edition omits several collaboration and governance features. Node-RED is Apache-2.0, supports Git-backed Projects and configurable persistent context, and requires deliberate editor security.

This investigation applies the method established by [[Technology Investigation Programme]]. It tests behaviour rather than treating a visible flow diagram as proof of durable execution or accountable approval.

## Boundary

Do not adopt a platform, connect production accounts, use credentials or private data, call a model, incur paid-service cost, open a public listener, deploy a cluster, or turn either product into the Techne Fabric controller. Run only pinned local packages in ephemeral loopback-only directories with synthetic fixtures.

Do not modify [[Technology Radar]] in this item. Produce an evidence-backed proposed disposition for later acceptance.

## Current state

Current official documentation has been reviewed, but no common scenario has been executed. Local Node.js is available; Docker and a local Kubernetes cluster are not prerequisites for this bounded comparison.

## Steps

- [ ] Freeze current versions, source dates, licence evidence and the shared evidence rubric.
- [ ] Implement one scripted baseline for a source-intake fixture: validate, transform, call a stubbed enrichment service, pause for approval and write once to an isolated destination.
- [ ] Implement equivalent pinned n8n and Node-RED flows with reproducible export and launch instructions.
- [ ] Exercise duplicate delivery, one downstream 503 and retry, restart while approval is pending, rejection with no write, and output idempotency.
- [ ] Compare understanding, changeability, tests, versioning, logs, recovery, credential model, deployment, licence, portability, operating effort, cost and exit cost.
- [ ] Publish dated evidence and a canonical evaluation stating useful roles, limitations, uncertainty and proposed Radar disposition.

## Files touched

- `-/TECHNE-OPS-004-workflow-automation-comparison/README.md`
- `-/TECHNE-OPS-004-workflow-automation-comparison/package.json`
- `-/TECHNE-OPS-004-workflow-automation-comparison/package-lock.json`
- `-/TECHNE-OPS-004-workflow-automation-comparison/fixtures/source.json`
- `-/TECHNE-OPS-004-workflow-automation-comparison/baseline/`
- `-/TECHNE-OPS-004-workflow-automation-comparison/n8n/`
- `-/TECHNE-OPS-004-workflow-automation-comparison/node-red/`
- `-/TECHNE-OPS-004-workflow-automation-comparison/results/comparison.json`
- `Resources/Workflow Automation Tools.md`
- `Resources/Resources.md`
- `Pillars/Engineering Practice/Technology/Workflow Automation Evaluation.md`
- `Pillars/Engineering Practice/Technology/Technology.md`
- `Streams/Roadmap/TECHNE-OPS-004-compare-workflow-automation-tools.md`

## Verify

- The exact experiment command completes locally with outbound sockets disabled after dependency installation.
- All three lanes consume the same fixture and produce the same accepted output.
- Duplicate and resumed approval paths produce exactly one side effect; rejection produces none.
- The failure case records retry and recovery behaviour without contacting an external service.
- Exported flows, package locks, exact versions and dated results are retained.
- `ki repo audit --skill ki-authoring --repo .`, `ki repo audit --skill ki-repo-kb-streams --repo .`, `ki repo audit --skill ki-repo-kb --repo .`, and `git diff --check` pass.

## Dependencies / blocks

There are no delivery dependencies. The programme item should run first in a shared batch so this comparison can use its settled evidence vocabulary, but this plan remains executable if that item stops.

## Delegation

One isolated worker may own the experiment directory and factual source note. The coordinator owns canonical recommendation language, lifecycle state and any interaction with the shared Technology index.

## Documentation impact

### Decision Records

No Decision Record is required because the item evaluates candidates without adopting one.

### Specifications

The retained fixture, expected output and failure cases form the experiment contract rather than a production specification.

### Guides

The experiment README must give exact reproduction and cleanup instructions.

### Roadmap

Any integration, adoption or reusable adapter becomes a separately reviewed follow-up. A useful negative result completes this item.

## Discussion

### Primary source entry points

- [n8n licence](https://github.com/n8n-io/n8n/blob/master/LICENSE.md)
- [n8n Community edition features](https://docs.n8n.io/deploy/host-n8n/community-edition-features.md)
- [n8n queue mode](https://docs.n8n.io/deploy/host-n8n/configure-n8n/scaling/enable-queue-mode.md)
- [n8n Wait node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.wait/)
- [Node-RED licence](https://nodered.org/about/license/)
- [Node-RED Projects](https://nodered.org/docs/user-guide/projects/)
- [Node-RED context storage](https://nodered.org/docs/user-guide/context)
- [Securing Node-RED](https://nodered.org/docs/user-guide/runtime/securing-node-red)

### Interpretation to test

Node-RED begins with the cleaner openness and portability fit. n8n may offer stronger built-in durable-wait ergonomics, but queue operation adds Redis and a database and some governance features require paid editions. The experiment must confirm which differences matter for the bounded KI scenario.
