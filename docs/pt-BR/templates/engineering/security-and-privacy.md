<!-- docs-nav:start -->
[English](../../../en/templates/engineering/security-and-privacy.md) · Português (Brasil)

[Início](../../../../README.pt-BR.md) · [Índice da documentação](../../README.md)
<!-- docs-nav:end -->

Referência de leitura; fonte operacional: `templates/docs/product/engineering/security-and-privacy.md`. Esta página não é uma skill instalada nem uma entrega elaborada do projeto.

# Segurança, privacidade e auditoria

Status: preparação. Não houve auditoria, varredura, teste de invasão ou demonstração de controle implementado por criar este arquivo.

## Integração ao ciclo

| Momento | Pergunta / trabalho | Saída que alimenta |
|---|---|---|
| Contexto/requisitos | Quais dados, pessoas/audiências, ativos e consequências precisam de proteção? | Regras, restrições e cenários |
| UX/design | Interface respeita audiência, acesso, erros e informações sensíveis? | Fluxos/estados e revisão |
| Arquitetura | Fronteiras de confiança, autorização, dados e falhas permitem que abuso aconteça? | Riscos/mitigações e contratos |
| Tecnologias/dependências | Versões, suporte, origem e exposição alteram risco? | Seleção, atualização e tarefas |
| Implementação | Controles definidos realmente funcionam? | Revisão/testes e achados |
| Release/operação | Configuração, segredos, recuperação e resposta estão adequados ao público? | Condições de disponibilização e guia operacional |
| Nova mudança/incidente | Houve nova audiência, fluxo de dados, endpoint ou dependência? | Revisão do modelo e consumidores pertinentes |

Selecionar requisitos verificáveis de referências como [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/) quando pertinentes, registrando versão/ID usados. Não afirmar conformidade ou cobertura completa sem trabalho correspondente.

## Modelo de riscos a elaborar

Ativos, fronteiras, atores/acessos, dados e fluxos; cenário plausível, condição, impacto, evidência/hipótese; mitigação, requisito/teste, responsável e risco residual. [Threat modeling](https://owasp.org/www-community/Threat_Modeling) ajuda a revisar esses elementos ao longo do ciclo.

Privacidade: coleta necessária, audiência, retenção, exportação/exclusão e logs. Identificar obrigações reais aplicáveis antes de prometer conformidade; não inferir certificação da existência de requisitos.

## Registro de achados/auditoria

| ID / base e escopo | Evidência / reprodução | Consequência e prioridade justificada | Mitigação e consumidor | Verificação / limite |
|---|---|---|---|---|
| — | Nenhuma auditoria executada | — | — | — |

Distinguir risco conceitual, achado no código/configuração, alerta de ferramenta e falha demonstrada. Relatório inclui caminhos/versões, método, o que foi examinado e o que ficou fora. Scan limpo não prova segurança total; alerta precisa de triagem no contexto.

Skills de segurança podem apoiar quando disponíveis, solicitadas e dentro do escopo/language suportado. Exemplos opcionais são security-best-practices e security-threat-model, se disponíveis no host; elas não são scanners nem auditoria independente. Kit reutilizável não instala essas dependências.

## Integração técnica

Ler também dependencies-and-infrastructure.md e diagrams.md. Risco material vira decisão/requisito/tarefa e verificação. Alterar acesso/cache/logs/armazenamento exige revisar o cenário pertinente. Não impor uma auditoria completa para toda edição pequena nem marcar checagem inexistente como passada.
