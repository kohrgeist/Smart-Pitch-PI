import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../app/routes/app_routes.dart';

class RegisterViewmodel extends ChangeNotifier {
  final AuthRepository _authRepository;

  RegisterViewmodel({required AuthRepository authRepository})
    : _authRepository = authRepository;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool confirmObscurePassword = true;
  bool isLoading = false;

  String? emailValidator(String? value) => Validatorless.multiple([
    Validatorless.required('Email é obrigatório'),
    Validatorless.email('Digite um email válido'),
  ])(value);

  String? passwordValidator(String? value) => Validatorless.multiple([
    Validatorless.required('Senha é obrigatória'),
    Validatorless.min(6, 'A senha deve ter pelo menos 6 caracteres'),
  ])(value);

  String? confirmPasswordValidator(String? value) => Validatorless.multiple([
    Validatorless.required('Confirmação é obrigatória'),
    Validatorless.compare(passwordController, 'As senhas não coincidem'),
  ])(value);

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    confirmObscurePassword = !confirmObscurePassword;
    notifyListeners();
  }

  Future<void> onRegisterPressed(BuildContext context) async {
    final formValid = formKey.currentState?.validate() ?? false;
    if (!formValid) return;

    isLoading = true;
    notifyListeners();

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      await _authRepository.register(email: email, password: password);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Conta criada com sucesso!"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }
    } on FirebaseAuthException catch (e) {
      String message = "Erro ao cadastrar";
      if (e.code == 'email-already-in-use') {
        message = "Este e-mail já está em uso.";
      } else if (e.code == 'weak-password') {
        message = "A senha é muito fraca.";
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.red),
        );
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
