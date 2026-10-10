<!-- docs-nav:start -->
[English](../../../en/templates/work/spec.md) · Português (Brasil)

[Início](../../../../README.pt-BR.md) · [Índice da documentação](../../README.md)
<!-- docs-nav:end -->

Referência de leitura; fonte operacional: `templates/docs/product/work/spec.md`. Esta página não é uma skill instalada nem uma entrega elaborada do projeto.

# Especificação da mudança

Status: modelo, comportamento não aprovado nem implementado.

Identificar origem/base, problema/resultado, público/contexto, escopo e não objetivos. Requisitos com IDs estáveis e cenários: contexto → ação → resultado observável. Relacionar critérios em state.json aos requisitos; considerar acesso, dados, falhas e casos limites pertinentes. Identificar fundamentos consumidos, conflitos/pendências e decisões efetivas. Distinguir critério verificável de métrica pós-lançamento.

Consumidores: [plano](plan.md), [tarefas](tasks.md) e [verificação](verification.md). Não copiar outra spec canônica. Mudança de regra atualiza a fonte e consumidores com motivo.

## Diferenças e dependências

| ID / capacidade afetada | Fonte vigente e base/versão | Diferença proposta (adicionar/alterar/remover) | Critério / consumidor |
|---|---|---|---|

| Resultado/contrato necessário | Fonte/trabalho e versão | Por que / em qual etapa | Condição exigida e disponibilidade observada | Pendência / ação |
|---|---|---|---|---|

Usar somente relações pertinentes. Uma proposta definida pode servir ao protótipo, mas não equivale a integração implementada. Antes de executar, conferir dependências necessárias e registrar limites de mocks/provas. A capacidade é parte da solução; o trabalho é a mudança que a define ou altera. Não criar pacote por arquivo ou por passagem de etapa.

## Definição e documentação consumidas

Apontar à regra/contrato atual e à página/seção de consulta, quando existir. Identificar leitor e consumidores que a mudança afeta: guia de uso, referência, UX/design, técnica ou operação. Spec da mudança não é outra documentação completa da funcionalidade; preservar IDs e consolidar fontes após verificação. Indicar estado disponível versus proposto.

Registrar aqui critérios da mudança e regressões pertinentes, ligados à definição consumida. Requisitos, regras de negócio e cenários de aceite que continuam valendo pertencem à página da funcionalidade; incorporar novos comportamentos nessa fonte com estado e origem, sem apresentar decisão como implementação. Resultado de teste, versão/ambiente e provas ficam na verificação da mudança. IDs dos critérios em state.json organizam o trabalho e não substituem o contrato da funcionalidade.
