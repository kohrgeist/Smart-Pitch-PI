import 'package:flutter/material.dart';
<<<<<<< HEAD:lib/ui/features/auth/view/favorites_page.dart
import '../../../../app/routes/app_routes.dart';
=======
>>>>>>> 2017b10261579575fa65db890d58a21a0cc11871:lib/features/auth/view/favorites_page.dart

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> favoritos = [
      "Roberto Almeida Santos",
      "Carmen Guimarães Dias",
    ];

    final List<String> historicoDesativado = [
      "Matheus Felipe Aguiar",
      "Luís Inácio Lula da Silva",
      "Vladimir Putin",
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Histórico de Pesquisas",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF11266C),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Barra de Pesquisa
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFF11266C),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: const Color(0xFF93C736),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF93C736),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Text(
                        "Pesquisar...",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    const Icon(Icons.search, color: Color(0xFF93C736)),
                    const SizedBox(width: 15),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  // Box Verde de Favoritos
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF93C736),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        // Título Favoritos Azul
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF11266C),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              "Favoritos",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Lista de Favoritos
                        ...favoritos.map(
                          (nome) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: _buildListItem(nome, isFavorite: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Histórico Opaco (Desativado)
                  ...historicoDesativado.asMap().entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildListItem(
                        entry.value,
                        number: entry.key + 4,
                        isOpaco: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Navigation (Botões) - Note o botão "Voltar" no meio
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNavButton(Icons.person, "Perfil", () {}),
                  const SizedBox(width: 10),
                  _buildNavButton(Icons.menu, "Voltar", () {
                    Navigator.pop(context);
                  }),
                  const SizedBox(width: 10),
                  _buildNavButton(Icons.home, "Home", () {
                    Navigator.pushNamed(context, '/home');
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(
    String nome, {
    bool isFavorite = false,
    int? number,
    bool isOpaco = false,
  }) {
    return Opacity(
      opacity: isOpaco ? 0.5 : 1.0,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFF11266C),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            // Bolinha da esquerda (Estrela ou Número)
            Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: isFavorite
                    ? const Icon(
                        Icons.star_border,
                        color: Colors.orange,
                        size: 20,
                      )
                    : Text(
                        "$number",
                        style: const TextStyle(
                          color: Color(0xFF11266C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 15),
            // Nome
            Expanded(
              child: Text(
                nome,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Ícone de Perfil
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isOpaco ? Colors.transparent : const Color(0xFF93C736),
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.person_outline,
                color: Color(0xFF11266C),
                size: 30,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF11266C),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 5),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
