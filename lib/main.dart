import 'package:flutter/material.dart';
import 'app/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Garante que os bindings do Flutter sejam inicializados antes de executar funções assíncronas no main.

  await dotenv.load(
    fileName: ".env",
  ); // Carrega as variáveis de ambiente (chaves de API) do arquivo .env.

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Inicializa a conexão com o projeto do Firebase usando as configurações específicas da plataforma.

  runApp(const AppWidget());
}
