# Onde salvar e encontrar as informações

Comece pelo README do produto e pelo mapa em docs/product/README.md. Para consultar uma funcionalidade, abra sua página atual; para alterar algo, abra a mudança selecionada. O leitor não precisa conhecer o catálogo inteiro.

## Duas partes da documentação do produto

```text
docs/product/
├── README.md                  índice do produto
├── features/                  funcionalidades atuais: regras, uso e história curta
│   ├── item-addition.md        exemplo de assunto, não arquivo obrigatório
│   └── item-removal.md
├── context/                   ideia, princípios e perguntas abertas
├── brand/                     marca e DESIGN.md
├── engineering/               arquitetura e contratos compartilhados
├── delivery/                  roadmap e notas de entrega, se necessários
└── work/                      pesquisas e mudanças com origem, plano e resultado
    ├── add-checklist/          criação inicial
    └── persist-undo/           outra mudança da mesma funcionalidade
```

**Documentação atual** explica o produto no estado declarado. **Mudança** guarda uma intenção delimitada e o que ocorreu para realizá-la. Uma funcionalidade recebe várias mudanças ao longo do tempo; uma mudança pode afetar várias funcionalidades. Pesquisa também pode usar work/<nome> quando precisar de origem e retomada, sem ser uma implementação.

features é o destino inicial recomendado para funcionalidades em projetos novos. Não criar outra árvore de capacidades em paralelo. Em projeto existente, conservar boas fontes e apontá-las no mapa. Em produto muito pequeno, seções em uma página podem bastar; não gerar uma página por botão, requisito ou tarefa.

## O que fica em cada lugar

| Pergunta | Fonte responsável | Conteúdo útil |
|---|---|---|
| Qual é a definição vigente desta funcionalidade? | Página em features, ou fonte existente apontada no mapa | Objetivo, estado, requisitos/regras de negócio, critérios de aceite em cenários, uso, limites, dependências e links técnicos |
| O que queremos mudar e como aceitar a entrega? | spec.md da mudança | Diferença da base atual, escopo, não objetivos e critérios verificáveis |
| Como será feito? | plan.md da mudança, se necessário | Abordagem, alternativas, dependências e riscos; links à arquitetura compartilhada |
| O que falta executar? | tasks.md da mudança, se necessário | Passos e verificações ligados aos critérios |
| O que realmente foi feito? | verification.md e evidence/ da mudança | Base/ambiente, procedimento, observado, resultado e limites |
| Como continuar o trabalho? | brief.md e handoff.md da mudança | Objetivo, alcance, estado e próximo passo; state.json apoia o helper |
| O que mudou nesta funcionalidade? | História curta na sua página atual | Data ISO, efeito, mudança de origem e versão/disponibilidade confirmada |
| O que foi entregue na versão do produto? | delivery/release-notes.md, quando houver entrega | Efeitos agrupados por público/versão, com links às mudanças |
| Por que o produto existe, qual a marca e como é construído? | context/, brand/ e engineering/ | Conhecimento compartilhado; não repetir em toda funcionalidade |

Não criar todos esses arquivos por padrão. Uma correção simples pode caber num registro com verificação. Uma decisão de pesquisa pode terminar sem spec, código ou release. As outras disciplinas do [catálogo](CATALOG.md) aparecem somente quando houver uma pergunta e conteúdo próprios.

## Página da funcionalidade

Reunir definição e consulta na mesma página quando servirem aos mesmos leitores: propósito/estado, regras/cenários, uso/limites, relações e história. Não exigir manual e spec separados para a mesma funcionalidade. Se um contrato ou manual existente tiver outra audiência, manter sua autoridade e ligar os documentos; não duplicar as regras. Uma página pública pode omitir detalhes internos, com revisão explícita dos consumidores.

A página responde também como essa parte funciona: fluxos relevantes, dados/acesso, integrações e dependências, arquitetura e diagramas úteis, falhas/recuperação, requisitos de qualidade e operação, conforme o assunto. Detalhes compartilhados ficam em contratos/arquitetura/design/operação apontados diretamente. O leitor deve achar a resposta atual sem abrir todos os trabalhos antigos. Não exigir essas seções quando não houver conteúdo pertinente nem copiar código ou contratos na íntegra.

Requisitos, regras de negócio e critérios de aceite vigentes pertencem a essa definição. Critérios descrevem resultados esperados; passou/falhou e provas ficam na verificação da mudança examinada. A spec da mudança registra diferenças e regressões pertinentes, sem substituir a fonte de consulta. A definição pode ser decidida antes do código: registrar autoridade/origem e distinguir proposta, decisão, implementação e disponibilidade, sem inventar aprovação. Na evolução, incorporar regras/cenários novos à fonte responsável e preservar a decisão e as provas na origem.

Começar com features/<nome>.md. Quando a leitura justificar, agrupar por área, como features/events/registration.md; uma funcionalidade extensa pode crescer para features/events/registration/README.md e subassuntos. A página ou mapa declara o endereço atual e atualiza links quando ele muda. Não impor produto → módulo → submódulo → funcionalidade nem espelhar frontend/backend. Capacidade pode ser sinônimo de funcionalidade; não é outro cadastro obrigatório.

Evoluir o comportamento normalmente preserva o endereço de consulta. Reorganização justificada ou correção de associação pode mover a fonte: manter identidade/origem, registrar motivo e atualizar mapa/consumidores atuais. Se o endereço antigo é referenciado, conservar um apontador breve quando útil, sem repetir regras. Provas e bytes históricos não são reescritos para aparentar que já apontavam à nova organização.

## Alterar e manter o histórico

1. Ler a página atual e os contratos/dependências afetados; fixar uma base recuperável, como commit/tag ou snapshot.
2. Criar uma mudança com nome descritivo, como persist-undo, quando a intenção/entrega nova justificar histórico próprio. Esclarecimento dentro do trabalho aberto permanece nele; edição trivial pode usar a fonte e o histórico Git.
3. Registrar o que muda e os critérios na spec; plano, tarefas e pesquisa entram conforme necessidade.
4. Executar/verificar no alcance autorizado. Depois, atualizar a mesma página atual e consumidores pertinentes. Enquanto a mudança for proposta, a página não a apresenta como disponível.
5. Guardar provas e decisões na mudança. Acrescentar uma linha de história à funcionalidade e notas de entrega somente se pertinentes. Não escrever todo o relato três vezes.

Datas e links tornam a evolução consultável; nenhuma versão independente de funcionalidade é exigida. Versão própria só faz sentido com distribuição/contrato independente. Helpers não geram o manual nem garantem sincronização semântica.

## Método e retomada

.kit guarda configuração, biblioteca e helpers; .agents/skills guarda os procedimentos. Não são documentação do produto. Inicialização enxuta cria contexto/mapa; -Structure complete apenas prepara modelos. Nomes técnicos são em inglês; o conteúdo elaborado segue output_language.

Para retomar, usar .kit/project.json.active_work ou ID explícito e ler brief/handoff/fontes pertinentes. Não selecionar pela pasta mais recente. O prefixo WRK dos exemplos antigos não é requisito nem padrão de mercado: novos nomes descrevem a mudança. Históricos concluídos conservam suas identidades e provas; mudar o rótulo de um link não altera a origem.

Preservar bytes/hash de provas antes de revisar uma fonte mutável, conforme [ciclos](WORK_CYCLES.md). Não reescrever evidência antiga para fazer parecer que verificou a versão nova. Os helpers rejeitam gravação obsoleta de estado/configuração sob trava curta local, exercitada entre processos na mesma sessão do sistema operacional Windows; não há transação de todos os arquivos nem coordenação entre sessões/máquinas, editores e Git. Em equipe, usar ID explícito: active_work é uma seleção compartilhada, não uma atribuição pessoal. Recarregar e confrontar alterações após conflito; não mesclar critérios automaticamente. Branches/checkouts separados ajudam edições sobrepostas. [Contrato de trabalho](WORK_CONTRACT.md) detalha os artefatos, e [métodos](METHODS.md) registra as referências e limites dessas escolhas.
