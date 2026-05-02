import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../app/routes/app_routes.dart';

class LoginViewmodel extends ChangeNotifier {
  final AuthRepository _authRepository;

  LoginViewmodel({required AuthRepository authRepository})
    : _authRepository = authRepository;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  String? emailValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('E-mail é obrigatório'),
      Validatorless.email('Digite um e-mail válido'),
    ])(value);
  }

  String? passwordValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('A senha é obrigatória!'),
      Validatorless.min(6, 'A senha deve ter pelo menos 6 caracteres'),
    ])(value);
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<void> onLoginPressed(BuildContext context) async {
    final formValid = formKey.currentState?.validate() ?? false;
    if (!formValid) return;

    isLoading = true;
    notifyListeners();

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      await _authRepository.login(email: email, password: password);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login realizado com sucesso!"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }
    } on FirebaseAuthException catch (e) {
      String mensagemErro = "Erro ao realizar login.";

      if (e.code == 'user-not-found' || e.code == 'invalid-credential') {
        mensagemErro = "E-mail não encontrado ou senha incorreta.";
      } else if (e.code == 'too-many-requests') {
        mensagemErro = "Muitas tentativas falhas! Tente novamente mais tarde.";
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
            content: Text("Ops! Parece que ocorreu um erro."),
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
    super.dispose();
  }
}
