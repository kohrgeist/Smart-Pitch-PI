import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_pitch/data/service/pitch_generator.dart';

class PitchLoadingViewModel extends ChangeNotifier {
  bool isLoading = true;
  String? errorMessage;
  String? generatedPitch;

  Future<void> generateAndSavePitch(String linkedinUrl, String siteUrl) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // 1. Chama a IA
      final pitchService = PitchService();
      final resultado = await pitchService.gerarPitchIntegrado(
        linkedinUrl,
        siteUrl,
      );

      // 2. Trata o erro da string
      if (resultado.startsWith('Erro')) {
        errorMessage = resultado;
        isLoading = false;
        notifyListeners();
        return;
      }

      // 3. Salva no histórico automaticamente
      await _salvarNoHistorico(resultado);

      generatedPitch = resultado;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      errorMessage = 'Erro inesperado: $e';
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _salvarNoHistorico(String pitch) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(user.uid)
            .collection('historico')
            .add({
              'pitch': pitch,
              'data_criacao': FieldValue.serverTimestamp(),
            });
      } catch (e) {
        debugPrint('Erro ao salvar no histórico: $e');
      }
    }
  }
}
