import 'package:flutter/material.dart';
//import 'package:smart_pitch/ui/widgets/botao.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //fundo
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0), //distancia das laterais
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24), //distancia de cima e baixo
              // --- LOGO ---
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2B388F),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "S",
                        style: TextStyle(
                          color: Colors.white,
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
                        color: Color(0xFF2B388F),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 180,
              ), //distancia da logo para os proximos campos
              // --- CAMPOS DE TEXTO ---
              //email
              const Text(
                "E-mail",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ), //distancia do texto para o conteiner do email
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF2B388F),
                  borderRadius: BorderRadius.circular(10), // arredondamento
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ), //distancia do texto de dentro das beiradas do quadrado
                alignment: Alignment
                    .centerLeft, //texto mais para a esquerda do meio do conteiner
                child: const Text(
                  "seu email",
                  style: TextStyle(
                    color: Color.fromARGB(197, 219, 219, 219),
                  ), //cor do texto cinza para parecer
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Senha",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF2B388F),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment
                    .centerLeft, //texto mais para a esquerda do meio do conteiner
                child: const Text(
                  "sua senha",
                  style: TextStyle(color: Color.fromARGB(197, 219, 219, 219)),
                ),
              ),
              const SizedBox(
                height: 40,
              ), //distancia do email e senha para os botoes entrar e registrar
              // --- BOTOES --- \\
              Container(
                //conteiner de botão de entrar
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0xFF9DCC3B),
                  borderRadius: BorderRadius.circular(25), //borda redonda
                  border: Border.all(color: Colors.black, width: 1.5),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Entrar",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
              ),

              const SizedBox(
                height: 15,
              ), //distancia do container de entrar e registrar

              Container(
                //conteiner de registrar
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0xFF9DCC3B),
                  borderRadius: BorderRadius.circular(25), //borda redonda
                  border: Border.all(
                    color: Colors.black,
                    width: 1.5,
                  ), //borda colorida e tamanha
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Registrar",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
