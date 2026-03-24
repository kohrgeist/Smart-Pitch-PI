import 'package:flutter/material.dart';
import 'ui/pages/splash.dart';
import 'ui/pages/login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Projeto 01 - Smart Pitch",
      theme: ThemeData(useMaterial3: true),
      home:
          SplashPage(), // trocar para SplashPage para alterar paginas já que nao tem botões de navegação..
    ),
  );
}
