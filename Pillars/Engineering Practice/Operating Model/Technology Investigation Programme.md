# Technology Investigation Programme

## Purpose

The Technology Investigation Programme gives Knowledge Islands a finite, evidence-backed way to understand a technology before changing engineering practice or technology posture. It favours accountable learning and appropriate reuse over either automatic adoption or automatic internal reimplementation.

An investigation answers one practical question. A tech day may provide a convenient half-day timebox, but the programme creates no standing event or recurring schedule.

## Ownership

Techne owns the engineering question, comparison boundary, KI-specific evidence, applicability judgment, recommendation, uncertainty, review trigger and resulting [[Technology Radar]] posture. Primary external material belongs in Resources, observed experiment evidence remains with the governed work, and an accepted conclusion belongs in [[Engineering Practice]].

Other repositories retain their own responsibilities. A reusable experiment harness, adapter, skill or conformance mechanism belongs with its appropriate implementation owner only after evidence establishes a general need. A cross-repository hand-off uses the declared trade process and preserves receiver authority; an investigation does not transfer or reprioritise another repository's work.

## Investigation Lifecycle

### 1. Frame the Question

State the concrete need, intended users, constraints and consequential actions that remain excluded. Identify what evidence would change a decision and whether the candidate is being considered for direct use, configuration, adaptation, contribution or replacement.

### 2. Establish a Baseline

Use the simplest credible existing approach as a baseline. Define one common scenario and expected outputs so candidates solve the same problem rather than demonstrate unrelated strengths.

### 3. Inspect Current Sources

Read current primary documentation and authoritative licence material. Record source dates, exact versions, feature-tier boundaries and material claims. Treat documentation as claimed behaviour until it is observed.

### 4. Exercise the Scenario

Run the smallest safe, reproducible experiment that can answer the question. Include ordinary behaviour and at least one relevant failure, recovery or restart case. Use synthetic data and isolated destinations unless the approved work explicitly requires more.

### 5. Compare the Evidence

Compare capability, comprehension, testing, versioning, recovery, security, portability, operating effort, cost and exit cost. Separate a portable self-hosted core from optional or required provider-managed services. Record missing evidence and useful negative results rather than smoothing them into a favourable narrative.

### 6. Recommend Proportionately

Recommend direct use, configuration, thin adaptation, upstream contribution, custom implementation or no change against the original need. State limitations, uncertainty and a concrete review trigger. The recommendation may propose a Radar disposition, but investigation alone does not change the Radar.

### 7. Promote the Outcome

Retain reproducible sources and artefacts with appropriate provenance. Promote only accepted, reusable conclusions into Engineering Practice. Capture new implementation or cross-repository work separately instead of widening the investigation.

## Minimum Evidence

Every completed investigation retains:

- the question, boundary, baseline and common scenario;
- current primary sources with review dates;
- exact versions, configuration and reproducible artefacts;
- expected and observed normal, failure and recovery behaviour;
- licence, security, portability and provider-dependency implications;
- setup, maintenance, operating-cost and exit-cost assumptions;
- the recommendation, uncertainty and review trigger; and
- a clear distinction between vendor claims and direct observation.

Evidence should be proportionate to consequence. A documentation-only result may eliminate a candidate whose licence contradicts a hard requirement. A claim about durability, recovery or operator experience normally requires a hands-on experiment.

## Portfolio and Cadence

Each investigation enters the governed roadmap as its own finite record with its own boundary, verification and review. Similar candidates may share a bounded source or experiment setup, but a shared theme does not merge their outcomes or authority.

Techne maintains no standing investigation inbox or automatic cadence. New candidates enter when there is a concrete question and decision-useful boundary. A recurring housekeeping activity is justified only by observed repeated value and separately approved operating authority.

## Relationships

[[Operating Model]] governs how an investigation is framed, delivered and reviewed.

[[Technology Radar]] records the resulting current technology posture when accepted evidence justifies a change.

[[GDR-TECHNE-002-governing-technology-investigations|GDR-TECHNE-002]] records the ownership and evidence decision.

Return to [[Operating Model]].
