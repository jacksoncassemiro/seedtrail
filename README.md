# Seedtrail

**English** | [Português (Brasil)](README.pt-BR.md)

**From idea to delivery, with context preserved.** Initial version 0.1.0. A local method to investigate, define, build and evolve a solution with evidence, decisions and documentation accessible to people and assistants. No Spec Kit dependency or mandatory external services.

**Experimental project.** This is a personal experiment authored and reviewed with assistance from Codex (OpenAI), exploring continuity between ideas, decisions, implementation and knowledge. It is not an official OpenAI product or a framework validated with real teams. Reported checks have limited scope; review the procedures and scripts before adoption.

Comparisons with other methods were exploratory exercises using synthetic scenarios and AI reviewers. They do not establish general superiority or equivalence, or independent validation. Seedtrail remains an experiment rather than a recommendation backed by real-team results.

## Understand before starting

Start with [where to read features and changes](docs/en/FEATURE_DOCUMENTATION.md). The [usage guide](docs/en/GUIDE.md) explains setup; [organization](docs/en/process/ORGANIZATION.md) is the destination reference. For the utility itself see [architecture/diagrams](docs/en/ARCHITECTURE.md).

An instance's human entry is **product README → docs/product/README.md → responsible source**. Idea, brand, behavior and architecture have different content forms. Work IDs preserve changes/provenance; current sources describe the solution. .kit contains method/library; .agents contains 11 unique English procedures. Deliverables follow configured language, Portuguese by default.

```text
your-project/
├── README.md, AGENTS.md       purpose/usage and assistant routing
├── docs/product/README.md    where to find current definitions
├── docs/product/...          subject sources and work by change
├── .kit/                     configuration, supporting procedures and models
└── .agents/skills/           portable skills distributed with the instance
```

Documentation has two parts: **current product**, with feature pages and shared sources; **research/changes**, with intent, plans, execution and proofs. Each feature’s short history links its originating changes.

## Initialize a directory

PowerShell 7.2+, from this directory:

```powershell
& ./scripts/init-project.ps1 -Destination ../my-product -Name 'My idea' -Language en-US -ResearchMode desk
```

Destination must be new. Lean setup creates context, map and library; it does not perform research/development or materialize every stage. Other entries: -WorkType feature, fix, design, architecture or research. For an existing repository without an instance, follow [manual adoption](docs/en/GUIDE.md#use-an-existing-repository-without-installing-an-instance), retaining its sources/conventions; initialization does not merge directories.

Ask the assistant: “Read AGENTS.md, the map and relevant sources; answer the next question, challenge assumptions and save useful results in the configured language”. Open the instance as a project or provide its path in the current chat. [Workflows](docs/en/process/WORKFLOWS.md) and [cycles](docs/en/process/WORK_CYCLES.md) explain helpers, guided/continuous execution, stopping and resumption. No daemon or automatic publication.

## References, maintenance and limits

[Methods](docs/en/process/METHODS.md) distinguishes existing patterns and local choices. [Review](docs/en/KIT_REVIEW.md), [reference comparison](docs/en/REFERENCE_REVIEW.md), [language](docs/en/LANGUAGE.md) and [full index](docs/en/README.md) cover scope/limits. [Naming review](docs/en/KIT_REVIEW.md#utility-name) records choice/public screening.

Helpers tested on Windows/PowerShell 7.6.5; Linux/macOS and another-person handoff remain unobserved. [Spec Kit comparison](docs/en/USAGE_MODES.md) does not promise equivalence. Scripts check structure/state/hash, not decision quality, semantics or market evidence. Runtime/rendering/web depend on the work; the framework requires no Python/Node/MCP.

[MIT](LICENSE), [credits](docs/en/CREDITS.md), [contribution](CONTRIBUTING.md), [security](SECURITY.md) and [changelog](docs/en/CHANGELOG.md). Distribute this directory as an independent repository with license/credits, excluding instance/client data. No upstream executable framework is bundled.

```powershell
& ./scripts/check-docs.ps1
& ./tests/test-kit.ps1
& ./tests/test-docs.ps1
```

[Use and reuse scenarios](docs/en/USE_CASES.md) cover the complete journey, independent procedures, pauses, changed sources, legacy projects and another delivery of the same feature.
