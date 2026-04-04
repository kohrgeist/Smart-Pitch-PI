import 'package:flutter/material.dart';
import 'package:smart_pitch/app/routes/app_routes.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoState();
}

class _HistoricoState extends State<HistoricoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Histórico')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(child: Placeholder()),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Home'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/favorites');
              },
              child: const Text('Favoritos'),
            ),
          ],
        ),
      ),
    );
  }
}
