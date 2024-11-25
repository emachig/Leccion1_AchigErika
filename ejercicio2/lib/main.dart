import 'package:ejercicio2/pages/probabilidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comparar Números',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProbabilidadPage(),
    );
  }
}
