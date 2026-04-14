// import 'package:flutter/material.dart';
// import 'detalhe_pedido.dart'; // importa a tela de detalhes

// class PedidosPage extends StatelessWidget {
//   const PedidosPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.orange,
//       body: SafeArea(
//         child: Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.all(20),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Meus Pedidos",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFFB71C1C),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
//                 ),
//                 child: ListView(
//                   padding: const EdgeInsets.only(top: 25),
//                   children: [
//                     _itemPedido(context, "Pedido #1234", "Finalizado", "15/03/2026", "R\$ 25,50"),
//                     _itemPedido(context, "Pedido #1235", "Em preparo", "Hoje", "R\$ 12,00"),
//                     _itemPedido(context, "Pedido #1230", "Cancelado", "10/03/2026", "R\$ 45,00"),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _itemPedido(BuildContext context, String id, String status, String data, String total) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DetalhesPage(
//               nome: id,
//               preco: total,
//             ),
//           ),
//         );
//       },
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 15),
//         padding: const EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           color: Colors.grey[100],
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(color: Colors.grey[300]!),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(id, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 Text(data, style: const TextStyle(color: Colors.grey)),
//                 const SizedBox(height: 5),
//                 Text(
//                   status,
//                   style: TextStyle(
//                     color: status == "Cancelado" ? Colors.red : Colors.green,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//             Text(total, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'detalhe_pedido.dart'; // importa a tela de detalhes

class PedidoPage extends StatelessWidget {
  const PedidoPage({super.key}); // construtor const adicionado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text("Produtos"),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _itemProduto(context, "Coxinha", "R\$ 6,50"),
            _itemProduto(context, "Esfiha", "R\$ 5,00"),
            _itemProduto(context, "Kibe", "R\$ 4,50"),
          ],
        ),
      ),
    );
  }

  Widget _itemProduto(BuildContext context, String nome, String preco) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalhesPage(
              nome: nome,
              preco: preco,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(nome, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(preco, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
