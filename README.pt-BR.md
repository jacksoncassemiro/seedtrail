# Seedtrail

<img src="assets/seedtrail-icon.png" width="72" height="72" alt="Seedtrail: sprout and trail">

[English](README.md) | **Português (Brasil)**

**Da ideia à entrega, com contexto preservado.** Versão inicial 0.1.0. Um método local para investigar, definir, construir e evoluir uma solução com evidências, decisões e documentação consultáveis por pessoas e assistentes. Não depende do Spec Kit nem de serviços externos obrigatórios.

**Projeto experimental.** Este é um experimento pessoal elaborado e revisado com apoio do Codex (OpenAI), para explorar a continuidade entre ideia, decisão, implementação e conhecimento. Não é um produto oficial da OpenAI nem um framework validado com equipes reais. As verificações descritas são delimitadas; avalie os procedimentos e scripts antes de adotá-los.

As comparações com outros métodos foram exercícios exploratórios com cenários sintéticos e revisores de IA. Não estabelecem superioridade ou equivalência geral, nem validação independente. Seedtrail continua sendo um experimento, sem recomendação sustentada por resultados com equipes reais.

## Entenda antes de começar

Comece por [onde consultar funcionalidades e mudanças](docs/pt-BR/FEATURE_DOCUMENTATION.md). O [guia de uso](docs/pt-BR/GUIDE.md) explica como iniciar; a [organização](docs/pt-BR/process/ORGANIZATION.md) é referência de destinos. Para compreender o próprio utilitário, veja a [arquitetura e diagramas](docs/pt-BR/ARCHITECTURE.md).

A documentação tem duas partes: **produto atual**, com páginas de funcionalidades e fontes compartilhadas; **pesquisas/mudanças**, com intenção, plano, execução e provas. A história curta de cada funcionalidade aponta às mudanças que a produziram.

Na instância, a entrada humana é **README do produto → docs/product/README.md → fonte responsável**. Ideia, marca, comportamento e arquitetura têm estruturas de conteúdo diferentes. Trabalhos por ID guardam mudanças/origens; fontes atuais descrevem a solução. .kit guarda método/biblioteca; .agents guarda 11 procedimentos únicos em inglês. Entregas seguem o idioma configurado, português por padrão.

```text
seu-projeto/
├── README.md, AGENTS.md       propósito/uso e encaminhamento da IA
├── docs/product/README.md    onde encontrar o que ficou definido
├── docs/product/...          fontes por assunto e trabalhos por mudança
├── .kit/                     configuração, procedimentos auxiliares e modelos
└── .agents/skills/           skills portáteis com a instância
```

## Iniciar uma pasta

PowerShell 7.2+; a partir desta pasta:

```powershell
& ./scripts/init-project.ps1 -Destination ../my-product -Name 'Minha ideia' -Language pt-BR -ResearchMode desk
```

O destino deve ser novo. A inicialização enxuta cria contexto, mapa e biblioteca; não executa pesquisa/desenvolvimento nem materializa todas as etapas. Outra entrada: -WorkType feature, fix, design, architecture ou research. Para um repositório existente sem instância, siga a [adoção por leitura](docs/pt-BR/GUIDE.md#usar-em-repositório-existente-sem-instalar-a-instância), preservando suas fontes e convenções; o inicializador não mescla pastas.

Peça ao assistente: “Leia AGENTS.md, o mapa e as fontes pertinentes; responda à próxima pergunta, confronte hipóteses e salve somente resultados úteis no idioma configurado”. Pode abrir a instância como projeto ou indicar a pasta na conversa atual. Os [fluxos](docs/pt-BR/process/WORKFLOWS.md) e [ciclos](docs/pt-BR/process/WORK_CYCLES.md) explicam helpers, execução guiada/contínua, pausa e retomada. Não há daemon ou publicação automática.

## Referências, manutenção e limites

[Métodos](docs/pt-BR/process/METHODS.md) distingue padrões existentes e escolhas locais. [Revisão](docs/pt-BR/KIT_REVIEW.md), [comparação das referências](docs/pt-BR/REFERENCE_REVIEW.md), [idioma](docs/pt-BR/LANGUAGE.md) e [índice completo](docs/pt-BR/README.md) detalham cobertura e limites. A [análise do nome](docs/pt-BR/KIT_REVIEW.md#nome-do-utilitário) registra a escolha e a triagem pública.

Helpers testados no Windows/PowerShell 7.6.5; Linux/macOS e retomada por outra pessoa ainda não observados. [Comparação com Spec Kit](docs/pt-BR/USAGE_MODES.md) registra vantagens/limites sem prometer equivalência. Scripts verificam estrutura/estado/hash; qualidade da decisão, semântica e mercado exigem outras evidências. Runtime/renderização/web dependem do trabalho solicitado; o framework não exige Python/Node/MCP.

[MIT](LICENSE), [créditos](docs/pt-BR/CREDITS.md), [contribuição](docs/pt-BR/CONTRIBUTING.md), [segurança](docs/pt-BR/SECURITY.md) e [changelog](docs/pt-BR/CHANGELOG.md). Distribua esta pasta como repositório independente, preservando licença/créditos e excluindo dados de instâncias/clientes. Nenhum upstream foi incorporado como framework executável.

```powershell
& ./scripts/check-docs.ps1
& ./tests/test-kit.ps1
& ./tests/test-docs.ps1
```

[Cenários de uso e reuso](docs/pt-BR/USE_CASES.md) mostram o percurso completo, cada procedimento isolado e situações de pausa, mudança de fonte, legado e nova entrega do mesmo recurso.

Use o [kit local ou a distribuição como plugin](docs/pt-BR/PLUGIN.md); ambos compartilham os mesmos procedimentos. O [site](https://jacksoncassemiro.github.io/seedtrail/) inclui suporte e políticas. A primeira versão pública do plugin ainda aguarda revisão do diretório.
