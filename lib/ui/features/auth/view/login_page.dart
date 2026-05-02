import 'package:flutter/material.dart';
import '../../../../app/routes/app_routes.dart';
import '../viewmodel/login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginViewmodel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = LoginViewmodel();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFF11266C),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "SP",
                              style: TextStyle(
                                color: Color(0xFF93C736),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "SmartPitch",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF11266C),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 120),
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
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF2B388F),
                        hintText: "seu email",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(197, 219, 219, 219),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF2B388F),
                        hintText: "sua senha",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(197, 219, 219, 219),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 15,
                        ),
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
                    const SizedBox(height: 40),
                    InkWell(
                      onTap: viewModel.isLoading
                          ? null
                          : () {
                              if (viewModel.formKey.currentState?.validate() ??
                                  false) {
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoutes.home,
                                );
                              }
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
                                "Entrar",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  color: Color(0xFF11266C),
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.register);
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
                        child: const Text(
                          "Registrar",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Color(0xFF11266C),
                          ),
                        ),
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
}
