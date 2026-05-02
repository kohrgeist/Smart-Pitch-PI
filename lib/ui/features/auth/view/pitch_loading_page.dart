import 'package:flutter/material.dart';
import 'package:smart_pitch/app/routes/app_routes.dart';

class PitchLoadingPage extends StatelessWidget {
  const PitchLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, AppRoutes.pitch);
        }
      },
    ); //TODO: Aguarda 3 segundos e vai para Pitch, quando inserirmos IA, vamos alterar isso.
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo atualizada (ícone de pesquisa substituído)
            Center(
              child: Image.asset(
                'assets/images/logo.jpg',
                height: 80,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 24),
            const Center(
              child: CircularProgressIndicator(color: Color(0xFF9DCC3B)),
            ),
            const SizedBox(height: 30),
            const Text(
              "A cruzar dados com o Playbook...",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF11266C),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancelar",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
