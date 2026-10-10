# Capacidade, custos e evolução do MVP

Status: modelo; orçamento, carga e equipe ainda não conhecidos. Consumidores: viabilidade, tecnologias, arquitetura, roadmap e operação.

## Recursos disponíveis

Registrar o que o idealizador pode investir em dinheiro e tempo, distinguindo disponibilidade de limite autorizado de gasto. Levantar orçamento inicial, teto mensal de operação, horizonte de sustentação, horas disponíveis, experiência, equipe/contratação e ferramentas existentes. Campo não informado permanece desconhecido; não assumir investimento ilimitado nem gratuito.

Se o usuário não informar valores, comparar cenários com premissas explícitas e evitar um compromisso financeiro ou prazo fechado. Na decisão pertinente, solicitar apenas a informação que muda a recomendação. Não instalar/contratar serviços por existir uma estimativa.

## Custo total e capacidade de manutenção

Incluir conforme o caso: descoberta/design, construção/contratação, infraestrutura, banco/armazenamento/tráfego, integrações cobradas, domínio/licenças, observabilidade, backups, testes, atualização de dependências, suporte, correções, segurança e migração futura. Separar custos iniciais, recorrentes e variáveis; registrar moeda, impostos/câmbio se pertinentes, data e fonte oficial. Tempo do fundador tem custo de capacidade mesmo sem desembolso.

Planos gratuitos têm limites/condições; não tratá-los como garantia de custo zero permanente. Estimativas usam intervalo e premissas. Considerar alternativas com menor desembolso mas maior trabalho operacional, sem declarar uma delas melhor sem conhecer a capacidade de manutenção.

## Cenários comparáveis

Preencher somente cenários úteis à decisão:

| Cenário | Pergunta/resultado e escopo | Capacidade e custo inicial/recorrente | Limites e manutenção | Evidência/condição para evoluir |
|---|---|---|---|---|
| Experimento/protótipo | Testar hipótese específica; pode ser manual ou navegável | A estimar com fontes/premissas | Não equivale a produto operável | Aprendizado necessário para investir em implementação |
| MVP/piloto | Menor entrega que testa valor ou uso com qualidade pertinente | A estimar conforme orçamento/equipe | Público/carga/funcionalidades delimitados | Resultado observado e limite técnico/operacional relevante |
| Próxima versão | Ampliação justificada por resultado ou requisito | Incremento e sustentação necessários | Migração, suporte e riscos | Critérios de avanço e capacidade confirmados |

Não definir “produto final” como arquitetura definitiva: a visão orienta escolhas, mas evolução depende de aprendizado. Comparar reutilizar, construir, integrar ou operar manualmente onde fizer sentido. Reduzir escopo ou adiar capacidade pode ser preferível a tornar o MVP complexo; controles essenciais ao seu uso não desaparecem por ser MVP.

## Escalabilidade proporcional

Separar capacidade inicial necessária, crescimento plausível e crescimento apenas hipotético. Registrar usuários ativos/concorrência, dados/arquivos, operações críticas, latência/disponibilidade e fontes/premissas relevantes. Não confundir número de contas com carga concorrente.

Identificar gargalos esperados e como observá-los; escolher testes/provas pertinentes. Definir condição de revisão com métricas e limites fundamentados, como custo por unidade, latência, saturação, erro ou esforço operacional. Sem medida/meta fundamentada, registrar hipótese, não inventar um gatilho numérico.

Cache, filas, serviços separados e escalabilidade horizontal precisam de necessidade/custo justificados. Documentar caminho de evolução, esforço de migração, portabilidade/exportação e decisões difíceis de reverter, sem construir infraestrutura futura antecipadamente.

## Saída e decisão

Recomendação de cenário que cabe nos recursos conhecidos, escolhas/limites do usuário, premissas, pendências, investimento necessário e condição de avançar, reduzir escopo ou interromper. Vincular ao [confronto técnico](decisions-and-technical-review.md) e à [viabilidade](../business/feasibility.md), sem duplicar um orçamento já responsável em outro artefato.
