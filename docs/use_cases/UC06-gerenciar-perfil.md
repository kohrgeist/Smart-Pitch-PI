## Caso de Uso: Gerenciar Perfil

### Ator Principal
Usuário

### Objetivo
Editar informações pessoais da conta existente.

### Pré-condições
- Possuir uma sessão ativa (logado).

### Pós-condições
- Perfil atualizado no banco de dados.

### Fluxo Principal
1. Usuário acessa as configurações do seu perfil.
2. Usuário altera os campos de e-mail e nome.
3. Sistema salva as alterações no banco de dados.

### Fluxos Alternativos
- Não se aplica.

### Regras de Negócio
- Não se aplica.

### Requisitos Relacionados
- RF03 Atualização de Perfil

---

### Fluxos Detalhados
* **Fluxo Principal (Editar Perfil):** O usuário com sessão ativa acessa a área de configurações do seu perfil. Ele visualiza as informações atuais (nome e e-mail) e altera os campos desejados. Ao solicitar o salvamento, o sistema atualiza as informações do usuário diretamente no banco de dados e exibe os dados atualizados em tela.

### Diagrama de Atividades (UC06)

```plantuml
@startuml
|Usuário|
start
:Acessa configurações do perfil;
:Altera campos de Nome e/ou E-mail;
:Solicita salvar alterações;

|Sistema|
:Processa novos dados;
:Atualiza registro no banco de dados;

|Usuário|
:Exibe mensagem de sucesso;
:Visualiza perfil atualizado;
stop
@enduml
```
### Exibição de diagrama:
<img width="540" height="503" alt="image" src="https://github.com/user-attachments/assets/4deb00c8-c25f-45ec-8a23-b6e19da66758" />

---

### Diagrama de Classes (UC06)
```plantuml
@startuml
class PerfilUsuario {
  -idUsuario: int
  -nome: string
  -email: string
  +getNome(): string
  +getEmail(): string
  +setNome(n: string): void
  +setEmail(e: string): void
}

class GerenciadorDePerfil {
  +atualizarDadosPerfil(idUsuario: int, novoNome: string, novoEmail: string): bool
  +buscarPerfil(idUsuario: int): PerfilUsuario
  -validarEmailUnico(email: string): bool
}

class RepositorioPerfil {
  +atualizar(p: PerfilUsuario): void
  +buscarPorId(id: int): PerfilUsuario
}

GerenciadorDePerfil "1" --> "1" PerfilUsuario : edita/visualiza
GerenciadorDePerfil --> RepositorioPerfil : persiste
@enduml
```
### Exibição:
<img width="596" height="356" alt="image" src="https://github.com/user-attachments/assets/8edb8713-49d0-4487-8bd8-75f33fb4baf7" />

---
