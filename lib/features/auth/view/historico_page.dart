import 'package:flutter/material.dart';

class HistoricoPage extends StatelessWidget {
  const HistoricoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista simulada de histórico
    final List<String> historico = [
      "Roberto Almeida Santos",
      "Carmen Guimarães Dias",
      "Trômplo Donaldo Junior",
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
            const SizedBox(height: 20),

            // Lista de Histórico
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: historico.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFF11266C),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          // Bolinha com número
                          Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                "${index + 1}",
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
                              historico[index],
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
                                color: const Color(0xFF93C736),
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
                },
              ),
            ),

            // Bottom Navigation (Botões)
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNavButton(Icons.person, "Perfil", () {}),
                  const SizedBox(width: 10),
                  _buildNavButton(Icons.star_border, "Favoritos", () {
                    Navigator.pushNamed(context, '/favoritos');
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
