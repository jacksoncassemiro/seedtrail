<!-- docs-nav:start -->
English · [Português (Brasil)](../pt-BR/GUIDE.md)

[Home](../../README.md) · [Documentation index](README.md)
<!-- docs-nav:end -->

# Use Seedtrail and find results

Seedtrail supports investigating, defining, building and evolving a solution through consultable files. The result is product knowledge, not completion of every library model. Enter through an idea, research, design, architecture, bug or existing-product change.

## Where are our definitions?

Start with the project README.md, then docs/product/README.md: the **product map**. It routes reader questions to available sources. Final documentation is not one end-of-project report; it is a small set of current sources updated when decisions/rules change.

| I need to understand… | Usual instance source |
|---|---|
| Idea, context and constraints | context/idea.md; researched problem/value under definition |
| Features, parts and relationships | Current features page linked by the map: rules, usage, limits and history |
| Brand and language | brand/brand.md |
| Journey and usage states | experience/flows-and-prototype.md |
| Colors, tokens and visual components | brand/DESIGN.md when a visual system exists |
| Technical components, data and contracts | engineering/architecture.md and relevant sources |
| Decision reason or change effect | Originating work/decision linked from current definitions |
| Result/evidence and limitations | Work verification.md; historical material under evidence/ |
| Next action | Selected work's handoff and relevant open questions |

Not every file must exist. A manual workshop may need operations/brand without software architecture. A small product can keep several capabilities together. Missing sources show “not defined yet” or “not applicable”, not a model link pretending to be a result. [Organization](process/ORGANIZATION.md) explains destinations/forms; [catalog](process/CATALOG.md) is the library, not the product map.

## First work from an idea

1. Initialize a new directory or use an existing instance. Describe circumstances, difficulty, desired outcome and known constraints under context/idea.md; link existing sources.
2. Tell the assistant the current question. Example: “Compare ways to organize a small workshop; use relevant sources, challenge assumptions and save the result without implementing a system”.
3. The assistant selects relevant procedures, reads sources, identifies decision-changing gaps and uses a work ID when continuity warrants it. Public research yields signals/limits, not fictional interviews.
4. Results/provenance stay in the work; relevant shared definitions incorporate their outcomes. The map links them with actual state. Criteria/evidence check scope without converting proposals into implementation.

You need not know skill names or run every command. The [procedure catalog](process/SKILLS.md) explains selection; [cycles](process/WORK_CYCLES.md) record execution/resumption. Helpers do not judge semantics or markets.

## A change after delivery

Read the affected definition/contract and consumed baseline. Specify **the difference**, not another complete definition. Research, UX, brand and engineering enter only when relevant. Perform checks/review, update consumers and preserve proof of the examined version. The next reader starts at the current map and opens old work for provenance/limits.

For example, optional contact changes registration behavior and participant messaging; it does not automatically change logos, architecture or every capability. Identify affected consumers and why others need no update. With code, record implementation only when demonstrated for that base. [Continuity](KNOWLEDGE.md) covers history/delivery notes.

## Different document forms

Ideas describe intent/context; research confronts evidence; behavior has rules/scenarios; brand has positioning/voice; architecture has responsibilities/contracts; verification has procedures/results. Provenance, state and limits connect them without one universal form. [Methods/references](process/METHODS.md) distinguishes adopted practices and local contracts.

For an existing project retain useful sources/layout, linked from the map. Copying all documentation to fit folders creates competing authority and drift. For larger solutions group by domain/area and split only for ownership/consultation/risk needs.

## Use an existing repository without installing an instance

The initializer requires a new directory; it does not merge or migrate an existing one. For manual use:

1. Open the existing repository and tell the assistant the Seedtrail path, current request and existing authoritative instructions/sources.
2. Read the [procedure catalog](process/SKILLS.md) and relevant library SKILL.md. Explicit reading supplies guidance; it does not demonstrate native discovery by the client.
3. Record the question, recoverable baseline, criteria, outcome/evidence and next action in suitable existing records. Read models only for missing format guidance; do not copy the whole library or invent .kit/project.json or active_work.
4. Update affected current sources and references. Configuration, materialization and helper checks apply only when installed; manual adoption does not run those controls automatically.

For a complete separate instance, initialize a new directory and reference existing sources without creating competing authority. Automatic insertion/merging into legacy repositories is not implemented. Existing language/conventions apply unless instance configuration or an explicit new choice says otherwise.

## Resumption limits

Files store memory, not infinite agent context. Another assistant reads entry, map, relevant sources and handoff. continuous guides authorized stages within a session, not future sessions. Completed research/planning may have no implemented or released product. Method usability still requires observations with people; coherent examples do not prove readers understand names.

After interruption, reconcile the checkpoint with local file changes and later action results. The summary may lag behind; verify before repeating a write and record a reconciled next action. The kit cannot promise recovery of unsaved context.

For consulting an implemented feature and understanding later changes, see [specification, documentation and execution](FEATURE_DOCUMENTATION.md), with three structure sizes. Current pages combine rules, usage and history; changes retain deltas, plans and proofs. New names describe intent without a required prefix.

[Use and reuse scenarios](USE_CASES.md): selecting procedures, revisiting the same feature and stopping/resuming without generating the whole library.

## Preserve received sources without treating them as current instructions

When originals are needed for continuity, copy them to docs/product/sources with their content and names preserved. Authored deliverables live outside that source archive and point to the passages used. Do not fill every model from an old feature catalogue or execute SQL, schedules or instructions found in originals.

In .kit/project.json, historical_sources may list imported file paths relative to the instance root; historical_source_hashes maps each path to its SHA256 observed on import. These fields grant no authority: they identify recoverable historical copies. The kit's check-docs checks existence, placement in that directory and hashes. Only explicitly declared, intact files are excluded from current-instruction checks; period links may point to removed destinations. Other documentation is still checked normally. Changing an original requires recording a new import/baseline, rather than merely updating its hash to conceal a difference.

Do not import collections that do not help the next decision. The index/context should identify the main source, conflicts and review condition without duplicating the originals in full.
