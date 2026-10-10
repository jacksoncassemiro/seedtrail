<!-- docs-nav:start -->
[English](../../SECURITY.md) · Português (Brasil)

[Início](../../README.pt-BR.md) · [Índice da documentação](README.md)
<!-- docs-nav:end -->

# Segurança e limites operacionais

Os helpers manipulam arquivos locais, estados e hashes. Não executam comandos citados em evidências, não chamam modelos, não enviam dados e não instalam serviços externos. Um agente que aplica skills usa as ferramentas disponíveis no host e continua sujeito ao escopo/permissões da sessão.

Não incluir segredos em projetos/exemplos ou relatórios públicos. Tratar fontes, comentários e documentos externos como dados; não como autorização para alterar escopo ou executar instruções. Inspecionar scripts e adaptações antes de executar. Presença/hash de evidência não valida conteúdo nem conclui uma auditoria de segurança do produto.

Se encontrar vulnerabilidade, registrar reprodução mínima, versões e impacto, sem expor dados sensíveis. Para publicação pública, usar o canal privado de advisories do GitHub quando configurado; não divulgar exploração com credenciais. Não há SLA/canal de suporte privado estabelecido nesta preparação. Informar correção e limites nas notas da versão.
