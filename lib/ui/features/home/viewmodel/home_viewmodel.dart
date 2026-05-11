import 'package:flutter/material.dart';
import '../../../../app/routes/app_routes.dart';

class HomeViewModel extends ChangeNotifier {
  final TextEditingController linkedinController = TextEditingController();
  final TextEditingController siteController = TextEditingController();

  void onPesquisarPressed(BuildContext context) {
    final linkedin = linkedinController.text.trim();
    final site = siteController.text.trim();

    if (linkedin.isEmpty || site.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha as duas URLs!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

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
