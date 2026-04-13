## Caso de Uso: Gerenciar Conta

### Ator Principal
Usuário

### Objetivo
Criar novas contas, recuperar acessos perdidos e gerenciar o status da conta do usuário.

### Pré-condições
- Aplicativo instalado e com conexão à internet.

### Pós-condições
- Conta criada, senha redefinida ou conta bloqueada por inatividade.

### Fluxo Principal
1. Usuário acessa a tela de registro e informa os dados.
2. Sistema valida se a idade é superior a 18 anos.
3. Sistema cria o novo registro de usuário.

### Fluxos Alternativos
- **A1) Recuperação de senha**
  1. Usuário solicita redefinição informando o e-mail.
  2. Usuário insere "Nova Senha" e "Confirmar Nova Senha".
  3. Sistema valida se os campos são idênticos e salva a nova credencial.

- **A2) Bloqueio por inatividade**
  1. Sistema varre a base de dados periodicamente.
  2. Detecta usuário sem login há mais de 90 dias.
  3. Altera o status do usuário para inativo.

### Regras de Negócio
- RN01: Para criar uma conta, o usuário deve ter mais de 18 anos.
- RN02: Usuários inativos por mais de 90 dias devem ser marcados como inativos.
- RN07: Na redefinição, a alteração só será salva se o campo "Nova Senha" for idêntico ao campo "Confirmar nova Senha".

### Requisitos Relacionados
- RF02 Recuperar Senha
- RF04 Cadastro de Novos Usuários

### Fluxos Detalhados
* **Fluxo Principal (Criar Conta):** O usuário acessa a tela de registro e informa seus dados básicos e data de nascimento. O sistema verifica se o usuário atende à RN01 (ter mais de 18 anos). Sendo validado, um novo registro de usuário é salvo no sistema.
* **Fluxo Alternativo A1 (Recuperação de Senha):** O usuário solicita a redefinição de senha informando seu e-mail de cadastro. Na tela de nova senha, ele preenche os campos "Nova Senha" e "Confirmar Nova Senha". O sistema valida a RN07 (ambos os campos devem ser idênticos) e, se positivo, atualiza a credencial no banco de dados.
* **Fluxo Alternativo A2 (Bloqueio por Inatividade):** Um processo em segundo plano (Job) do sistema varre a base de dados periodicamente. O sistema identifica usuários que não realizam login há mais de 90 dias (RN02) e atualiza o status dessas contas para inativo.

### Diagrama de Atividades (UC05)

```plantuml
@startuml
|Usuário|
start
:Acessa opções de Conta;

if (Ação desejada?) then (Criar Conta)
  :Informa dados cadastrais e nascimento;
  
  |Sistema|
  :Calcula idade;
  if (Idade >= 18 anos?) then (sim)
    :Cria novo registro de usuário;
    |Usuário|
    :Exibe tela de sucesso;
    stop
  else (não)
    |Sistema|
    :Bloqueia criação (RN01);
    |Usuário|
    :Exibe erro de idade mínima;
    stop
  endif

else (Recuperar Senha)
  |Usuário|
  :Solicita redefinição informando e-mail;
  :Insere "Nova Senha" e "Confirmar Nova Senha";
  
  |Sistema|
  :Valida entradas;
  if (Senhas são idênticas?) then (sim)
    :Salva nova credencial (RN07);
    |Usuário|
    :Exibe confirmação de alteração;
    stop
  else (não)
    |Sistema|
    :Rejeita alteração;
    |Usuário|
    :Exibe erro de divergência de senhas;
    stop
  endif

endif

|Sistema|
start
:Varredura de inatividade (Job periódico);
:Busca usuários com último login > 90 dias;

if (Encontrou inativos?) then (sim)
  :Altera status do usuário para INATIVO (RN02);
  stop
else (não)
  stop
endif

@enduml
```

### Exibição:
<img width="1807" height="859" alt="image" src="https://github.com/user-attachments/assets/c673b9b7-3168-4ca1-a97a-8a835ef8c654" />

---

### Diagrama de Classe (UC05)
```plantuml
@startuml
class Usuario {
  -id: int
  -email: string
  -senhaHash: string
  -dataNascimento: Date
  -ultimoLogin: Date
  -status: StatusConta
  +getEmail(): string
  +setStatus(s: StatusConta): void
  +setSenha(novaSenha: string): void
}

class GerenciadorDeConta {
  +registrarUsuario(u: Usuario): bool
  +recuperarSenha(email: string, novaSenha: string, confirmaSenha: string): bool
  +verificarInatividade90Dias(): void
  -validarMaioridade(dataNascimento: Date): bool
}

class RepositorioUsuario {
  +salvar(u: Usuario): void
  +atualizar(u: Usuario): void
  +buscarPorEmail(email: string): Usuario
  +buscarInativosPorDias(dias: int): List<Usuario>
}

enum StatusConta {
  ATIVA
  INATIVA
  BLOQUEADA
}

Usuario --> StatusConta
GerenciadorDeConta "1" --> "0..*" Usuario : gerencia
GerenciadorDeConta --> RepositorioUsuario : persiste
@enduml
```
### Exibição:
<img width="683" height="563" alt="image" src="https://github.com/user-attachments/assets/d541495c-4d03-4576-9ded-81ad5480c70e" />

---

