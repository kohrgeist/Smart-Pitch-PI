import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color azulSmart = Color(0xFF11266C);
    const Color verdeSmart = Color(0xFF93C736);
    const Color cinzaFundo = Color(0xFFF6F6F6);

    return Scaffold(
      backgroundColor: cinzaFundo,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFF2E9F5), // Tom suave do figma
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "Início",
            style: TextStyle(color: azulSmart, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined, color: azulSmart, size: 30),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.perfil), // Defina essa rota no seu app_routes
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 60),
            const Text(
              "Comece a pesquisar",
              style: TextStyle(
                fontSize: 26,
                color: azulSmart,
                fontWeight: FontWeight.bold,
                fontFamily: 'Georgia', // Ou a fonte serifada do seu projeto
              ),
            ),
            const SizedBox(height: 40),
            _buildTextField("URL do Linkedin"),
            const SizedBox(height: 15),
            _buildTextField("URL site da empresa"),
            const SizedBox(height: 80),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: verdeSmart,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: azulSmart, width: 2),
                  ),
                  elevation: 5,
                ),
                onPressed: () => Navigator.pushNamed(context, AppRoutes.pitchLoading),
                child: const Text(
                  "Pesquisar",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: azulSmart,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF1C2D6B),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    const Color azulSmart = Color(0xFF11266C);
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: azulSmart,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.person, "Perfil", () => Navigator.pushNamed(context, AppRoutes.perfil)),
          _navItem(Icons.star_border, "Favoritos", () => Navigator.pushNamed(context, AppRoutes.favoritos)),
          _navItem(Icons.menu, "Histórico", () => Navigator.pushNamed(context, AppRoutes.historico)),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}