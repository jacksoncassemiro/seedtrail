<!-- docs-nav:start -->
English · [Português (Brasil)](../../../pt-BR/templates/engineering/structure-and-development.md)

[Home](../../../../README.md) · [Documentation index](../../README.md)
<!-- docs-nav:end -->

Reading reference; operational source: `templates/docs/product/engineering/structure-and-development.md`. This page is not an installed skill or an authored project deliverable.

# Project structure and engineering work

Status: to author after defining bet scope and stack.

Define repositories, modules/responsibilities, documentation/code/test organization, configuration/dependency conventions, local/test/release environments and a verifiable execution path.

Define configuration/secrets without credentials in guides; applicable data/migration strategy; change review, CI, versioning/releases and document updates. Do not add tools/processes without reasons.

Explain architecture (responsibilities/contracts), folders (code organization) and management (sequence/people/capacity). Directory trees do not prove good architecture.

## Collaboration and an existing team method

Inspect and respect team conventions before proposing changes. [Scrum](https://scrumguides.org/scrum-guide.html) organizes management responsibilities/events; [Kanban](https://kanbanguides.org/) guides flow. Neither is a branching strategy. [GitHub Flow](https://docs.github.com/en/get-started/using-github/github-flow), [Gitflow](https://nvie.com/posts/a-successful-git-branching-model/) and [trunk practices](https://dora.dev/capabilities/trunk-based-development/) concern integration/delivery with different tradeoffs; do not impose one based on a project's name.

When relevant to engineering, recover release cadence/supported versions, concurrent owners, review, CI, releases and execution isolation. The same branch name in separate clones does not mean shared physical files; pushing/integration can still conflict. [Worktrees](https://git-scm.com/docs/git-worktree) provide separate checkouts, normally with different branches. Separate branches/checkouts reduce overlap but do not eliminate incompatible decisions or document/code integration conflicts. Avoid concurrent edits of the same authoritative source; define review/integration.

Declare each test's topology: shared session/checkout, worktrees, clones or different machines. active_work selects work in an instance, not personal task assignment; versioning it can propagate it through Git. Helper hash/lock protection covers cooperating local writes, not distributed merges or manual edits. Do not create branches, agents or processes without need/authorization.

Output: concrete structure, development guide, decisions and slice plan integration. Do not generate code merely to fill this model.

Challenge frontend/backend organization, contracts and CI/CD through [technical decisions/review](decisions-and-technical-review.md). Document change-to-delivery path, relevant checks, environments/permissions and recovery; executed pipeline evidence requires actual execution.

## Local process and development

The kit supports planning/execution in local repositories with available assistants/tools: editing, code analysis, builds, tests, previews/prototypes and bounded technical proofs. Public hosting/remote CI are not required. The kit/models are not self-executing runtimes; assistants/tools execute authorized tasks with recorded commands/results.

Inspect existing environment, runtimes and dependencies before installations. Define relevant reproducible preparation, startup, verification and shutdown commands. Containers are optional. Use suitable test data, local configuration and secret-free examples. State mock/substitute limitations.

Local proofs/prototypes may precede final stack selection when addressing specific uncertainty. Product implementation needs sufficient task criteria/decisions for the change, not all future planning. Separate proposal, execution and verified result.

Distinguish where the assistant works, where development/tests run, and where the product is used. Local development does not decide final hosting; local/offline products are alternatives when appropriate without assuming every collaboration scenario fits.

Record local demonstrations and what requires integrated/production environments. Local tests do not prove deployment, scale, real integrations or production operations. Costs, privacy, data and external services still matter when code runs locally.
