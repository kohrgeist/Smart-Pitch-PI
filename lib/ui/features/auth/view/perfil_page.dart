import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: azulSmart),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Meu Perfil",
          style: TextStyle(color: azulSmart, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Logo / Avatar central baseado no Figma
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    color: azulSmart,
                    shape: BoxShape.circle,
                    border: Border.all(color: verdeSmart, width: 4),
                  ),
                ),
                const Icon(Icons.person, size: 100, color: verdeSmart),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Usuário SmartPitch",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: azulSmart,
              ),
            ),
            const SizedBox(height: 40),
            // Opções de Perfil
            _buildProfileOption(Icons.edit, "Editar Dados"),
            _buildProfileOption(Icons.notifications_outlined, "Notificações"),
            _buildProfileOption(Icons.security, "Privacidade"),
            const Spacer(),
            // Logo do projeto no rodapé
            Image.asset(
              "assets/images/logo.jpg",
              height: 60,
              errorBuilder: (context, error, stackTrace) =>
                  const Text("SmartPitch"),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF11266C)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
