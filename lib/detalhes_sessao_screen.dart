import 'package:flutter/material.dart';

class DetalhesSessaoScreen extends StatelessWidget {
  final String tecnologia;
  final double horas;

  const DetalhesSessaoScreen({
    super.key,
    required this.tecnologia,
    required this.horas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Sessão'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 242, 164, 19),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Icon(
                Icons.laptop_mac,
                size: 80,
                color: Color.fromARGB(255, 242, 185, 15),
              ),
            ),
            const SizedBox(height: 24),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Text(
                      'Tecnologia / Linguagem',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      tecnologia,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(height: 32),
                    const Text(
                      'Horas Estudadas',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${horas.toStringAsFixed(1)}h',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 242, 185, 15),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Voltar', style: TextStyle(fontSize: 16)),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}