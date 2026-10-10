<!-- docs-nav:start -->
English · [Português (Brasil)](../../pt-BR/process/METHODS.md)

[Home](../../../README.md) · [Documentation index](../README.md)
<!-- docs-nav:end -->

Reading reference; operational source: `templates/.kit/METHODS.md`. This page is not an installed skill or an authored project deliverable.

# Lightweight artifact and change patterns

## Authoritative source and version

Each relevant delivery identifies its question, state, source/version, owner, result, unknowns and affected consumers in its source or responsible map. Create docs/product/context/artifact-register.md only when authority, origin or consumers remain ambiguous, such as a legacy import. Do not duplicate a sufficient map or require an empty register. Use stable IDs when they help relationships; extensive metadata is not required on every note.

Text language comes from .kit/project.json. Preserve tooling paths/keys when required. A “definitive” title is not proof of approval.

## Selected patterns

| Pattern | When | Application in the kit |
|---|---|---|
| Contextual TDD | Deterministic rules/contracts and fixes with relevant risk | Failure for expected cause → minimal implementation → pass → refactor; retain evidence. Justify an appropriate alternative; simple research/documents do not require code tests |
| Agile principles | Organize delivery and learning | Small increments, value/risk priority, limited capacity and direction review; Scrum is optional |
| SDD | Specify software changes before implementation | Outcome → spec → plan → tasks → code/verification, with proportional local contracts |
| Behavioral scenarios, BDD reference | Avoid vague criteria | Given context, when action/event, then observable result. Markdown is not an executable test without a harness |
| ADR | Technical decisions with material consequences | Context, alternatives, decision/status, consequences and review condition; record supersession |
| C4 | Explain software context/components | Context/container levels, components when needed; Mermaid is a representation, not formal C4 validation |
| Design tokens | Apply identity consistently | Semantic name, value, usage and version; check code translation and visual review |
| Change proposal with impact | New feature/fix/rule | Baseline → difference → impact → criteria → implementation/verification → current knowledge update |
| Evidence/experiment record | Discovery/business/UX | Source, context, limit, hypothesis, test and decision; distinguish opinions from results |
| Security and dependency management | Relevant access/data/infrastructure/code | Risks/controls, dependency sources/versions and verification; no presumed comprehensive audit |

Primary references: [SDD](https://github.github.io/spec-kit/quickstart.html), [Gherkin](https://cucumber.io/docs/gherkin/reference/), [ADRs](https://adr.github.io/), [C4](https://c4model.com/), [Design Tokens](https://www.designtokens.org/).

These are selective complements, not a mandatory framework bundle. SDD organizes engineering; it does not independently cover research, brand or acquisition. BDD is more than syntax; an ADR does not replace a spec.

## Design and review

Brief → flows/states → alternatives/prototype → visual direction/tokens → implementation → rendered review. Assess real content, accessibility, responsive behavior and relevant states. An approved image is not a finished feature; tokens do not describe all behavior.

## Transition criteria

A deliverable can be ready for research, discussion, prototype, specification or execution according to scope. Record observed versus proposed information and what blocks the next step. A checked list does not prove functionality.

For new features, separate current knowledge from change history. Completion examines the declared scope's result and updates affected documents without duplicating active specs. Documentary definition can close without code; implementation requires behavior verification against the relevant technical baseline. Neither establishes availability beyond the examined environment.

Before deriving a plan for an ambiguous rule, use examples that distinguish interpretations: bookings 09:00–10:00 and 10:00–11:00 share a boundary but not an interval; 09:30–10:30 conflicts. Record the rule, decisive examples and unresolved questions in the authoritative source. [Example Mapping](https://cucumber.io/docs/bdd/example-mapping/) inspires this discovery without requiring cards, Gherkin, another file or claiming human collaboration when only AI inspection occurred.

Examine sufficiency through the next consumer's question, beyond file existence: can engineering find baseline/contract/available dependencies? Can QA derive expected outcomes and relevant cases? Can a reader find definition, availability and next decision without reconstructing all history? Choose pertinent questions and record gaps in existing verification/convergence; correct the responsible source. [Diátaxis](https://diataxis.fr/quality/) informs consultation needs/quality without requiring copies per audience. AI inspection does not prove human comprehension.

Review docs/product/context/open-questions.md before the next delivery and at closure. Generated text does not close a question: record evidence/decision or deferral reasons. Use evidence-review.md when data determines a decision or conflicts.

## Updates and supersession

Updates do not overwrite project adaptations. Compare previous base, local state and new model when available; retain decisions/evidence and record conflicts. Check consumers of replaced files/rules: indexes, skills, AGENTS.md, handoff, specs and relevant verification. Keep one current source, identifying history and replacement. Record results/open issues in docs/product/evolution/decisions-and-changes.md before updating kit_version; equal versions do not imply identical content. State comparison limits when the previous base is missing. There is no automatic synchronization/migration.

Current organization: [organization](ORGANIZATION.md), [catalog](CATALOG.md) and [cycles](WORK_CYCLES.md). Foundations, library and identified work have different roles. Review coverage/conflicts before implementation; compare results with intent afterward. References: [TDD](https://martinfowler.com/bliki/TestDrivenDevelopment.html), [agile principles](https://agilemanifesto.org/iso/ptbr/principles.html).

## Diagnosis, choices and simplification

For technical failures, record expected/observed behavior, reproduction and environment. Inspect relevant changes and find where the flow diverges. Form an evidence-backed hypothesis and run the smallest experiment distinguishing causes. If it fails, revise the hypothesis rather than accumulating speculative fixes. Correct the demonstrated cause and verify relevant reproduction/regression. Urgent mitigation may precede full diagnosis: state its scope and keep investigation open. Do not expose secrets through instrumentation.

At convergence, identify material assistant-introduced choices: scope, data, storage, dependencies, contracts, permissions or costs. Record grounds, consequence, reversibility and authority. Delegated choices are not personal user approval; conflicting choices need correction or explicit resolution. This complements inspection/tests rather than replacing them.

Before adding abstractions, files or dependencies, check current need and available code/platform solutions. Prefer the lowest-maintenance alternative meeting criteria. Do not measure quality by line count or suppress explicit requirements, readability, accessibility or data-loss protection. Reuse requires suitability and license checks.

For measurable optimization, define baseline, metric, evaluation set and limit before rounds. Compare under equivalent conditions and retain useful attempts. Passing a correctness test does not demonstrate improvement. Market research without an experiment does not receive an invented success metric.

## Written deliverable review

Before delivery/update, check states, dates, names, versions, paths and links against actual results. Remove conversational residue and repeated conclusions without added information. Explain decision, evidence, consequence and gaps concretely. Style editing preserves facts, citations, IDs, code, schema and claim strength; it cannot turn a hypothesis into evidence or a recommendation into approval. Missing data remains unknown. Apply this to the relevant document without requiring another report.

Selective inspirations, with procedures authored for this kit: [BMad, intent-based depth](https://docs.bmad-method.org/plan/choose-a-planning-path/), [dzhng, choice audit](https://github.com/dzhng/skills/tree/main/skills/engineering/audit-choices), [Superpowers, diagnosis](https://github.com/obra/superpowers/tree/main/skills/systematic-debugging), [Humanizer](https://github.com/blader/humanizer) and [Ponytail](https://github.com/DietrichGebert/ponytail). Their hooks, agents and persistent rules are not loaded.

## Existing references and local choices

There is no universal standard for every folder, document and execution behavior in this kit. Physical layout, JSON schema, work identification, criteria and helpers are local contracts. Markdown/diagrams do not establish ISO, Scrum, C4, arc42 or whole-framework compliance.

| Primary reference | Adopted practice | Adoption limit |
|---|---|---|
| [Docs as Code](https://www.writethedocs.org/guide/docs-as-code/) | Versionable documentation, review alongside change and relevant checks | Git/PR/CI depend on the project; file editing does not install governance |
| [Diátaxis](https://diataxis.fr/) | Write for learning, doing, reference or understanding needs | Guides reader documentation, not mandatory four-folder research/business/brand structure |
| [OpenSpec](https://github.com/Fission-AI/OpenSpec/blob/main/docs/concepts.md) and [Spec Kit](https://github.github.io/spec-kit/reference/core.html) | Distinguish current rules, changes, specification and verifiable execution | No full layout/command import or automatic synchronization claim |
| [ADR](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions.html) | Preserve significant decision reasons and supersession | Avoid duplicate decisions and files for trivial choices |
| [arc42](https://docs.arc42.org/section-5/) and [C4](https://c4model.com/abstractions) | Relevant views and selective technical decomposition | Do not use them to mandate product-capability or brand hierarchies |
| [Design Council](https://www.designcouncil.org.uk/resources/the-double-diamond/) | Explore problems/alternatives and revisit the bet | Discovery is not linear checkbox completion; public research is not observed usage |

References examined on 2026-10-06. Our choice combines subject-based addresses, question-based entry and work by change. It is an assessed adaptation, not a formal standard already validated for this utility. Link useful existing project sources rather than copying them to fit the kit.

## Vocabulary for consultation and execution

Prefer recognizable terms and explain their role. [Spec Kit](https://github.github.io/spec-kit/reference/core.html), [OpenSpec](https://github.com/Fission-AI/OpenSpec/blob/main/docs/concepts.md) and [BuilderOS](https://github.com/BuildGreatProducts/builder-os) share some vocabulary but use different layouts/responsibilities. They do not establish one market-wide standard.

| Term | Meaning in this kit | Location, as needed |
|---|---|---|
| Product vision | Purpose, candidate audience, outcome and constraints; hypotheses have explicit status | Context and problem/value definition |
| Requirement | Required behavior or quality with a verifiable criterion | Current definition and change spec |
| Feature | Behavior/outcome offered by the solution; capability can be a synonym according to domain | Current source and consultation chapter; not a work ID |
| Specification, spec | Behavior/requirements contract; a change spec describes the delta from a base | Responsible current source and/or bounded spec; not a manual or complete technical plan |
| PRD / Product Requirements Document | Organized view of product requirements when coordination warrants it | Sections or links to existing sources; no additional PRD duplicating everything |
| Change | Bounded alteration affecting one or several features | Identified work with origin/base/result |
| Task | Verifiable step in executing a change | Work tasks, not a folder/spec per file |
| Technical design | How requirements are realized, including alternatives/contracts/reasons | Plan/architecture. DESIGN.md under brand is a visual contract, not technical design |
| ADR / Architecture Decision Record | Material architecture decision with context, alternatives and consequences | Responsible decision or existing ADR; do not duplicate the same decision |
| Baseline | Recoverable version used to assess the change | Relevant commit/tag/snapshot; name/date alone may be insufficient |
| Roadmap | Prioritized intended outcomes/dependencies within the needed horizon | Delivery planning; change tasks have their own source |
| Guide/manual, reference and history | Current use/consultation, contracts and past origin/results answer different questions | Map routes to responsible content for the reader |

“Work” is the broad container for a change, research or decision, not another mandatory product entity. WRK is an optional prefix from earlier examples, not a standard. Prefer descriptive stable new IDs (such as document-item-removal), retaining existing history. Epic/story/module levels are not imposed: use them when coordination requires, without a duplicate backlog. Do not rename files merely to imitate another framework.

BuilderOS connects vision, PRD, roadmap and skills through documents; Spec Kit groups spec/plan/tasks by feature; OpenSpec separates current specs and changes. We adopt responsibilities without installing executors or importing rigid taxonomy. For Seedtrail, reader/question and content authority determine physical separation.
