<!-- docs-nav:start -->
English · [Português (Brasil)](../../../pt-BR/templates/quality/verification.md)

[Home](../../../../README.md) · [Documentation index](../../README.md)
<!-- docs-nav:end -->

Reading reference; operational source: `templates/docs/product/quality/verification.md`. This page is not an installed skill or an authored project deliverable.

# Verification plan and results

Status: not executed.

Connect requirement/decision → UX/contract → task → verification → result → affected document. Select functional, contract, access, persistence, failure/recovery, visual/accessibility or usability tests by risk/scope.

Separate documentary analysis, technical proof, automated tests, manual inspection and observation with people. Without users, heuristics/documentation can advance but do not replace usability evidence.

Record environment/version, procedure, expected/observed, limits and acceptance decision. Never mark unexecuted work as passed. Compiling alone does not complete implementation.

Output: relevant evidence, residual failures and release conditions.

For UI, consume [design/accessibility review](../experience/design-and-accessibility-review.md): applicable criteria, manual flow, automated checks and limits. Separate planned, inspected, tested and untested with version/environment and recoverable evidence.

For identified work, connect requirement/criterion → task/contract → result/limit. Check conflicts/coverage before execution. Relevant TDD needs initial expected-cause failure and pass evidence; later tests do not prove TDD. At closure, compare missing, partial, conflicting and unrequested additions with evidence/correction/decision. See [cycles](../../process/WORK_CYCLES.md).
