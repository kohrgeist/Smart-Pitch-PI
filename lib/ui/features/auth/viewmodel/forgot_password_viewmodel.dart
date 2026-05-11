import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();

  Future<void> enviarEmailRecuperacao(BuildContext context) async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, insira o email da conta!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Email de recuperação enviado! Verifique sua caixa de entrada.',
            ),
            backgroundColor: Color(0xFF93C736),
          ),
        );
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro: ${e.message}'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
