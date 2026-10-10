# Contrato de trabalho e mudança

Para uma pergunta ou mudança relevante, usar docs/product/work/ID, com origem/base, alcance e resultado verificável. Este contrato pertence ao método; não é uma entrega do produto. Um trabalho pode passar por várias etapas da mesma intenção. Não criar outro pacote para cada etapa nem uma segunda pasta de changes.

Manter somente as informações necessárias:

| Artefato lógico | Conteúdo | Consumidor |
|---|---|---|
| Brief/estado | Origem, objetivo, base recuperável, alcance, critérios e andamento | Seleção/retomada |
| Pesquisa/decisão | Pergunta, fonte/data/limite, alternativas, escolha/autoridade e condição de revisão | Definição, experimento ou plano |
| Spec | Diferença da base, escopo/não objetivos, cenários, requisitos/IDs, acesso/dados e critérios | Plano/verificação |
| Plano | Decisões/alternativas, estrutura/contratos, dependências com versão e disponibilidade, riscos/migração | Tarefas/operação |
| Tarefas | Resultado verificável ligado a requisito, dependência real e critério | Execução |
| Consistência | Requisito sem cobertura, conflito, dependência ausente e critério sem verificação | Correções nas fontes responsáveis |
| Verificação/convergência | Versão/ambiente, esperado/observado, resultado/limites, escolhas e consumidores atualizados | Encerramento e conhecimento vigente |

Não é obrigatório produzir todos esses arquivos. Bug pequeno pode caber num registro e na verificação; pesquisa pode terminar em decisão sem implementação. Mudança técnica material pode referenciar ADR/contratos próprios. Uma informação já registrada tem uma fonte responsável; os demais documentos a referenciam.

Produto/UX/design/arquitetura vigentes são entradas. A mudança registra diferenças; documentação atual incorpora apenas resultados e decisões pertinentes, identificando estado e origem. Decidido não é implementado. Uma dependência ausente impede a ação que a consome, não todo trabalho independente.

Requisitos, regras de negócio e cenários de aceite vigentes ficam na definição da funcionalidade, inclusive antes da implementação quando houver decisão registrada. A spec da mudança registra diferenças e critérios/regressões pertinentes; no fechamento, consolidar regras/cenários novos na fonte responsável. Passou/falhou, ambiente e provas continuam na verificação daquela mudança. IDs C001 etc. do helper identificam critérios do trabalho; não substituem requisitos ou cenários da funcionalidade.

No fechamento, conferir critérios/efeitos, atualizar mapa e consumidores pertinentes, guardar prova da versão examinada e pendências. Mudança material de escopo/critério recebe nova identidade ligada à base anterior, conforme [ciclos](WORK_CYCLES.md). Corrigir relações falsas com motivo; preservar histórico e decisões substituídas. Pasta por capacidade só se facilitar a consulta; não repetir todo o produto por solicitação.

[Organização](ORGANIZATION.md), [catálogo](CATALOG.md) e [contratos das etapas](STAGE_CONTRACTS.md) orientam destinos e passagens.

Identificar novas mudanças com nomes descritivos, como add-registration; prefixo e sequência numérica não são necessários. Spec é artefato do trabalho; tarefas fatiam execução e a funcionalidade tem identidade/endereço de consulta independentes. No brief/spec, identificar documentação vigente consumida e quais leitores/fontes precisam de atualização. Não gerar manual completo por mudança. Após entrega material, nova alteração tem base/identidade próprias; esclarecimento dentro do trabalho aberto preserva sua intenção/aceite. O guia de uso só incorpora comportamento disponível no estado declarado.

## Identidade, intenção e nomes semelhantes

O ID é o nome único da pasta do work dentro do projeto; o título pode ser legível e semelhante ao de outro trabalho. O helper aceita IDs de 3 a 80 caracteres, começando por letra, com letras/números/hífens, e recusa uma pasta existente. Essa proteção não detecta trabalhos com nomes diferentes e intenção sobreposta, nem coordena identidades entre branches/máquinas. Não depender somente de maiúsculas/minúsculas para distinguir IDs.

Antes de criar, consultar os trabalhos da funcionalidade e comparar objetivo, base, critérios e estado. Continuação da mesma intenção aberta usa seu ID; entrega nova após encerramento recebe outro, ligada à origem. Preferir efeito/contexto diferenciador, como fix-registration-capacity. Quando a descrição não bastar, usar identificador de ticket já existente ou sufixo único acordado, como implement-registration-20261010-a; data sozinha não garante unicidade. Não renomear históricos para liberar um nome nem impor nova sequência global. Em equipe, conferir também trabalhos concorrentes e o que será integrado.

No brief e índice, indicar funcionalidade afetada e relação pertinente: implementa a definição, continua a origem, depende de outra entrega ou substitui determinada decisão. Não criar outro cadastro para isso. Selecionar por ID explícito; títulos semelhantes, pasta mais recente e active_work não comprovam prioridade ou autoria.

Um work de especificação pode encerrar com critérios documentais e definição ainda não implementada. Implementação posterior identifica a definição recuperável e o estado técnico observado, referenciando os requisitos já decididos em vez de duplicá-los. completed significa que o objetivo daquele work foi atendido com suas provas, não que toda funcionalidade associada esteja disponível. O [fluxo de definição antes do código](WORKFLOWS.md) descreve as duas alternativas de passagem.
