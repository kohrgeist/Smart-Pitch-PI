import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoricoViewModel extends ChangeNotifier {
  final user = FirebaseAuth.instance.currentUser;

  // Retorna um fluxo contínuo (Stream) do Firestore, ordenando os registros do histórico do mais recente para o mais antigo
  Stream<QuerySnapshot>? getHistoricoStream() {
    if (user == null) return null;
    return FirebaseFirestore.instance
        .collection('usuarios')
        .doc(user!.uid)
        .collection('historico')
        .orderBy('data_criacao', descending: true)
        .snapshots();
  }

  Future<void> deletarPitch(String docId) async {
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user!.uid)
          .collection('historico')
          .doc(docId)
          .delete();
    }
  }
}
