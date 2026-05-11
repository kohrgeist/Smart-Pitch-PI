import 'package:flutter/material.dart';
import '../../../../app/routes/app_routes.dart';
import '../viewmodel/perfil_viewmodel.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  late final PerfilViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = PerfilViewModel();
  }

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

            Text(
              viewModel.userEmail,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: azulSmart,
              ),
            ),
            const SizedBox(height: 40),

            _buildProfileOption(
              Icons.lock_reset,
              "Esqueci a senha",
              () => Navigator.pushNamed(context, AppRoutes.esqueciSenha),
            ),

            _buildProfileOption(Icons.exit_to_app, "Sair do App", () async {
              await viewModel.deslogar();
              if (context.mounted) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.login,
                  (route) => false,
                );
              }
            }),

            const Spacer(),
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

  Widget _buildProfileOption(IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF11266C)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
