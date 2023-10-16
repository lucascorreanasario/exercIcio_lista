import 'package:flutter/material.dart';
import 'package:flutter_application/item.dart'; // Importe o modelo de Item

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  double calculateTotal() {
    double total = 0.0;
    for (var item in items) {
      total += item.quantity * item.unitPrice;
    }
    return total;
  }

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Itens'),
        leading: IconButton(
          icon: Image.asset('assets/imgs/voltar.png'), // Ícone "voltar"
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Quantidade: ${item.quantity}, Valor: ${item.unitPrice}'),
                  trailing: IconButton(
                    icon: Image.asset('assets/imgs/delete.png'), // Ícone "deletar"
                    onPressed: () {
                      _deleteItem(index);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Valor Total: ${calculateTotal().toStringAsFixed(2)}', // Exibe o valor total formatado
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
