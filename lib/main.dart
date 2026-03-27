import 'package:flutter/material.dart';
import 'ui/pages/splash_page.dart';
import 'ui/pages/login_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Projeto 01 - Smart Pitch",
      theme: ThemeData(useMaterial3: true),
      home:
          LoginPage(), // TODO Recriar LoginPage e criar RegisterPage, já com as rotas de navegação.
    ),
  );
}
