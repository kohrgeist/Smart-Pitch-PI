Caso de Uso: Gerenciar Histórico e Favoritos
Ator: Usuário
Objetivo: Armazenar roteiros bem-sucedidos e manter o controle das pesquisas recentes

Pré-condições:
- Possuir uma sessão ativa e ter realizado pelo menos uma pesquisa

Pós-condições:
- Script salvo na lista de favoritos ou histórico atualizado

Fluxo Principal:
1)Usuário marca um script gerado como favorito.
2)Sistema salva o roteiro na lista de Favoritos.
3)Usuário acessa a tela de Favoritos e visualiza a lista.
4)Sistema salva automaticamente a pesquisa no histórico em segundo plano.

Fluxos Alternativos:
A1) - Limite de histórico atingido
  1)Sistema detecta que o histórico atingiu 50 pesquisas.
  2)Exclui o registro mais antigo ao salvar a nova pesquisa.

A2) - Limpeza de histórico expirado
  1)Sistema identifica registros no histórico com mais de 7 dias.
  2)Deleta automaticamente os registros excedentes.

Regras de Negócio:
- RN06: O histórico deve armazenar apenas as últimas 50 pesquisas realizadas pelo usuário.

Requisitos Relacionados:
- RF10 Histórico
- RF11 Deletar Histórico
- RF12 Favoritar Scripts
- RF13 Lista de Favoritos
