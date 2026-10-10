<!-- docs-nav:start -->
[English](../../en/process/CATALOG.md) · Português (Brasil)

[Início](../../../README.pt-BR.md) · [Índice da documentação](../README.md)
<!-- docs-nav:end -->

Referência de leitura; fonte operacional: `templates/.kit/CATALOG.md`. Esta página não é uma skill instalada nem uma entrega elaborada do projeto.

# Catálogo e geração sob demanda

O catálogo da instância está em .kit/catalog.json: id, stage, scope, template e destination. Não é backlog. No kit-fonte, os modelos permanecem abaixo; na instância enxuta, links a resultados ausentes apontam à biblioteca .kit.

O [mapa do produto](../templates/README.md), ID product-guide, reúne links ao contexto, vigente e trabalhos. O [comportamento vigente](../templates/definition/product-behavior.md), ID product-behavior, só é elaborado quando regras compartilhadas precisarem de uma fonte atual; não é outro relatório da mudança.

| Etapa | Modelo/contrato de referência | Elaborar quando |
|---|---|---|
| contexto | [Contexto](../templates/context/idea.md), [princípios](../templates/context/principles.md) | Entrada, retomada e decisão relevante |
| pesquisa | [Pesquisa](../templates/research/desk-research.md) | Uma pergunta muda a próxima decisão |
| produto | [Problema/valor](../templates/definition/problem-and-value.md), [experimentos](../templates/definition/experiments-and-mvp.md) | Delimitar aposta e experimento |
| negocio | [Viabilidade](../templates/business/feasibility.md) | Capacidade, comprador, canal ou receita pertinentes |
| experiencia | [Fluxos](../templates/experience/flows-and-prototype.md), [revisão](../templates/experience/design-and-accessibility-review.md) | Interação ou protótipo em discussão |
| marca | [Marca](../templates/brand/brand.md), [DESIGN](../templates/brand/DESIGN.md) | Identidade/contrato visual necessários |
| engenharia | [Arquitetura](../templates/engineering/architecture.md), [decisões](../templates/engineering/decisions-and-technical-review.md) | Planejar solução/prova técnica |
| qualidade | [Verificação](../templates/quality/verification.md) | Preparar ou conferir resultado |
| entrega | [Roadmap](../templates/delivery/roadmap-and-management.md), [fatia](WORK_CONTRACT.md) | Priorizar entregas ou executar mudança |
| operacao | [Operação](../templates/operations/launch-and-operations.md) | Piloto/disponibilização pertinentes |
| evolucao | [Decisões/mudanças](../templates/evolution/decisions-and-changes.md) | Aprendizado ou atualização |
| revisoes | [Crítica](../templates/reviews/critical-review.md), [evidências](../templates/reviews/evidence-review.md) | Premissa decisiva ou conflito |

Para fundamentos: -Stage research ou -Document desk-research, architecture, technologies, DESIGN etc. IDs são nomes dos arquivos sem extensão; o mapa README usa product-guide. Consultar JSON antes de chamar o helper.

Para um trabalho: -Work ID e -Document research, decision, spec, plan, tasks, consistency, verification ou convergence. Criar somente o necessário. Engenharia usa spec → plan → tasks → consistência → implementação → verificação/convergência; pesquisa/design usam suas entradas pertinentes.

Modelos têm estado explícito. Ao elaborar a entrega, substituir “Status: modelo” pelo estado real e guardar fontes/limites. Não concluir etapa por materializar todos os documentos. Leia [organização](ORGANIZATION.md) e [ciclos](WORK_CYCLES.md).
