import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class RegisterViewmodel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool confirmPasswordObscure = true;
  bool isLoading = false;

  String? emailValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Email é obrigatório'),
      Validatorless.email('Digite um email válido'),
    ])(value);
  }

  String? passwordValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Senha é obrigatória'),
      Validatorless.min(6, 'A senha deve ter pelo menos 6 caracteres'),
    ])(value);
  }

  String? confirmPasswordValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Confirmação de senha é obrigatória'),
      Validatorless.compare(passwordController, 'As senhas não são iguais'),
    ])(value);
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    confirmPasswordObscure = !confirmPasswordObscure;
    notifyListeners();
  }

  Future<void> onPressedRegister(BuildContext context) async {
    //Dispara todos os validadores. email, senha e confirmar senha
    final formValid = formKey.currentState?.validate() ?? false;

    if (!formValid) {
      return;
    }

    isLoading = true;
    notifyListeners();

    final emailDigitado = emailController.text.trim();
    final senhaValidationStatus = passwordController.text.trim();

    await Future.delayed(const Duration(seconds: 3));

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Cadastrado com sucesso!"),
          backgroundColor: Colors.green,
        ),
      );
    }
    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
