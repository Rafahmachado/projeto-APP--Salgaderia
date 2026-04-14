import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  Future<void> _login() async {
    final usuario = await DBHelper.buscarUsuario(
      emailController.text.trim(),
      senhaController.text.trim(),
    );

    if (usuario != null) {
      // Login válido → vai para a tela de pedidos
      Navigator.pushReplacementNamed(context, '/pedido');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('E-mail ou senha inválidos')),
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
            // --- PARTE SUPERIOR: LOGO E NOME ---
            Container(
              height: 350,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB71C1C),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.water_drop,
                        size: 70,
                        color: Color(0xFFFFD54F),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Deisy',
                    style: TextStyle(
                      fontSize: 45,
                      height: 0.9,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Salgados',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFB71C1C),
                    ),
                  ),
                ],
              ),
            ),

            // --- PARTE BRANCA: FORMULÁRIO ---
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text("E-mail", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  _campoEntrada(controller: emailController, icon: Icons.email_outlined),

                  const SizedBox(height: 20),

                  const Text("Senha", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  _campoEntrada(controller: senhaController, icon: Icons.lock_outline, ocultar: true),

                  const SizedBox(height: 30),

                  // --- BOTÃO ENTRAR ---
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 3,
                      ),
                      onPressed: _login,
                      child: const Text(
                        'Entrar',
                        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // lógica de esqueci senha
                      },
                      child: const Text(
                        'Esqueceu a senha?',
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Ou", style: TextStyle(color: Colors.grey)),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // --- BOTÃO CRIAR CONTA ---
                  SizedBox(
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/cadastro');
                      },
                      child: const Text(
                        'Criar conta',
                        style: TextStyle(color: Colors.orange, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
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

  Widget _campoEntrada({
    required TextEditingController controller,
    required IconData icon,
    bool ocultar = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: ocultar,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),
        suffixIcon: ocultar ? const Icon(Icons.visibility_outlined, color: Colors.grey) : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}


