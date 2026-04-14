import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class UsuariosPage extends StatelessWidget {
  const UsuariosPage({super.key});

  Future<List<Map<String, dynamic>>> _carregarUsuarios() async {
    return await DBHelper.listarUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Usuários cadastrados")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _carregarUsuarios(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final usuarios = snapshot.data!;
          if (usuarios.isEmpty) {
            return const Center(child: Text("Nenhum usuário cadastrado."));
          }
          return ListView.builder(
            itemCount: usuarios.length,
            itemBuilder: (context, index) {
              final u = usuarios[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.person, color: Colors.orange),
                  title: Text(u['nome']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email: ${u['email']}"),
                      if (u['celular'] != null) Text("Celular: ${u['celular']}"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
