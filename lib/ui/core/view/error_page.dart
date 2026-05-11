import 'package:flutter/material.dart';
import '../../../../app/routes/app_routes.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mensagemDeErro =
        ModalRoute.of(context)?.settings.arguments as String? ??
        "Parece que ocorreu um erro desconhecido.";

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Oops!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF11266C),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                mensagemDeErro,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 40),
              const Icon(
                Icons.grid_view_rounded,
                size: 100,
                color: Color(0xFF11266C),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, AppRoutes.login),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF93C736),
                ),
                child: const Text(
                  "Voltar ao início",
                  style: TextStyle(color: Color(0xFF11266C)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
