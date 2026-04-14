import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  // Abre (ou cria) o banco de dados na raiz do projeto
  static Future<Database> abrirBanco() async {
    // Caminho fixo: raiz do projeto
    final path = join(Directory.current.path, 'usuarios.db');

    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE usuarios("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "nome TEXT, "
          "email TEXT, "
          "senha TEXT"
          ")",
        );
      },
      version: 1,
    );
  }

  // Insere um novo usuário
  static Future<void> inserirUsuario(String nome, String email, String senha) async {
    final db = await abrirBanco();
    await db.insert(
      'usuarios',
      {'nome': nome, 'email': email, 'senha': senha},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Lista todos os usuários cadastrados
  static Future<List<Map<String, dynamic>>> listarUsuarios() async {
    final db = await abrirBanco();
    return db.query('usuarios');
  }

  // Busca usuário por email e senha (para login)
  static Future<Map<String, dynamic>?> buscarUsuario(String email, String senha) async {
    final db = await abrirBanco();
    final res = await db.query(
      'usuarios',
      where: 'email = ? AND senha = ?',
      whereArgs: [email, senha],
    );
    if (res.isNotEmpty) {
      return res.first;
    }
    return null;
  }
}

