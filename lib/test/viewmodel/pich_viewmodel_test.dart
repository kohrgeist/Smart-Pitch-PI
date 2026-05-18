import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_pitch/app/routes/app_routes.dart';
import 'package:smart_pitch/ui/features/home/viewmodel/home_viewmodel.dart';
import 'package:smart_pitch/data/service/pitch_generator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: ".env");
  });

  group('HomeViewModel - Testes de Integração/Widget (CT01)', () {
    testWidgets('CT01 — Validar URL válida e Navegar para Pitch Loading', (
      WidgetTester tester,
    ) async {
      // ARRANGE
      final viewModel = HomeViewModel();

      // Entradas
      viewModel.linkedinController.text =
          "https://www.linkedin.com/in/marcos-hop/";
      viewModel.siteController.text = "https://www.liderkraft.com.br";

      bool navegouParaLoading = false;
      Map<String, dynamic>? argumentosPassados;

      // Montamos um app "falso" para simular o contexto de navegação
      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => Scaffold(
              body: Builder(
                builder: (ctx) => ElevatedButton(
                  onPressed: () => viewModel.onPesquisarPressed(ctx),
                  child: const Text('Gerar Pitch'),
                ),
              ),
            ),
            // Rota simulada (Mock) do Pitch Loading para interceptar os argumentos
            AppRoutes.pitchLoading: (context) {
              navegouParaLoading = true;
              argumentosPassados =
                  ModalRoute.of(context)?.settings.arguments
                      as Map<String, dynamic>?;
              return const Scaffold(body: Text('Tela de Loading'));
            },
          },
        ),
      );

      // ACT
      // Chamando a Função com tap (clcick)
      await tester.tap(find.text('Gerar Pitch'));
      await tester.pumpAndSettle();

      // ASSERT
      // 1. Valida se a navegação ocorreu
      expect(
        navegouParaLoading,
        isTrue,
        reason: 'Deveria ter navegado para a tela de Pitch Loading',
      );

      // 2. Valida se as URLs foram passadas corretamente nos argumentos
      expect(
        argumentosPassados?['linkedin'],
        "https://www.linkedin.com/in/marcos-hop/",
      );
      expect(argumentosPassados?['site'], "https://www.liderkraft.com.br");
    });
  });

  testWidgets('TC02 — Pesquisar sem usuário logado (Testando Código Real)', (
    WidgetTester tester,
  ) async {
    final viewModel = HomeViewModel();

    // ARRANGE
    viewModel.checkAuthOverride = () =>
        false; // Força o ViewModel a pensar que o usuário nao esta logado

    viewModel.linkedinController.text =
        "https://www.linkedin.com/in/marcos-hop/";
    viewModel.siteController.text = "https://www.liderkraft.com.br";

    bool navegouParaLoading = false;

    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/': (context) => Scaffold(
            body: Builder(
              builder: (ctx) => ElevatedButton(
                // ACT
                onPressed: () => viewModel.onPesquisarPressed(ctx),
                child: const Text('Pesquisar'),
              ),
            ),
          ),
          AppRoutes.pitchLoading: (context) {
            navegouParaLoading = true;
            return const SizedBox();
          },
        },
      ),
    );

    // Clica no botão
    await tester.tap(find.text('Pesquisar'));
    await tester.pump();

    // ASSERT
    // Valida se a mensagem de erro apareceu
    expect(find.text('Você precisa estar logado!'), findsOneWidget);

    // Valida se o sistema bloqueou a navegaçao
    expect(
      navegouParaLoading,
      isFalse,
      reason:
          'O código real bloqueia a navegação se o usuário não estiver logado.',
    );
  });

  test('TC03 — Validar URL incorreta', () async {
    // ARRANGE
    final pitchService = PitchService();
    const String urlLinkedinInvalida =
        "https://www.linkedin.com/in/marcos-hop/urlinvalidaa";
    const String urlSiteInvalida = "https://www.liderkraft.com.br/urlinvalidaa";

    // ACT
    final resultado = await pitchService.gerarPitchIntegrado(
      urlLinkedinInvalida,
      urlSiteInvalida,
    );

    // ASSERT
    expect(
      resultado.toLowerCase().contains('erro') ||
          resultado.toLowerCase().contains('impossibilidade'),
      isTrue,
      reason:
          'O sistema deve retornar uma mensagem de erro informando a impossibilidade de gerar a pesquisa devido à URL inválida.',
    );
  });
}
