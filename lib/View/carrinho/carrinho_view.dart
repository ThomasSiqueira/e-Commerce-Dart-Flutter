import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/carrinho.dart';
import 'package:ecom_mobile/View/carrinho/cart_item.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(25),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  Chip(
                    label: Text(
                      'R\$${Carrinho.getTotal().toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline6!
                              .color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
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
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: _isLoading ? CircularProgressIndicator() : Text('COMPRAR'),
      onPressed: () => {},
    );
  }
}
