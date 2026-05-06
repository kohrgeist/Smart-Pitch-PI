import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../app/routes/app_routes.dart';

class HistoricoPage extends StatelessWidget {
  const HistoricoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color azulSmart = Color(0xFF11266C);
    const Color verdeSmart = Color(0xFF93C736);
    const Color cinzaFundo = Color(0xFFF6F6F6);

    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: cinzaFundo,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Favoritos",
          style: TextStyle(color: azulSmart, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: azulSmart),
      ),
      body: user == null
          ? const Center(
              child: Text(
                "Faça login para ver seu histórico.",
                style: TextStyle(color: azulSmart, fontSize: 16),
              ),
            )
          : StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('usuarios')
                  .doc(user.uid)
                  .collection('historico')
                  .orderBy('data_criacao', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: azulSmart),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Erro ao carregar os dados.",
                      style: TextStyle(color: Colors.red[800]),
                    ),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      "Você ainda não tem nenhum pitch gerado.",
                      style: TextStyle(color: azulSmart, fontSize: 16),
                    ),
                  );
                }

                final favoritos = snapshot.data!.docs;

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  itemCount: favoritos.length,
                  itemBuilder: (context, index) {
                    final doc = favoritos[index];
                    final pitchTexto = doc['pitch'] as String? ?? 'Sem texto';

                    return Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: azulSmart,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: verdeSmart, width: 2),
                      ),
                      child: ExpansionTile(
                        iconColor: verdeSmart,
                        collapsedIconColor: verdeSmart,
                        title: Row(
                          children: [
                            const Icon(Icons.star, color: verdeSmart, size: 24),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Pitch Salvo ${index + 1}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(13),
                                bottomRight: Radius.circular(13),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText(
                                  pitchTexto,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.redAccent,
                                    ),
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('usuarios')
                                          .doc(user.uid)
                                          .collection('historico')
                                          .doc(doc.id)
                                          .delete();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: azulSmart,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, AppRoutes.perfil),
              child: const Row(
                children: [
                  Icon(Icons.person, color: Colors.white, size: 20),
                  SizedBox(width: 4),
                  Text(
                    "Perfil",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, AppRoutes.historico),
              child: const Row(
                children: [
                  Icon(Icons.menu, color: Colors.white, size: 20),
                  SizedBox(width: 4),
                  Text(
                    "Favoritos",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (route) => false,
              ),
              child: const Row(
                children: [
                  Icon(Icons.home, color: Colors.white, size: 20),
                  SizedBox(width: 4),
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
