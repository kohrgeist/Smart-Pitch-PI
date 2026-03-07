1. Escopo inicial do MVP
Funcionalidades essenciais para a aplicação:

UC01: Realizar Login / Gestão de Acesso

Relacionamento: Vinculado ao Épico 1 — Sistema de Cadastro.

User Stories do MVP: 
- US01 (Registro)
- US03 (Login)
- US04 (Erro de login)
- US05 (Excesso de tentativas)

Justificativa MVP: O acesso seguro via Firebase é inegociável para proteger a ferramenta corporativa e as chaves de API. A US02 (Recuperação de senha) pode ser feita de forma manual pelo administrador do Firebase nesta primeira versão de testes, priorizando o tempo de desenvolvimento para a IA.

UC02: Gerar Pitch de Vendas Personalizado

Relacionamento: Vinculado ao Épico 2 — Pesquisa por URL e ao Épico 3 — Geração de Script.

User Stories do MVP: 
- US06 (Pesquisa Perfil do Decisor)
- US07 (Pesquisar Domínio da Empresa)
- US08 [Corrigido] (Exibir Modelos de Script)

Justificativa MVP: É o núcleo da aplicação. O sistema deve ser capaz de receber as URLs, consumir as APIs de dados, cruzar com o Playbook da empresa e retornar o texto hiperpersonalizado na tela para o LDR copiar e colar.

2. Escopo Pós-MVP (futuramente)
Funcionalidades que serão aplicadas posteriormente, não críticas para a etapa atual de desenvolvimento.

UC03: Gerenciar Histórico e Favoritos

Relacionamento: Vinculado ao Épico 3 — Geração de Script.

User Stories Pós-MVP: 
- US09 [Corrigido] (Salvar Modelo Favorito)
- US10 [Corrigido] (Salvar Modelo Por Determinado Período)
- US11 [Corrigido] (Excluir Modelo Após Determinado Período)

Justificativa Pós-MVP: Embora o histórico e os favoritos agreguem muito valor na rotina do LDR, estruturar as rotinas de banco de dados (Firestore) para salvar e excluir registros automaticamente (após 7 dias) consumiria tempo crítico da equipe. No MVP, o LDR apenas gera e copia o texto gerado.
