import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _nomeController = TextEditingController();
  final _celularController = TextEditingController();
  final _cpfController = TextEditingController();

  Future<void> _cadastrarUsuario() async {
    try {
      await DBHelper.inserirUsuario(
        _nomeController.text,
        _emailController.text,
        _senhaController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuário cadastrado com sucesso!")),
      );

      // Limpa os campos
      _emailController.clear();
      _senhaController.clear();
      _nomeController.clear();
      _celularController.clear();
      _cpfController.clear();

      // Redireciona para login
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao salvar: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cabeçalho
            Container(
              height: 250,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Cadastro',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB71C1C),
                  ),
                ),
              ),
            ),
            
            // Formulário 
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
              ),
              child: Column(
                children: [
                  _campo(label: 'E-mail', icon: Icons.email_outlined, controller: _emailController),
                  const SizedBox(height: 15),
                  
                  _campo(label: 'Senha', icon: Icons.lock_outline, controller: _senhaController, pass: true),
                  const SizedBox(height: 15),
                  
                  _campo(label: 'Nome', icon: Icons.person_outline, controller: _nomeController),
                  const SizedBox(height: 15),
                  
                  _campo(label: 'Celular', icon: Icons.phone_android_outlined, controller: _celularController),
                  const SizedBox(height: 15),
                  
                  _campo(label: 'CPF', icon: Icons.assignment_ind_outlined, controller: _cpfController),
                  
                  const SizedBox(height: 30),
                  
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      onPressed: _cadastrarUsuario,
                      child: const Text(
                        'Cadastrar usuário', 
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 18, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Já tem uma conta? Entre aqui',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para os campos
  Widget _campo({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    bool pass = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: pass,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.orange),
        suffixIcon: pass ? const Icon(Icons.visibility_off, color: Colors.grey) : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}
