import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/carrinho.dart';
import 'package:ecom_mobile/View/carrinho/cart_item.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartCreateState createState() => _CartCreateState();
}

class _CartCreateState extends State<CartScreen> {
  void cartState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            color: Colors.white,
            margin: EdgeInsets.all(25),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Chip(
                    backgroundColor: Color.fromARGB(255, 70, 70, 70),
                    label: Text('R\$${Carrinho.getTotal().toStringAsFixed(2)}'),
                  ),
                  Spacer(),
                  OrderButtom(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Carrinho.getProdutos().length,
              itemBuilder: (ctx, index) =>
                  CartItemWidget(Carrinho.getProdutos()[index], index),
            ),
          ),
        ],
      ),
      floatingActionButton: DialogCarrinho(
        notifyParent: cartState,
      ),
    );
  }
}

class OrderButtom extends StatefulWidget {
  const OrderButtom({
    Key? key,
  }) : super(key: key);

  @override
  _OrderButtomState createState() => _OrderButtomState();
}

class _OrderButtomState extends State<OrderButtom> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        'COMPRAR',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () => {},
    );
  }
}

class DialogCarrinho extends StatelessWidget {
  final Function() notifyParent;
  const DialogCarrinho({super.key, required this.notifyParent});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Calma!'),
          content: const Text('Tem certeza que deseja esvaziar o carrinho?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => {Navigator.pop(context)},
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => {
                Navigator.pop(context),
                Carrinho.limpaCarrinho(),
                notifyParent()
              },
              child: const Text('Sim'),
            ),
          ],
        ),
      ),
      child: const Text('Esvaziar carrinho'),
    );
  }
}
