import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 170,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color.fromARGB(255, 242, 185, 15), Color.fromARGB(255, 242, 185, 15)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 62,
                      backgroundColor: Color.fromARGB(255, 242, 164, 19),
                      child: CircleAvatar(
                        radius: 57,
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/images-person-m.png'),
                          radius: 57,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Herbert de Sousa Santos',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'RA: 4556-6765',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(158, 158, 158, 1),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Engenharia de Software',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),

            const SizedBox(height: 28),
            const Divider(indent: 20, endIndent: 20),
            const SizedBox(height: 12),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Conquistas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _ConquistaCard(
                      icone: Icons.center_focus_strong,
                      label: 'Foco',
                      cor: const Color.fromARGB(255, 242, 164, 19),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _ConquistaCard(
                      icone: Icons.star,
                      label: 'Disciplina',
                      cor: const Color.fromARGB(255, 242, 164, 19),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _ConquistaCard(
                      icone: Icons.code,
                      label: 'Código Limpo',
                      cor: const Color.fromARGB(255, 242, 164, 19),
                    ),
                  ),             
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _ConquistaCard extends StatelessWidget {
  final IconData icone;
  final String label;
  final Color cor;

  const _ConquistaCard({
    required this.icone,
    required this.label,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icone, color: cor, size: 32),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}