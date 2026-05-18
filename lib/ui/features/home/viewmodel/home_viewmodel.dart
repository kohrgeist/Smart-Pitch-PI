import 'package:flutter/material.dart';
import '../../../../app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeViewModel extends ChangeNotifier {
  final TextEditingController linkedinController = TextEditingController();
  final TextEditingController siteController = TextEditingController();

  bool Function()? checkAuthOverride;

  void onPesquisarPressed(BuildContext context) {
    final linkedin = linkedinController.text.trim();
    final site = siteController.text.trim();

    // Validação de campos obrigatórios
    if (linkedin.isEmpty || site.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha as duas URLs!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Verifica se o usuário está logado
    final isLogged = checkAuthOverride != null
        ? checkAuthOverride!()
        : FirebaseAuth.instance.currentUser != null;
    if (!isLogged) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Você precisa estar logado!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Avança apenas se estiver tudo certo
    Navigator.pushNamed(
      context,
      AppRoutes.pitchLoading,
      arguments: {'linkedin': linkedin, 'site': site},
    );
  }

  @override
  void dispose() {
    linkedinController.dispose();
    siteController.dispose();
    super.dispose();
  }
}
