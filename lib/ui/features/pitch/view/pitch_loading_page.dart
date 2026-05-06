import 'package:flutter/material.dart';
import 'package:smart_pitch/ui/features/home/viewmodel/pitch_generator.dart';
import '../../../../app/routes/app_routes.dart';

class PitchLoadingPage extends StatefulWidget {
  const PitchLoadingPage({super.key});

  @override
  State<PitchLoadingPage> createState() => _PitchLoadingPageState();
}

class _PitchLoadingPageState extends State<PitchLoadingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _iniciarGeracao();
    });
  }

  Future<void> _iniciarGeracao() async {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      final linkedinUrl = args['linkedin'] as String;
      final siteUrl = args['site'] as String;

      final resultado = await gerarPitchIntegrado(linkedinUrl, siteUrl);

      if (mounted) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.pitch,
          arguments: resultado,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Color(0xFF11266C)),
            SizedBox(height: 20),
            Text(
              "Analisando perfis e gerando pitch...",
              style: TextStyle(
                color: Color(0xFF11266C),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
