# Diagnóstico de projeto existente

Status: roteiro; nenhuma análise de código ou ambiente executada neste arquivo.

## Entrada e objetivo

Para sistema/repositório existente, entender objetivo da análise, mudança desejada, versão/commit, regras e documentação vigentes. Pode ser entrada por funcionalidade, correção, arquitetura ou revisão operacional. Se só houver planejamento, revisar a proposta e declarar que código/produção não existem ou não foram fornecidos.

Usar system-design quando disponível para responsabilidades/contratos e challenge-assumptions para confronto técnico. Não depende de instalar uma coleção de skills. Segurança, UX, desempenho ou CI podem receber revisão especializada conforme escopo e evidências disponíveis.

## Evidências a examinar conforme alcance

- Estrutura real e pontos de entrada, manifests/lockfiles, módulos e direção das dependências.
- Fluxos críticos de frontend/backend, contratos, dados/migrações e controles de acesso pertinentes.
- Testes/verificações existentes, configuração de build/CI/CD, ambientes e documentação de execução.
- Dados de operação e custo fornecidos, métricas, incidentes, backups/restore e manutenção de dependências, quando disponíveis.
- Diferenças entre documentação, código e comportamento observado. Registrar arquivo/linha/commit ou comando/log/contexto que sustenta a conclusão.

Não expor segredos. Leitura de código não prova comportamento em execução; configuração de pipeline não prova que ele passa. Executar verificações proporcionais e autorizadas quando necessário; sem acesso a ambiente/métricas, registrar o limite. Ausência de evidência não demonstra ausência de controle.

## Confronto e saída

Priorizar achados por impacto no objetivo, risco, esforço e evidência, não por preferência estilística. Comparar manter, melhorar incrementalmente, substituir um componente e reescrever apenas quando houver justificativa material. Avaliar custo de migração/dados, compatibilidade, reversão, prazo e capacidade de manutenção.

| Achado / fonte e versão | Impacto / certeza e limite | Alternativas / custo e esforço | Recomendação e verificação |
|---|---|---|---|
| — | Nenhum diagnóstico realizado | — | — |

Entregar mapa do estado atual, pontos fortes, problemas demonstrados, hipóteses/pendências e plano proporcional à mudança. Relacionar à [decisão técnica](decisions-and-technical-review.md) e à [capacidade/custos](capacity-costs-and-evolution.md). Registrar a decisão do usuário e consumidores afetados. O diagnóstico não autoriza automaticamente reescrita, alteração de produção ou execução de todas as melhorias.
