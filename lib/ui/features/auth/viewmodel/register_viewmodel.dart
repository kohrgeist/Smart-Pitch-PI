import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import '../../../../data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../app/routes/app_routes.dart';

class RegisterViewmodel extends ChangeNotifier {
  final AuthRepository _authRepository;

  final formKey = GlobalKey<FormState>();

  RegisterViewmodel({required AuthRepository authRepository})
    : _authRepository = authRepository;

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
            content: Text("Cadastro realizado com sucesso!"),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    } on FirebaseAuthException catch (e) {
      String mensagemErro = "Erro ao realizar o cadastro.";

      if (e.code == 'email-already-in-use') {
        mensagemErro = "Este e-mail já está sendo usado por outra conta.";
      } else if (e.code == 'weak-password') {
        mensagemErro = "A senha fornecida é muito fraca.";
      } else if (e.code == 'invalid-email') {
        mensagemErro = "O e-mail fornecido é inválido.";
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(mensagemErro), backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Ocorreu um erro inesperado. Tente novamente."),
            backgroundColor: Colors.red,
          ),
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
