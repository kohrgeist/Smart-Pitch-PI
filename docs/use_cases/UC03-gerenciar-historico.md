## Caso de Uso: Gerenciar Histórico

### Ator Principal
Usuário

### Objetivo
Manter o controle das pesquisas recentes de URLs e geração de pitches.

### Pré-condições
- Possuir uma sessão ativa e ter realizado pelo menos uma pesquisa.

### Pós-condições
- Histórico atualizado.

### Fluxo Principal
1. Usuário realiza uma pesquisa de pitch.
2. Sistema salva automaticamente a pesquisa no histórico em segundo plano.

### Fluxos Alternativos
- **A1) Limite de histórico atingido**
  1. Sistema detecta que o histórico atingiu 50 pesquisas.
  2. Exclui o registro mais antigo ao salvar a nova pesquisa.

- **A2) Limpeza de histórico expirado**
  1. Sistema identifica registros no histórico com mais de 7 dias.
  2. Deleta automaticamente os registros excedentes.

### Regras de Negócio
- RN06: O histórico deve armazenar apenas as últimas 50 pesquisas realizadas pelo usuário.

### Requisitos Relacionados
- RF10 Histórico
- RF11 Deletar Histórico

---

### Diagrama de Atividade (UC03)
```plantuml
@startuml
start

:Usuário realiza pesquisa;
:Sistema processa dados;
:Sistema gera pitch;

:Sistema salva no histórico;

if (Histórico >= 50?) then (Sim)
  :Remover registro mais antigo;
endif

if (Registros > 7 dias?) then (Sim)
  :Remover registros expirados;
endif

:Usuário acessa histórico;
:Sistema exibe lista;

stop
@enduml
```

### Exibição:
<img width="258" height="712" alt="image" src="https://github.com/user-attachments/assets/81af6f91-b8e3-4e7a-8f1d-c2f4b4448d8b" />

---

### Diagrama de Classe (UC03)
```plantuml
@startuml

class Usuario {
  -id: int
  -nome: String
  -email: String
  -senha: String
}

class Pesquisa {
  -id: int
  -url: String
  -data: Date
}

class Pitch {
  -id: int
  -conteudo: String
  -dataGeracao: Date
}

class Historico {
  -id: int
  -listaPesquisas: List<Pesquisa>
}

Usuario "1" -- "1" Historico
Historico "1" -- "0..*" Pesquisa
Pesquisa "1" -- "1" Pitch

@enduml
```

### Exibição:
<img width="264" height="588" alt="image" src="https://github.com/user-attachments/assets/2f2d44b6-e3b6-429f-9e4b-65d19bee60ee" />

---
