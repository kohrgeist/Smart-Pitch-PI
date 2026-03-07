### RNF01 — Tempo de Resposta
O sistema deve gerar sugestões de abordagem e e-mails personalizados em até 5 segundos após a inserção da URL do LinkedIn.

### RNF02 — Desempenho
As telas principais do aplicativo devem carregar em até 2 segundos em conexões de internet estáveis.

### RNF03 — Segurança de Dados
As senhas dos usuários devem ser armazenadas utilizando hash seguro (ex.: bcrypt ou equivalente) e todas as comunicações devem ocorrer via HTTPS.

### RNF04 — Autenticação
O sistema deve utilizar Firebase Authentication para controle seguro de login e sessão dos usuários.

### RNF05 — Escalabilidade
A arquitetura baseada em Firebase deve permitir escalabilidade automática para suportar aumento no número de usuários simultâneos.

### RNF06 — Disponibilidade
O sistema deve possuir disponibilidade mínima de 99% de uptime mensal.

### RNF07 — Compatibilidade
O aplicativo deve funcionar em dispositivos Android e iOS, utilizando o framework Flutter.

### RNF08 — Conformidade com LGPD
O sistema deve utilizar apenas dados públicos do LinkedIn, sem armazenamento permanente dessas informações, respeitando o princípio de legítimo interesse e a legislação LGPD.

### RNF09 — Usabilidade
A interface do aplicativo deve permitir que um usuário gere um pitch personalizado em no máximo 3 etapas após o login.
