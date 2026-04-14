import 'package:flutter/material.dart';

class CarrinhoPage extends StatelessWidget {
  const CarrinhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Carrinho"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          // Lista de Produtos no Carrinho
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                _itemCarrinho("Risoles de carne", "4,50", "2un"),
                _itemCarrinho("Pastel", "6,50", "20un"),
                _itemCarrinho("Coxinha", "6,50", "25un"),
              ],
            ),
          ),

          // Botão Inferior
          Padding(
            padding: const EdgeInsets.all(25),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  // Lógica para finalizar ou adicionar mais
                },
                child: const Text(
                  "Adicionar ao carrinho",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemCarrinho(String nome, String preco, String qtd) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.image, color: Colors.grey),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nome,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 5),
                Text("R\$ $preco",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14)),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(Icons.remove, size: 20, color: Colors.grey),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(qtd,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              const Icon(Icons.add, size: 20, color: Colors.green),
            ],
          )
        ],
      ),
    );
  }
}
