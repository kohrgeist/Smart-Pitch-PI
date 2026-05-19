import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_pitch/ui/features/pitch/viewmodel/pich_viewmodel.dart';

class PitchPage extends StatefulWidget {
  const PitchPage({super.key});

  @override
  State<PitchPage> createState() => _PitchPageState();
}

class _PitchPageState extends State<PitchPage> {
  late final PitchViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = PitchViewModel();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pitchGerado =
        ModalRoute.of(context)?.settings.arguments as String? ??
        'Nenhum pitch gerado.';
    const Color azulSmart = Color(0xFF11266C);

    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: const Color(0xFFF6F6F6),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: azulSmart),
            // Recupera a string do pitch gerado que foi passada como argumento através da rota anterior
            title: const Text(
              "Seu Cold Email",
              style: TextStyle(color: azulSmart, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  // Copia o texto gerado pela IA para a área de transferência do celular do usuário.
                  Clipboard.setData(ClipboardData(text: pitchGerado));
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('E-mail copiado!')),
                    );
                  }
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade300),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.email_outlined, color: azulSmart),
                          const SizedBox(width: 10),
                          Text(
                            "Rascunho Pronto",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 30),
                      SelectableText(
                        pitchGerado,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF333333),
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                viewModel.isLoadingFav
                    ? const CircularProgressIndicator(color: azulSmart)
                    : ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: viewModel.isFavorito
                              ? const Color(0xFF93C736)
                              : azulSmart,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () =>
                            viewModel.toggleFavorito(pitchGerado, context),
                        icon: Icon(
                          viewModel.isFavorito ? Icons.star : Icons.star_border,
                          color: Colors.white,
                        ),
                        label: Text(
                          viewModel.isFavorito
                              ? "Desfavoritar"
                              : "Salvar nos Favoritos",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
