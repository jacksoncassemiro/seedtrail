<!-- docs-nav:start -->
[English](../../en/process/STAGE_INFORMATION.md) · Português (Brasil)

[Início](../../../README.pt-BR.md) · [Índice da documentação](../README.md)
<!-- docs-nav:end -->

Referência de leitura; fonte operacional: `templates/.kit/STAGE_INFORMATION.md`. Esta página não é uma skill instalada nem uma entrega elaborada do projeto.

# Informações necessárias no momento certo

Status: regra de condução; não é questionário obrigatório nem lista a preencher integralmente no início.

Antes de perguntar, ler o pedido e as fontes pertinentes: contexto, respostas anteriores, decisões, evidências e pendências. Se a informação já existe e continua válida, reutilizar com referência. Se mudou, está contraditória ou não vale para o novo escopo, explicar por que precisa ser revisada. Não carregar todo o histórico para uma mudança pequena.

## Momento de solicitar

| Etapa/decisão | Informação pertinente | O que pode esperar |
|---|---|---|
| Ideia e descoberta | Problema/contexto, intenção, público hipotético, materiais e restrições que mudam a investigação | Stack, detalhes de deploy, credenciais e estimativa completa de infraestrutura |
| Viabilidade e recorte do MVP | Capacidade, tempo, orçamento inicial/teto recorrente quando mudam a aposta; restrições essenciais | Arquitetura detalhada e fornecedores que ainda não afetam a decisão |
| UX e design | Fluxos, regras, audiências/acesso, conteúdo, acessibilidade e identidade existente pertinente | Detalhes técnicos sem efeito na experiência atual |
| Engenharia e decisão técnica | Requisitos/restrições relevantes, execução local/online, ambiente e experiência disponíveis, carga fundamentada | Escala hipotética distante e configuração de serviços não escolhidos |
| Implementação local | Repositório/versão, tarefa/critério, comandos e dependências, dados de teste/configuração necessários | Domínio público, contratação de hospedagem e credenciais de produção |
| Publicação/operação | Destino, responsáveis, orçamento operacional, migrações, recuperação e autorização da ação pertinente | Ampliações não necessárias à entrega |
| Evolução de projeto existente | Estado atual, mudança desejada e evidências da área afetada | Repetir toda a descoberta ou decisões sem impacto |

A tabela orienta; não proíbe antecipar uma restrição decisiva. Por exemplo, exigência de funcionar offline, dados sensíveis ou orçamento que inviabiliza a aposta pode precisar ser conhecida antes da fase técnica.

## Como tratar informação ausente

Perguntar quando a resposta muda materialmente a próxima decisão/ação e não pode ser obtida das fontes ou de inspeção autorizada. Explicar a finalidade, usar o menor conjunto de perguntas necessário e continuar trabalho independente. Não pedir ao usuário algo que o assistente pode verificar no repositório.

Se a informação ainda não for necessária, registrar a pendência e sua condição de revisão. Se for possível avançar com uma hipótese reversível, identificá-la e indicar o que mudaria a conclusão. Se indispensável, manter a decisão dependente em aberto; não inventar resposta nem considerar silêncio como escolha.

Pedir informações e pedir autorização são ações diferentes. Não exigir aprovação a cada etapa por hábito; respeitar escopo e escolhas já autorizadas. Segredos não pertencem aos documentos: registrar apenas nomes/requisitos de configuração e orientar uso do mecanismo apropriado quando necessário.

## Passagem entre etapas

Reutilizar a saída anterior responsável, com versão e limites. Identificar apenas lacunas que afetam a nova entrega; atualizar o documento de origem e consumidores quando houver mudança. Relacionar desconhecidos ao [registro de pendências](../templates/context/open-questions.md). A fase não depende de preencher todos os campos dos modelos.
