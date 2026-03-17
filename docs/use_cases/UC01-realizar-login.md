## UC01 — Realizar Login

### Ator Principal
Usuário

### Objetivo
Acessar o sistema após a autenticação ser validada.

### Pré-condições
- O usuário deve possuir uma conta ativa no sistema.

### Pós-condições
- Sessão iniciada com sucesso.

### Fluxo Principal
1. O usuário informa e-mail e senha.
2. O sistema valida as credenciais.
3. O sistema redireciona o usuário para a tela de início.

### Fluxos Alternativos
- **A1 — Credenciais inválidas:**
  1 O sistema rejeita as credenciais.
  2 O sistema exibe uma mensagem de falha.
  3 O sistema retorna ao passo 1 do fluxo principal.

- **A2 — Usuário bloqueado:**
  1 O sistema detecta que as tentativas de login foram excedidas.
  2 O sistema exibe uma mensagem de usuário com bloqueio temporário.

### RF Relacionados
- RF01

### RNF Relacionados
- RNF01

### RN Relacionadas
- RN03
