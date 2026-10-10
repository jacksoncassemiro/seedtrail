<!-- docs-nav:start -->
[English](../en/USAGE_MODES.md) · Português (Brasil)

[Início](../../README.pt-BR.md) · [Índice da documentação](README.md)
<!-- docs-nav:end -->

# Local, Spec Kit e runtime

Comparação metodológica de 06/10/2026. O local 0.1.0 é independente e é o fluxo escolhido. Spec Kit e sua composição comunitária foram referências de avaliação; não são instalados por esta distribuição. A tabela não é um histórico de execução nem uma instrução para manter dois kits.

| Aspecto | Local | Spec Kit e composição avaliada |
|---|---|---|
| Condução | Onze procedimentos próprios, selecionados pela pergunta | Comandos/contratos do core e componentes |
| Descoberta a evolução | Modelos e coleta progressiva | Assessment/SDD/bugs; Forge e complementos ampliam etapas |
| Organização | Fundamentos sob demanda, biblioteca e docs/product/work/ID | Artefatos por feature e recursos geridos pelas integrações |
| Consistência/conclusão | Roteiros de revisão e helpers de presença/estado/hash | analyze e converge têm comandos/templates específicos |
| Extensibilidade | Edição dos procedimentos; sem API de plugins | Extensões, presets e workflows |
| Instalação/atualização | Inicializador e comparação manual de bases | CLI, integrações e procedimentos de upgrade |
| Dependências | PowerShell para helpers; uso manual por arquivos | CLI Python/uv e ferramentas dos componentes |
| Responsabilidade | Manter nosso schema, scripts, skills e testes | Gerir versões/compatibilidade do core e componentes |
| Evidência atual | Testes de helpers no Windows | Referência documental; eficácia comparativa não demonstrada |

Fontes: [documentação oficial](https://github.github.io/spec-kit/), [core](https://github.github.io/spec-kit/reference/core.html), [convergência](https://github.com/github/spec-kit/blob/main/templates/commands/converge.md) e scripts/procedimentos desta distribuição.

O local facilita adaptar perguntas, idioma e profundidade e distribuir um percurso sem CLI adicional. A desvantagem é manter instalação, atualização e comportamento por nossa conta. Não oferece o ecossistema de integrações/extensões ou a mesma experiência de comandos do Spec Kit. Sobreposição em SDD/análise/convergência é conceitual, com implementação própria; não implica equivalência operacional ou melhor qualidade de decisões.

Pode usar somente o local. Antes de investir mais no framework, aplicá-lo a uma pergunta real: avaliar utilidade dos arquivos, inconsistências encontradas e retomada. Uma comparação futura deve usar a mesma pergunta/base; popularidade ou instalação não demonstram superioridade.

## PowerShell ou Python

PowerShell 7 tem [instalação para Windows, Linux e macOS](https://learn.microsoft.com/en-us/powershell/scripting/install/install-powershell). Portanto Linux não exige outra implementação, mas exige instalar PowerShell se ausente. Nossos helpers foram testados apenas no Windows.

Não foi adicionado um segundo motor Python. Duplicar estado/materialização duplicaria correções e testes sem necessidade demonstrada. Um wrapper Python que chama PowerShell também não elimina essa dependência.

Se ambientes sem PowerShell se tornarem um requisito, comparar migração do motor único para Python com adaptadores sobre uma implementação compartilhada. Exigir equivalência nos testes de preservação, links, limites, evidências e conclusão. Sem helpers, o método funciona com edição manual, preservando contratos e sem afirmar que bloqueios automáticos foram executados.

[Cenários de uso e reuso](USE_CASES.md) mostram percurso completo, entrada isolada e recursos transversais; os exemplos são hipotéticos, não execução de todas as etapas.
