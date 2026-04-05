import 'package:flutter/material.dart';
import 'detalhes_sessao_screen.dart';

class SessaoEstudo {
  final String tecnologia;
  final double horas;

  SessaoEstudo({required this.tecnologia, required this.horas});
}

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final TextEditingController _ctrlTecnologia = TextEditingController();
  final TextEditingController _ctrlHoras = TextEditingController();

  final List<SessaoEstudo> _sessoes = [];
  double _totalHoras = 0;

  void _registrarSessao() {
    final String tecnologia = _ctrlTecnologia.text.trim();
    final String horasTexto = _ctrlHoras.text.trim();

    if (tecnologia.isEmpty || horasTexto.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos!')),
      );
      return;
    }

    final double? horas = double.tryParse(horasTexto);
    if (horas == null || horas <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Informe um número de horas válido (maior que zero)!')),
      );
      return;
    }

    setState(() {
      _sessoes.add(SessaoEstudo(tecnologia: tecnologia, horas: horas));
      _totalHoras += horas;
      _ctrlTecnologia.clear();
      _ctrlHoras.clear();
    });
  }

  @override
  void dispose() {
    _ctrlTecnologia.dispose();
    _ctrlHoras.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Estudos'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 242, 185, 15),
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: const Color.fromARGB(255, 242, 164, 19),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.timer, color: Color.fromRGBO(255, 255, 255, 1), size: 36),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total de Horas Estudadas',
                          style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.702), fontSize: 14),
                        ),
                        Text(
                          '${_totalHoras.toStringAsFixed(1)}h',
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _ctrlTecnologia,
              decoration: const InputDecoration(
                labelText: 'Tecnologia / Linguagem',
                hintText: 'Ex: Dart, Java, SQL',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.code),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: _ctrlHoras,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Horas Estudadas',
                hintText: 'Ex: 2.5',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.access_time),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _registrarSessao,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 242, 164, 19),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.add),
                label: const Text(
                  'Registrar Sessão',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Divider(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Histórico de Sessões',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 242, 164, 19),
                ),
              ),
            ),
            const SizedBox(height: 8),

            Expanded(
              child: _sessoes.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhuma sessão registrada ainda.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _sessoes.length,
                      itemBuilder: (context, index) {
                        final sessao = _sessoes[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            leading: const Icon(
                              Icons.laptop_mac,
                              color: Color.fromARGB(255, 242, 185, 15),
                            ),
                            title: Text(
                              sessao.tecnologia,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('${sessao.horas.toStringAsFixed(1)} hora(s)'),
                            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetalhesSessaoScreen(
                                    tecnologia: sessao.tecnologia,
                                    horas: sessao.horas,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}