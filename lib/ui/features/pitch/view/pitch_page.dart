import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PitchPage extends StatelessWidget {
  const PitchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pitchGerado =
        ModalRoute.of(context)?.settings.arguments as String? ??
        'Nenhum pitch gerado.';

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF11266C)),
        title: const Text(
          "Pitch Gerado",
          style: TextStyle(
            color: Color(0xFF11266C),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: SelectableText(
                pitchGerado,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF333333),
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;

                if (user != null) {
                  try {
                    await FirebaseFirestore.instance
                        .collection('usuarios')
                        .doc(user.uid)
                        .collection('favoritos')
                        .add({
                          'pitch': pitchGerado,
                          'data_criacao': FieldValue.serverTimestamp(),
                        });

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Pitch salvo no Firebase com sucesso!'),
                          backgroundColor: Color(0xFF93C736),
                        ),
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Erro ao salvar no banco: $e')),
                      );
                    }
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Você precisa estar logado para favoritar!',
                      ),
                    ),
                  );
                }
              },
              child: const Text(
                "Favoritar",
                style: TextStyle(
                  color: Color(0xFF11266C),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
