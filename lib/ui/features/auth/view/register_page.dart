import '../../../../data/service/auth_service_impl.dart';
import '../../../../data/repositories/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import '../viewmodel/register_viewmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterViewmodel viewModel;

  // O método initState é chamado apenas quando a tela é inserida na árvore de widgets.
  @override
  void initState() {
    super.initState();

    // Serviço de autenticação
    final authService = AuthServiceImpl();

    // repositório de autenticação
    final authRepository = AuthRepositoryImpl(authService);

    // viewmodel de registro
    viewModel = RegisterViewmodel(authRepository: authRepository);
  }

  // O método dispose é chamado quando a tela é destruída
  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  // interface principal da tela, com os campos para registro
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (_, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24),

                    Center(
                      child: Image.asset(
                        'assets/images/logo.jpg',
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 80),

                    const Center(
                      child: Text(
                        "Crie sua conta",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF11266C),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Campo para o E-mail
                    const Text(
                      "E-mail",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: viewModel.emailController,
                      validator: viewModel.emailValidator,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.white),
                      decoration: _inputDecoration("Seu email.."),
                    ),

                    const SizedBox(height: 20),

                    // Campo para a Senha
                    const Text(
                      "Senha",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: viewModel.passwordController,
                      obscureText: viewModel.obscurePassword,
                      validator: viewModel.passwordValidator,
                      style: const TextStyle(color: Colors.white),
                      decoration: _inputDecoration("Sua senha..").copyWith(
                        suffixIcon: IconButton(
                          onPressed: viewModel.togglePasswordVisibility,
                          icon: Icon(
                            viewModel.obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color.fromARGB(197, 219, 219, 219),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Campo para confirmar Senha
                    const Text(
                      "Confirmar Senha",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: viewModel.confirmPasswordController,
                      obscureText: viewModel.confirmObscurePassword,
                      validator: viewModel.confirmPasswordValidator,
                      style: const TextStyle(color: Colors.white),
                      decoration: _inputDecoration("Confirme sua senha..")
                          .copyWith(
                            suffixIcon: IconButton(
                              onPressed:
                                  viewModel.toggleConfirmPasswordVisibility,
                              icon: Icon(
                                viewModel.confirmObscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color.fromARGB(197, 219, 219, 219),
                              ),
                            ),
                          ),
                    ),

                    const SizedBox(height: 40),

                    // Botão de registrar
                    InkWell(
                      onTap: viewModel.isLoading
                          ? null
                          : () {
                              viewModel.onRegisterPressed(context);
                            },
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: const Color(0xFF9DCC3B),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: const Color(0xFF11266C),
                            width: 1.5,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: viewModel.isLoading
                            ? const CircularProgressIndicator(
                                color: Color(0xFF11266C),
                              )
                            : const Text(
                                "Registrar",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  color: Color(0xFF11266C),
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Botão Voltar para Login
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Já tem uma conta? Faça login",
                        style: TextStyle(color: Color(0xFF11266C)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Função para não repetir código de estilo de input, encapsulando o design repetitivo dos campos de texto
  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFF2B388F),
      hintText: hintText,
      hintStyle: const TextStyle(color: Color.fromARGB(197, 219, 219, 219)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
    );
  }
}
