import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PerfilViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userEmail {
    return _auth.currentUser?.email ?? "Usuário não identificado";
  }

  Future<void> deslogar() async {
    await _auth.signOut();
  }
}
