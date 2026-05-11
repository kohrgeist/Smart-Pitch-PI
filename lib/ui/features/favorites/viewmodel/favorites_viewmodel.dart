import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesViewModel extends ChangeNotifier {
  final user = FirebaseAuth.instance.currentUser;

  Stream<QuerySnapshot>? getFavoritosStream() {
    if (user == null) return null;

    return FirebaseFirestore.instance
        .collection('usuarios')
        .doc(user!.uid)
        .collection('favoritos')
        .orderBy('data_criacao', descending: true)
        .snapshots();
  }

  Future<void> deletarFavorito(String docId) async {
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user!.uid)
          .collection('favoritos')
          .doc(docId)
          .delete();
    }
  }
}
