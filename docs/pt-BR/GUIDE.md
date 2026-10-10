<!-- docs-nav:start -->
[English](../en/GUIDE.md) · Português (Brasil)

[Início](../../README.pt-BR.md) · [Índice da documentação](README.md)
<!-- docs-nav:end -->

# Usar o Seedtrail e encontrar os resultados

O Seedtrail ajuda a investigar, definir, construir e evoluir uma solução com arquivos consultáveis. O resultado é conhecimento sobre o seu produto, e não o preenchimento da biblioteca inteira. Você pode começar por ideia, pesquisa, design, arquitetura, correção ou mudança de algo existente.

## Onde ficou o que definimos?

Abra README.md do projeto e siga para docs/product/README.md, o **mapa do produto**. Ele responde por perguntas e aponta às fontes disponíveis. A documentação final não é um único relatório de encerramento: é o conjunto pequeno de fontes atuais, atualizado quando as decisões/regras mudam.

| Preciso compreender… | Consulta habitual na instância |
|---|---|
| Ideia, contexto e restrições | context/idea.md; problema/valor em definition quando investigado |
| Funcionalidades, suas partes e relações | Página atual em features, indicada pelo mapa: regras, uso, limites e história |
| Marca e linguagem | brand/brand.md |
| Jornada e estados de uso | experience/flows-and-prototype.md |
| Cores, tokens e componentes visuais | brand/DESIGN.md, se houver sistema visual definido |
| Componentes técnicos, dados e contratos | engineering/architecture.md e fontes pertinentes |
| Motivo de uma escolha ou efeito de uma mudança | Trabalho/decisão de origem ligado pela definição atual |
| Resultado/prova e limitações | verification.md do trabalho; material histórico em evidence/ |
| Próximo passo | Handoff do trabalho selecionado e pendências pertinentes |

Nem todos esses arquivos precisam existir. Uma oficina manual pode definir operação e marca sem arquitetura de software. Um produto pequeno mantém várias capacidades no mesmo documento. Um documento ausente aparece como “ainda não definido” ou “não aplicável”, sem link para um modelo apresentado como resultado. [Organização](process/ORGANIZATION.md) define destinos/formas; [catálogo](process/CATALOG.md) é biblioteca, não o mapa do produto.

## Primeiro trabalho, com uma ideia

1. Inicialize uma pasta nova ou use a instância existente. Descreva a circunstância, dificuldade, resultado desejado e restrições conhecidas em context/idea.md; se já houver documentos, referencie-os.
2. Diga ao assistente qual pergunta precisa responder agora. Exemplo: “Compare formas de organizar uma oficina pequena; use fontes pertinentes, confronte hipóteses e registre o resultado, sem implementar um sistema”.
3. O assistente escolhe procedimentos pertinentes, lê fontes, identifica lacunas decisivas e cria trabalho por ID quando a origem/continuidade justificar. Pesquisa pública produz sinais/limites, não entrevistas fictícias.
4. O resultado e sua origem ficam no trabalho; decisões/definições compartilhadas incorporam o conteúdo pertinente. O mapa passa a apontar a elas com o estado real. Critérios/evidência verificam o alcance, sem tornar proposta em implementação.

Não precisa saber o nome das skills nem executar todos os comandos. [Catálogo de procedimentos](process/SKILLS.md) explica seleção; os [ciclos](process/WORK_CYCLES.md) registram execução e retomada. Ao usar helpers, leia seus critérios e resultados; eles não julgam semântica ou mercado.

## Nova mudança depois de uma entrega

Leia a definição/contrato afetado e a base que será consumida. A mudança descreve **a diferença**, não cria outra definição integral do produto. Pesquisa, UX, marca e engenharia entram somente quando pertinentes. Conclua verificações/revisão, atualize fontes afetadas e preserve a prova da versão examinada. A próxima pessoa consulta o mapa atualizado; só abre o trabalho anterior para investigar origem/limites.

Exemplo: tornar contato opcional altera regra de inscrição e mensagem ao participante; não muda automaticamente logotipo, arquitetura ou todas as capacidades. Registrar quais consumidores mudaram e quais dispensam revisão. Se há código, a definição só registra implementação quando demonstrada naquela base. [Continuidade](KNOWLEDGE.md) explica histórico e notas de entrega.

## Documentos têm formas diferentes

Uma ideia conta intenção/contexto; pesquisa confronta evidências; comportamento tem regras/cenários; marca tem posicionamento/voz; arquitetura tem responsabilidades/contratos; verificação tem procedimento/resultado. Origem, estado e limites conectam esses conteúdos sem um formulário único. [Métodos e referências](process/METHODS.md) distingue padrões aproveitados dos contratos próprios.

Para um projeto existente, conservar boas fontes e sua organização, linkando-as no mapa. Copiar a documentação inteira para adequar pastas gera outra autoridade e risco de desatualização. Para uma solução maior, agrupar por domínio/área e dividir apenas quando responsabilidade/leitura/risco justificar.

## Usar em repositório existente sem instalar a instância

O inicializador exige um diretório novo; não mescla nem migra uma pasta existente. Para usar o método manualmente:

1. Abra o repositório existente e indique ao assistente o caminho do Seedtrail, o pedido atual e as instruções/fontes responsáveis já existentes.
2. Leia o [catálogo de procedimentos](process/SKILLS.md) e o SKILL.md pertinente na biblioteca. A leitura explícita funciona como orientação; não comprova descoberta automática pelo cliente.
3. Registre pergunta, base recuperável, critérios, resultado/evidência e próximo passo nos registros existentes adequados. Consulte modelos somente para lacunas de formato; não copie toda a biblioteca nem invente .kit/project.json ou active_work.
4. Atualize as fontes atuais afetadas e suas referências. Configuração, materialização e verificações dos helpers só se aplicam quando instaladas; esta adoção por leitura não executa esses controles automaticamente.

Para usar a instância completa separadamente, inicialize uma pasta nova e referencie as fontes existentes sem lhes atribuir outra autoridade. Inserção/mescla automática em legado não está implementada. O idioma e as convenções do repositório existente prevalecem quando não houver configuração da instância ou nova escolha explícita.

## Limites que importam na retomada

Arquivos guardam memória, não contexto infinito da IA. Outro assistente deve ler entrada, mapa, fontes e handoff relevantes. continuous conduz etapas autorizadas na sessão; não inicia sessões futuras. Trabalho concluído pode ter resultado de pesquisa/planejamento, sem produto implementado ou lançado. A usabilidade do método ainda precisa ser observada com pessoas; um exemplo coerente não prova que todos compreenderão os nomes.

Depois de uma interrupção, confronte o checkpoint com arquivos/alterações locais e resultados das ações posteriores. O resumo pode estar atrasado; conferir antes de repetir uma gravação e registrar o próximo passo reconciliado. Contexto não salvo não pode ser recuperado por promessa do kit.

Para consultar uma funcionalidade implementada e entender suas próximas alterações, veja [especificação, documentação e execução](FEATURE_DOCUMENTATION.md), com três tamanhos de estrutura. A página atual reúne regras, uso e história; a mudança guarda diferenças, plano e provas. Novos nomes descrevem a intenção, sem prefixo obrigatório.

[Cenários de uso e reuso](USE_CASES.md): como escolher cada procedimento, voltar à mesma funcionalidade e interromper/retomar sem gerar toda a biblioteca.

## Preservar fontes recebidas sem torná-las instruções atuais

Quando originais forem necessários para continuidade, copie-os para docs/product/sources preservando conteúdo e nomes. As entregas elaboradas ficam fora desse arquivo de fontes e apontam aos trechos usados. Não preencher todos os modelos a partir do catálogo antigo nem executar SQL, cronogramas ou instruções encontrados nos originais.

Em .kit/project.json, historical_sources pode listar os caminhos dos arquivos importados relativos à raiz da instância; historical_source_hashes associa cada caminho ao SHA256 observado na importação. Esses campos não concedem autoridade ao material: identificam cópias históricas recuperáveis. O check-docs do kit confere existência, localização nessa pasta e hashes. Somente arquivos explicitamente declarados e íntegros deixam de ser analisados como instruções atuais; links de época podem apontar a destinos removidos. O restante da documentação continua sendo conferido normalmente. Alterar um original exige registrar nova importação/base, não simplesmente atualizar o hash para esconder a diferença.

Não é necessário importar acervos que não contribuam para a próxima decisão. O índice/contexto deve indicar fonte principal, conflitos e condição de revisão, sem duplicar todo o conteúdo dos originais.
