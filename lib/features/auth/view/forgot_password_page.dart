import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Logo atualizada
              Center(
                child: Image.asset(
                  'assets/images/logo.jpg',
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 150),
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
                          color: Color(0xFF11266C),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF2B388F),
                          hintText: "teste@gmail.com",
                          hintStyle: const TextStyle(color: Colors.white70),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF93C736),
                ),
                child: const Text(
                  "Verificar Email",
                  style: TextStyle(color: Color(0xFF11266C)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
