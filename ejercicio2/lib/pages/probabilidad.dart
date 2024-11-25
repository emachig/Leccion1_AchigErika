import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProbabilidadPage extends StatefulWidget {
  const ProbabilidadPage({super.key});

  @override
  State<ProbabilidadPage> createState() => _ProbabilidadPageState();
}

class _ProbabilidadPageState extends State<ProbabilidadPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _num3Controller = TextEditingController();
  String _result = '';

  void _compareNumbers() {
    final num1 = double.tryParse(_num1Controller.text);
    final num2 = double.tryParse(_num2Controller.text);
    final num3 = double.tryParse(_num3Controller.text);

    if (num1 == null || num2 == null || num3 == null) {
      setState(() {
        _result = 'Por favor, ingresa números válidos.';
      });
      return;
    }

    double mayor;
    double menor;

    if (num1 >= num2 && num1 >= num3) {
      mayor = num1;
    } else if (num2 >= num1 && num2 >= num3) {
      mayor = num2;
    } else {
      mayor = num3;
    }

    if (num1 <= num2 && num1 <= num3) {
      menor = num1;
    } else if (num2 <= num1 && num2 <= num3) {
      menor = num2;
    } else {
      menor = num3;
    }

    setState(() {
      _result = 'Mayor: $mayor\nMenor: $menor';
    });
  }

  void _clearFields() {
    _num1Controller.clear();
    _num2Controller.clear();
    _num3Controller.clear();
    setState(() {
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparar Números'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              decoration: const InputDecoration(labelText: 'Número 1'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _num2Controller,
              decoration: const InputDecoration(labelText: 'Número 2'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _num3Controller,
              decoration: const InputDecoration(labelText: 'Número 3'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _compareNumbers,
                  child: const Text('Comparar'),
                ),
                ElevatedButton(
                  onPressed: _clearFields,
                  child: const Text('Borrar'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(_result),
          ],
        ),
      ),
    );
  }
}