import 'package:flutter/material.dart';
import '../viewmodel/forgot_password_viewmodel.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final ForgotPasswordViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ForgotPasswordViewModel();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color azulSmart = Color(0xFF11266C);
    const Color verdeSmart = Color(0xFF93C736);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: azulSmart),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/images/logo.jpg',
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 100),

              const Text(
                "Recuperar Senha",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: azulSmart,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Digite seu email para receber um link de redefinição de senha.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),

              const SizedBox(height: 40),

              Center(
                child: SizedBox(
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Email da conta",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: azulSmart,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: viewModel.emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF2B388F),
                          hintText: "exemplo@gmail.com",
                          hintStyle: const TextStyle(color: Colors.white70),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => viewModel.enviarEmailRecuperacao(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: verdeSmart,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Enviar Link",
                    style: TextStyle(
                      color: azulSmart,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
