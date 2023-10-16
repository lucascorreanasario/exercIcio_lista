import 'package:flutter/material.dart';
import 'package:flutter_application/list_page.dart'; // Importe a tela de lista
import 'package:flutter_application/item.dart'; // Importe o modelo de Item

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController unitPriceController = TextEditingController();

  void _addItemToList() {
    String name = nameController.text;
    int quantity = int.tryParse(quantityController.text) ?? 0;
    double unitPrice = double.tryParse(unitPriceController.text) ?? 0.0;

    if (name.isNotEmpty && quantity > 0 && unitPrice > 0) {
      setState(() {
        items.add(Item(name: name, quantity: quantity, unitPrice: unitPrice));
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Item adicionado com sucesso!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha todos os campos corretamente.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Itens'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Padding nos cantos
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nome do item'),
              ),
              TextField(
                controller: quantityController,
                decoration: InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: unitPriceController,
                decoration: InputDecoration(labelText: 'Valor unitário'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addItemToList,
                child: Text('Cadastrar'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListPage()),
                  );
                },
                child: Text('Ver Lista'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
