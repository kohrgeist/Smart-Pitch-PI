## UC01 — Realizar Login

### Ator Principal
Usuário

### Objetivo
Acessar o sistema após autenticação ser válida.

### Pré-condições
- Possui uma conta ativa.

### Pós-condições
- Iniciar sessão.

### Fluxo Principal
1. Usuário informa e-mail e senha.
2. Sistema valida credenciais.
3. Sistema redireciona para a tela de início.

### Fluxos Alternativos
- **A1 — Credenciais inválidas:**
  1. Sistema rejeita credenciais.
  2. Exibe mensagem de falha.
  3. Retorna ao passo 1 do fluxo principal.

- **A2 — Usuário bloqueado:**
  1. Sistema detecta as tentativas excedidas.
  2. Exibe mensagem de usuário com bloqueio temporário.

### RF Relacionados
- RF01 Login

### RNF Relacionados
- RNF01 Resposta em até 2s

### RN Relacionadas
- RN03: Bloqueio após 5 tentativas inválidas.

---

### Diagrama de Classe
```plantuml
@startuml
class TelaLogin {
  +email: string
  +senha: string
  +solicitarDados(): void
  +enviarHome(): void
}

class AutenticacaoController {
  +realizarLogin(email: string, senha: string): void
  -validar(usuario: Usuario, senha: string): boolean
}

class Usuario {
  -email: string
  -senha: string
  -contaExiste: boolean
}

class Sessao {
  -idSessao: string
  +iniciarSessao(usuario: Usuario): Sessao
  +encerrarSessao(): void
}

TelaLogin --> AutenticacaoController
AutenticacaoController --> Usuario
AutenticacaoController ..> Sessao
Sessao "0..*" --> "1" Usuario

@enduml
```
### Diagrama:
<img width="657" height="600" alt="image" src="https://github.com/user-attachments/assets/b4146cd1-cbe6-48b2-a399-82cbc41ace20" />

---
### Diagrama de Fluxo de Atividade
```plantuml
@startuml
start
repeat
  :Usuário informa e-mail e senha;
  :Sistema valida credenciais;
  
  if (Credenciais válidas?) then (sim)
    :Sistema redireciona para a tela de início;
    stop
  else (não)
    if (Tentativas >= 5?) then (sim)
      :Exibe mensagem de usuário com bloqueio temporário;
      stop
    else (não)
      :Exibe mensagem de falha;
    endif
  endif
  
repeat while (Retorna ao passo 1)
detach
@enduml
```

### Diagrama:
<img width="894" height="414" alt="image" src="https://github.com/user-attachments/assets/76e8b4dd-2283-484b-a558-49327542efea" />

