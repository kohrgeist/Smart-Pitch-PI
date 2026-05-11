import 'package:flutter/material.dart';
import '../../../../app/routes/app_routes.dart';
import '../viewmodel/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color azulSmart = Color(0xFF11266C);
    const Color verdeSmart = Color(0xFF93C736);
    const Color cinzaFundo = Color(0xFFF6F6F6);

    return AnimatedBuilder(
      animation: viewModel,
      builder: (_, _) {
        return Scaffold(
          backgroundColor: cinzaFundo,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.account_circle_outlined,
                  color: azulSmart,
                  size: 30,
                ),
                onPressed: () => Navigator.pushNamed(context, AppRoutes.perfil),
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
                    fontFamily: 'Georgia',
                  ),
                ),
                const SizedBox(height: 40),
                _buildTextField(
                  "URL do Linkedin",
                  viewModel.linkedinController,
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  "URL site da empresa",
                  viewModel.siteController,
                ),
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
                    onPressed: () => viewModel.onPesquisarPressed(context),
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
      },
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF1C2D6B),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
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
          _navItem(
            Icons.person,
            "Perfil",
            () => Navigator.pushNamed(context, AppRoutes.perfil),
          ),
          _navItem(
            Icons.star_border,
            "Favoritos",
            () => Navigator.pushNamed(context, AppRoutes.favoritos),
          ),
          _navItem(
            Icons.menu,
            "Histórico",
            () => Navigator.pushNamed(context, AppRoutes.historico),
          ),
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
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
