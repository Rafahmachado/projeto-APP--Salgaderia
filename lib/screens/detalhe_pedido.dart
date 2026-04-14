import 'package:flutter/material.dart';

class DetalhesPage extends StatelessWidget {
  final String nome;
  final String preco;

  const DetalhesPage({super.key, required this.nome, required this.preco});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Center(child: Text("Detalhes de $nome")),
    );
  }
}
