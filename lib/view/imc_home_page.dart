import 'package:flutter/material.dart';
import '../controller/imc_controller.dart';

class ImcHomePage extends StatefulWidget {
  final VoidCallback toggleTheme;

  const ImcHomePage({super.key, required this.toggleTheme});

  @override
  State<ImcHomePage> createState() => _ImcHomePageState();
}

class _ImcHomePageState extends State<ImcHomePage> {
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();
  final _controller = ImcController();

  String _resultado = '';

  void _calcular() {
    setState(() {
      _resultado = _controller.calcularIMC(
        _pesoController.text,
        _alturaController.text,
      );
    });
  }

  void _reset() {
    setState(() {
      _pesoController.clear();
      _alturaController.clear();
      _resultado = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme,
            tooltip: 'Alternar tema',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Altura (m)',
                hintText: 'EX : 1.78 (usar ponto)',
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _calcular,
                  child: const Text('Calcular'),
                ),
                OutlinedButton(onPressed: _reset, child: const Text('Resetar')),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
