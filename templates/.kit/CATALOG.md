# Catálogo e geração sob demanda

O catálogo da instância está em .kit/catalog.json: id, stage, scope, template e destination. Não é backlog. No kit-fonte, os modelos permanecem abaixo; na instância enxuta, links a resultados ausentes apontam à biblioteca .kit.

O [mapa do produto](../docs/product/README.md), ID product-guide, reúne links ao contexto, vigente e trabalhos. O [comportamento vigente](../docs/product/definition/product-behavior.md), ID product-behavior, só é elaborado quando regras compartilhadas precisarem de uma fonte atual; não é outro relatório da mudança.

| Etapa | Modelo/contrato de referência | Elaborar quando |
|---|---|---|
| contexto | [Contexto](../docs/product/context/idea.md), [princípios](../docs/product/context/principles.md) | Entrada, retomada e decisão relevante |
| pesquisa | [Pesquisa](../docs/product/research/desk-research.md) | Uma pergunta muda a próxima decisão |
| produto | [Problema/valor](../docs/product/definition/problem-and-value.md), [experimentos](../docs/product/definition/experiments-and-mvp.md) | Delimitar aposta e experimento |
| negocio | [Viabilidade](../docs/product/business/feasibility.md) | Capacidade, comprador, canal ou receita pertinentes |
| experiencia | [Fluxos](../docs/product/experience/flows-and-prototype.md), [revisão](../docs/product/experience/design-and-accessibility-review.md) | Interação ou protótipo em discussão |
| marca | [Marca](../docs/product/brand/brand.md), [DESIGN](../docs/product/brand/DESIGN.md) | Identidade/contrato visual necessários |
| engenharia | [Arquitetura](../docs/product/engineering/architecture.md), [decisões](../docs/product/engineering/decisions-and-technical-review.md) | Planejar solução/prova técnica |
| qualidade | [Verificação](../docs/product/quality/verification.md) | Preparar ou conferir resultado |
| entrega | [Roadmap](../docs/product/delivery/roadmap-and-management.md), [fatia](WORK_CONTRACT.md) | Priorizar entregas ou executar mudança |
| operacao | [Operação](../docs/product/operations/launch-and-operations.md) | Piloto/disponibilização pertinentes |
| evolucao | [Decisões/mudanças](../docs/product/evolution/decisions-and-changes.md) | Aprendizado ou atualização |
| revisoes | [Crítica](../docs/product/reviews/critical-review.md), [evidências](../docs/product/reviews/evidence-review.md) | Premissa decisiva ou conflito |

Para fundamentos: -Stage research ou -Document desk-research, architecture, technologies, DESIGN etc. IDs são nomes dos arquivos sem extensão; o mapa README usa product-guide. Consultar JSON antes de chamar o helper.

Para um trabalho: -Work ID e -Document research, decision, spec, plan, tasks, consistency, verification ou convergence. Criar somente o necessário. Engenharia usa spec → plan → tasks → consistência → implementação → verificação/convergência; pesquisa/design usam suas entradas pertinentes.

Modelos têm estado explícito. Ao elaborar a entrega, substituir “Status: modelo” pelo estado real e guardar fontes/limites. Não concluir etapa por materializar todos os documentos. Leia [organização](ORGANIZATION.md) e [ciclos](WORK_CYCLES.md).
