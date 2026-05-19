import 'package:flutter/material.dart';
import '../../../../app/routes/app_routes.dart';
import '../viewmodel/pitch_loading_viewmodel.dart';

class PitchLoadingPage extends StatefulWidget {
  const PitchLoadingPage({super.key});

  @override
  State<PitchLoadingPage> createState() => _PitchLoadingPageState();
}

class _PitchLoadingPageState extends State<PitchLoadingPage> {
  final PitchLoadingViewModel _viewModel = PitchLoadingViewModel();

  @override
  void initState() {
    super.initState();

    _viewModel.addListener(_onViewModelChange);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _iniciarGeracao();
    });
  } //Garante que a função de geração de Pitch via IA comece a rodar imediatamente após a tela de Loading ser desenhada pela primeira vez

  @override
  void dispose() {
    _viewModel.removeListener(_onViewModelChange);
    _viewModel.dispose();
    super.dispose();
  }

  void _onViewModelChange() {
    if (!mounted) return;
    // Observa a ViewModel. Redireciona para a tela de Erro ou para a tela do Pitch Pronto com base no resultado da IA
    if (_viewModel.errorMessage != null) {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.erro,
        arguments: _viewModel.errorMessage,
      );
    } else if (_viewModel.generatedPitch != null) {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.pitch,
        arguments: _viewModel.generatedPitch,
      );
    }
  }

  Future<void> _iniciarGeracao() async {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      final linkedinUrl = args['linkedin'] as String;
      final siteUrl = args['site'] as String;

      // Chama a lógica do viewmodel
      await _viewModel.generateAndSavePitch(linkedinUrl, siteUrl);
    } else {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.erro);
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
