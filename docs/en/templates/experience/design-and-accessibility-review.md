<!-- docs-nav:start -->
English · [Português (Brasil)](../../../pt-BR/templates/experience/design-and-accessibility-review.md)

[Home](../../../../README.md) · [Documentation index](../../README.md)
<!-- docs-nav:end -->

Reading reference; operational source: `templates/docs/product/experience/design-and-accessibility-review.md`. This page is not an installed skill or an authored project deliverable.

# Design, usability and accessibility review

Local procedure without external service/personal skill requirements. Apply to the current journey/material. Without an interface, review flows/criteria; do not record visual inspection or conformity that could not be verified.

## Method and evidence

Identify version, objective, audience/context, screens/states and environment. For existing UI, capture or inspect rendering before layout conclusions; review task steps, not just an attractive image. Per finding, record location/state, observed versus expected, user consequence, principle/criterion, justified severity, correction and verification. Avoid cosmetic critique without demonstrated effects.

Within the represented slice, vary content and width in components with material risks: filled fields, long text, absence/quantity, errors and unavailability as relevant. Identify real or synthetic examples and the inspected combination. Compare behavior with the DESIGN contract; declare what was not represented or verified. Do not require every combination or infer responsiveness from one fixed width.

Heuristic reference: [NN/g](https://www.nngroup.com/articles/ten-usability-heuristics/). Challenge feedback, understandable language, consistency, control/recovery, error prevention/handling, recognition, effort and help as relevant. State the principle supporting a finding. This is expert inspection, not user observation or accessibility testing.

## Accessibility by stage

For new web UI, use WCAG 2.2 AA as an initial revisable target; document version, level and scope. Do not presume universal legal obligations. Select applicable criteria from [W3C Quick Reference](https://www.w3.org/WAI/WCAG22/quickref/); this is a sample of common risks, not complete coverage.

| Moment | Relevant criteria/examples | Possible evidence |
|---|---|---|
| Flow/wireframe | Dragging alternatives (2.5.7), error prevention/recovery, access/authentication | Flow/rule; implementation not yet verified |
| Visual direction | Text contrast (1.4.3), UI contrast (1.4.11), target size (2.5.8) | Values/measurements; check criterion exceptions |
| Functional prototype/code | Keyboard (2.1.1), focus order (2.4.3), visible focus (2.4.7), unobscured focus (2.4.11) | Manual flow and failure/result captures |
| Functional UI | Semantics/name/state (4.1.2), status messages (4.1.3), reflow (1.4.10) | DOM, relevant screen reader, zoom/viewport and execution |
| Forms/authentication | Labels (3.3.2), redundant entry (3.3.7), accessible authentication (3.3.8) | Real task and offered alternatives |

Inspection and automation complement each other. A scan without alerts does not prove conformity; images do not demonstrate keyboard/screen-reader behavior. Record untested/not applicable with reasons. Complete criteria and processes matter in conformity evaluation; this sample cannot issue certification.

## Prototype, MVP and delivery

- Sketch: understand organization, language and actions; note hypotheses.
- Navigable prototype: test task/states with available content. Without people, provide a future protocol and heuristic review; do not attribute results to nonexistent participants.
- Implemented MVP: execute tasks, access, recovery, responsiveness and applicable accessibility checks. Record limits/residual failures for pilot decisions.

Authoritative files: [flows](flows-and-prototype.md), [DESIGN](../brand/DESIGN.md), slice requirements and [verification](../quality/verification.md). Correct causes/consumers without a competing visual spec. New changes review only affected risks/states.
