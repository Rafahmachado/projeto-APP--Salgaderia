// import 'package:flutter/material.dart';
// import 'screens/login.dart';
// import 'screens/cadastro.dart';
// import 'screens/produtos.dart';
// import 'screens/detalhe_produto.dart';
// import 'screens/carrinho.dart';
// import 'screens/perfil.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Deisy Salgados',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       // Tela inicial
//       initialRoute: '/login',
//       // Rotas do app
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/cadastro': (context) => CadastroPage(),
//         '/produtos': (context) => PedidoPage(),
//         '/detalhe': (context) => DetalhePedidoPage(),
//         '/carrinho': (context) => CarrinhoPage(),
//         '/perfil': (context) => PerfilPage(),
//       },
//     );
//   }
// }


// // import 'package:flutter/material.dart';
// // import 'screens/login.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Deisy Salgados',
// //       theme: ThemeData(primarySwatch: Colors.orange),
// //       home: const LoginScreen(), // abre direto a tela de login
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/cadastro.dart';
import 'screens/pedido.dart';
import 'screens/detalhe_pedido.dart';
import 'screens/carrinho.dart';
import 'screens/perfil.dart';
import 'screens/usuarios.dart'; // Importa a classe Usuario para uso futuro


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deisy Salgados',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // Tela inicial
      initialRoute: '/login',
      // Rotas do app
      routes: {
        '/login': (context) => const LoginScreens(),
        '/cadastro': (context) => const CadastroPage(),
        '/pedido': (context) => const PedidoPage(),
        '/carrinho': (context) => const CarrinhoPage(),
        '/perfil': (context) => const PerfilPage(),
        '/detalhe': (context) => const DetalhesPage(nome: "Produto", preco: "R\$ 0,00"), // Exemplo de rota para detalhes
        '/usuarios': (context) => const UsuariosPage(), // Rota para a tela de usuários, se necessário 
      },
    );
  }
}
