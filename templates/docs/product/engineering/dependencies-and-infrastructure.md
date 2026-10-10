# Pesquisa de dependências e infraestrutura

Status: investigação; nenhuma ferramenta/fornecedor escolhido ou instalado.

Entradas: comportamento, qualidades/restrições, arquitetura, capacidade/custo e riscos. Alimenta technologies.md, structure-and-development.md e o plano responsável da fatia.

## Decisões a comparar conforme necessidade

| Categoria | Critérios e perguntas |
|---|---|
| Linguagem/runtime/framework | Adequação, experiência/capacidade, versões/suporte, manutenção, bibliotecas e produtividade verificável |
| Banco/modelo de persistência | Consultas/relações, transações/consistência, migração, recuperação, volume e custo |
| Hospedagem | Local/piloto vs disponibilização, plataforma/região, operação, custos, limites, disponibilidade e portabilidade |
| Cache | Necessidade demonstrada, dados/chaves por audiência, invalidação/expiração, consistência, ganho e custo |
| Fila/eventos/tempo real | Requisito concreto, entrega/reenvio/idempotência, ordenação, monitoramento e fallback |
| Armazenamento/arquivos/busca | Tipos/volume, acesso, versionamento, retenção/exportação e preço |
| Dependências diretas/transitivas | Origem, licença, versões, manutenção, avisos de vulnerabilidade, API e custo de substituição |
| Build/CI/configuração | Reprodutibilidade, lockfiles conforme ecossistema, segredos, ambientes e verificação proporcional |

“Não usar cache/fila/serviço separado agora” é uma alternativa válida se o requisito não justificar. Nome de tecnologia não é arquitetura, e popularidade não substitui comparação.

## Registro de seleção

| Decisão / requisito | Opções/fontes oficiais e datas | Versões/premissas | Custo/risco/manutenção | Recomendação / prova necessária |
|---|---|---|---|---|
| — | Ainda não pesquisado | — | — | — |

Pesquisar docs/changelog/política de suporte/advisories/licença oficiais. Verificar compatibilidade entre versões e capacidades necessárias. Preço e limite são temporais: registrar consulta e cenário; não congelar uma tabela antiga como orçamento.

Quando houver código, manter inventário e lockfile pertinentes; avaliar scanners do ecossistema e CI disponíveis, com escopo/resultados claros. [Gestão de dependências vulneráveis, OWASP](https://cheatsheetseries.owasp.org/cheatsheets/Vulnerable_Dependency_Management_Cheat_Sheet.html) é referência para triagem e manutenção. Inventário ou scanner não elimina necessidade de julgar exposição real.

Saída: decisões justificadas, dependências aceitas/adiadas, riscos/tarefas de verificação e gatilhos de atualização. Não instalar ferramenta simplesmente para preencher a tabela.
