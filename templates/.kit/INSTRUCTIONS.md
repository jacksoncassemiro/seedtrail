# Condução deste projeto

Esta instância inclui 11 procedimentos locais em [.kit/SKILLS.md](SKILLS.md). Selecionar a função pertinente, sem depender de skills pessoais; especialistas externos são opcionais. Pastas por assunto agrupam entregas; não representam ordem obrigatória ou agentes. Ler a skill relevante se o cliente não a descobrir automaticamente.

Leia README.md, instruções, contexto e decisões existentes antes de perguntar. Em instância inicializada, leia também .kit/project.json e siga output_language para todas as entregas elaboradas/revisadas; padrão pt-BR. Preserve identificadores e campos técnicos necessários.

Em repositório existente sem .kit, é possível adotar manualmente o método pela leitura dos procedimentos da biblioteca do kit. Preserve idioma, instruções e fontes responsáveis desse repositório; registre pergunta, base, critérios, evidências e próximo passo nos registros pertinentes. Links aos modelos explicam formatos, não exigem novos destinos. Referências abaixo à configuração, catálogo, materialização e helpers são condicionais à sua instalação. init cria diretório novo: não migra/mescla repositórios existentes nem comprova descoberta nativa de skills.

Nomes técnicos são em inglês (naming_language=en): arquivos/pastas, skills, catálogo, campos JSON, parâmetros e estados. Modelos de referência em pt-BR não determinam o idioma da entrega: adaptar títulos/narrativa ao output_language ao elaborar, sem traduzir IDs, comandos, fontes originais ou renomear arquivos existentes pela troca de idioma. Materialização é preparação, não tradução automática. Para idioma diferente de português/inglês, adaptar também a narrativa auxiliar do brief/handoff antes de entregá-la.

Explique decisões e termos para um fundador iniciante. Recomende alternativas com razões, sem exigir conhecimento prévio de produto, arquitetura ou tecnologia. Reutilize respostas existentes; faça perguntas quando informação específica for necessária.

Seguir .kit/STAGE_INFORMATION.md: solicitar apenas lacunas pertinentes à próxima ação, reaproveitar informações vigentes e registrar desconhecidos que podem esperar. Desenvolvimento local segue docs/product/engineering/structure-and-development.md; não exige publicação, mas precisa de escopo, critérios e evidências proporcionais.

Use research_mode configurado. Em modo documental, pesquisar pela internet está permitido como método; não conectar MCPs de pesquisa ou publicar/contatar pessoas sem autorização. Dados públicos são fontes, não entrevistas conduzidas pela equipe. Não inventar persona observada, receita, testes, benchmark, certeza ou decisão do fundador.

Preserve o problema como hipótese de partida, confronte soluções anteriores e registre motivos de revisão. Uma fase iniciada não autoriza executar automaticamente todas as seguintes. Não instalar/publicar/implementar o produto apenas por existência de modelos.

Entrega útil responde uma pergunta, cita fontes/versões, compara alternativas, identifica desconhecidos, recomenda próximo resultado e atualiza referências pertinentes. Deixar não aplicável/desconhecido explícito. Não encerrar com conselhos genéricos nem fingir execução.

Usar .kit/STAGE_CONTRACTS.md e o contrato local de fatia. Diferenças de requisitos, plano, tarefas e verificação ficam na mudança responsável; requisitos/regras de negócio e critérios de aceite vigentes ficam na definição da funcionalidade. Modelos gerais os referenciam. Usar os procedimentos e helpers desta instância.

Para entrar por funcionalidade, correção, design ou arquitetura, leia .kit/WORKFLOWS.md e .kit/METHODS.md; não reinicie descoberta nem assuma software implementado. Registre versão/base e alcance. As skills locais guide-product e challenge-assumptions apoiam continuidade e crítica quando pertinente.

Em decisões técnicas, consultar os modelos de segurança, dependências/infraestrutura e diagramas conforme risco/escopo. Não adicionar cache/fila/hospedagem por padrão nem afirmar auditoria/teste/inspeção que não foi realizado.

Aplicar docs/product/engineering/decisions-and-technical-review.md para recomendação e confronto de arquitetura, stack, organização frontend/backend, integrações e CI/CD. Respeitar preferências explícitas e decisão final do usuário; registrar conflitos demonstrados com requisitos, sem ocultá-los ou alterar a escolha silenciosamente.

Revisar pendências relevantes ao iniciar/retomar e registrar resolução/adiamento ao terminar. Após interrupção, conferir arquivos/alterações locais e resultados reais posteriores ao checkpoint antes de repetir uma ação; handoff pode estar atrasado e não recupera contexto não salvo. Salvar evidências com fonte, versão/data, contexto e limites. Confrontar dados que sustentem decisões; hipótese pode orientar experimento, mas não ser apresentada como fato validado.

Organização 0.1.0: ler .kit/ORGANIZATION.md, .kit/CATALOG.md e .kit/WORK_CYCLES.md. A biblioteca .kit/templates guarda modelos. Consultar artefatos materializados/registrados antes deles; materializar só o necessário, sem sobrescrever resultados. Resolver trabalho atual por ID/.kit/project.json.active_work, sem escolher a pasta mais recente. Scripts gerenciam estado, presença e hash; não certificam conteúdo ou executam o assistente.

Produzir informação suficiente para decidir, executar, verificar ou retomar. Se um artefato responsável já cobre a pergunta, atualizá-lo em vez de criar outro relatório/resumo. Para uma edição simples, registrar no contexto existente; usar docs/product/work/ID quando a identidade e o histórico ajudam. Remover campos sem função, evitando perder origem, evidência, decisão material ou pendência. Explicar consequências em linguagem adequada ao usuário; concisão não é uma meta de linhas ou tokens.

Antes de derivar plano/executar, conferir precondições e conteúdo suficiente, princípios efetivamente decididos e consistência. Aplicar TDD contextual e convergência conforme .kit/WORK_CYCLES.md. Registrar evidências, limites e ausência de progresso. Novo escopo/critério material recebe trabalho ligado à base anterior.

Em guided, conduzir resultado atual e recomendar próxima passagem. Em continuous, avançar dentro do alcance autorizado registrado no trabalho, com evidência e condição de parada. Não exigir aprovação já concedida, inventar respostas decisivas ou iniciar ações externas por existir um modelo. Pausar com razão/próximo passo e retomar a partir dos arquivos quando solicitado; helpers não executam o assistente.

Consultar e atualizar docs/product/README.md como mapa da solução. Cada trabalho delimitado consome fontes vigentes/base e registra diferença/resultado; ao fechar, incorporar decisões e resultados pertinentes ao conhecimento atual, incluindo comportamento, UX/design, arquitetura/contratos e operação afetados. Registrar dependências pelo resultado/contrato e versão consumidos. Preservar intenção e provas de trabalhos encerrados. A convergência registra quais consumidores foram atualizados ou por que não se aplica; conclusão do helper não dispensa esse exame. Não copiar todo histórico para cada nova solicitação.

Para funcionalidades novas, usar uma página atual em features com regras, uso e história; preservar boas fontes existentes. Não manter definições concorrentes em capabilities/definition/features. Organizar funcionalidades por área/módulo funcional somente quando facilitar consulta; distinguir esse agrupamento dos componentes técnicos e dos trabalhos que os alteram. Não exigir hierarquia fixa. Ao retomar, consultar a definição vigente da capacidade e seus contratos/dependências, além do trabalho selecionado. Base deve ser recuperável (commit/tag quando disponível ou snapshot/arquivos com versão e data); não confiar só na data ou no nome da pasta.

Na evolução relevante, atualizar o histórico de capacidades na fonte responsável com data ISO, IDs, efeito, base/revisão e origem. Distinguir implementado de entregue; ligar à versão/data da entrega quando confirmada. Consolidar release-notes só para público/entrega pertinentes, sem duplicar decisões/provas ou criar log diário. Versão independente de capacidade somente para contrato/distribuição independente.

Usar maintain-knowledge para auditoria/consolidação, referências desatualizadas e histórico do conhecimento. É uma entrada própria ou apoio à convergência; não exige reiniciar descoberta ou executar desenvolvimento. O catálogo explica as responsabilidades, e os SKILL.md completos são fontes únicas em inglês.

Entrada humana é README do produto → mapa → fonte responsável ou origem. Não apresentar .kit/templates como resultados nem usar state.json como único modo de compreender o que ficou definido. Manter formatos por assunto e atualizar o vigente após revisão; ao encerrar, preservar versão examinada das fontes de prova. Para legado concluído, preserve-evidence antes de editar suas fontes.

Manter AGENTS/instruções como orientação de trabalho com referências verificadas, não outra cópia do manual, do progresso ou do inventário de código. Pessoas e assistente consomem o mesmo conhecimento responsável, por entradas pertinentes. Ao adotar documentação existente, preservar suas fontes suficientes e mapear consumidores antes de mover/copiar. Rascunho descartável é diferente de evidência decisiva: guardar origem/versão/prova necessária em local preservado e acessível aos responsáveis, sem depender apenas de scratch ignorado.
