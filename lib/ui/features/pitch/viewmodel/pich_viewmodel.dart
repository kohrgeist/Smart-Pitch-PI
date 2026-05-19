import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PitchViewModel extends ChangeNotifier {
  bool isFavorito = false;
  String? documentId;
  bool isLoadingFav = false;

  // Gerencia a ação de salvar ou remover um pitch da lista de Favoritos
  Future<void> toggleFavorito(String pitchGerado, BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;

    // Verifica se o usuário está logado
    if (user == null) {
      if (context.mounted) {
        _showSnackBar(context, 'Você precisa estar logado!', Colors.redAccent);
      }
      return;
    }

    isLoadingFav = true;
    notifyListeners();

    try {
      // Acessa a subcoleção 'favoritos' do usuário logado no Firestore
      final collection = FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user.uid)
          .collection('favoritos');

      // Se já é favorito, deleta o documento pelo ID. Caso contrário, adiciona um novo documento
      if (isFavorito && documentId != null) {
        // remove dos favoritos
        await collection.doc(documentId).delete();
        isFavorito = false;
        documentId = null;

        if (context.mounted) {
          _showSnackBar(context, 'Removido dos favoritos!', Colors.orange);
        }
      } else {
        // Add favoritos
        final docRef = await collection.add({
          'pitch': pitchGerado,
          'data_criacao': FieldValue.serverTimestamp(),
        });
        isFavorito = true;
        documentId = docRef.id;

        if (context.mounted) {
          _showSnackBar(context, 'Salvo com sucesso!', const Color(0xFF93C736));
        }
      }
    } catch (e) {
      if (context.mounted) {
        _showSnackBar(context, 'Erro ao processar: $e', Colors.redAccent);
      }
    } finally {
      isLoadingFav = false;
      notifyListeners();
    }
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    // Verifica se o widget ainda está na árvore antes de mostrar a SnackBar
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
