import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PitchPage extends StatefulWidget {
  const PitchPage({super.key});

  @override
  State<PitchPage> createState() => _PitchPageState();
}

class _PitchPageState extends State<PitchPage> {
  bool _isFavorito = false;
  String? _documentId;
  bool _isLoadingFav = false;

  Future<void> _toggleFavorito(String pitchGerado) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Você precisa estar logado para favoritar!'),
        ),
      );
      return;
    }

    setState(() => _isLoadingFav = true);

    try {
      final collection = FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user.uid)
          .collection('favoritos');

      if (_isFavorito && _documentId != null) {
        // Remover dos favoritos
        await collection.doc(_documentId).delete();
        setState(() {
          _isFavorito = false;
          _documentId = null;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Removido dos favoritos!'),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      } else {
        // Adicionar aos favoritos
        final docRef = await collection.add({
          'pitch': pitchGerado,
          'data_criacao': FieldValue.serverTimestamp(),
        });
        setState(() {
          _isFavorito = true;
          _documentId = docRef.id;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Pitch salvo nos favoritos com sucesso!'),
              backgroundColor: Color(0xFF93C736),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao atualizar favoritos: $e')),
        );
      }
    } finally {
      setState(() => _isLoadingFav = false);
    }
  }

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
            _isLoadingFav
                ? const CircularProgressIndicator()
                : TextButton.icon(
                    onPressed: () => _toggleFavorito(pitchGerado),
                    icon: Icon(
                      _isFavorito ? Icons.star : Icons.star_border,
                      color: _isFavorito
                          ? const Color(0xFF93C736)
                          : const Color(0xFF11266C),
                    ),
                    label: Text(
                      _isFavorito ? "Desfavoritar" : "Favoritar",
                      style: TextStyle(
                        color: _isFavorito
                            ? const Color(0xFF93C736)
                            : const Color(0xFF11266C),
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
