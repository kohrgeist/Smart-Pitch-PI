import 'package:flutter/material.dart';

class PitchPage extends StatefulWidget {
  const PitchPage({super.key});

  @override
  State<PitchPage> createState() => _PitchPageState();
}

class _PitchPageState extends State<PitchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pitch'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text('Placeholder'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/historico');
              },
              child: const Text('Historico'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
