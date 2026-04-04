import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Favoritos",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF11266C),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFF11266C),
                  borderRadius: BorderRadius.circular(5),
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
                    const Text(
                      "Pesquisar...",
                      style: TextStyle(color: Colors.white),
                    ),
                    const Spacer(),
                    const Icon(Icons.search, color: Color(0xFF93C736)),
                    const SizedBox(width: 15),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: 50, color: Color(0xFF11266C)),
                    SizedBox(height: 10),
                    Text("Página de Favoritos", style: TextStyle(fontSize: 16)),
                    Text(
                      "(Em construção)",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF11266C),
                    ),
                    child: const Text(
                      "Voltar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.home),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF11266C),
                    ),
                    child: const Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
