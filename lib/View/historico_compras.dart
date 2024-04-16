import 'package:flutter/material.dart';
import 'package:ecom_mobile/View/compra.dart';
import 'package:ecom_mobile/Model/compra.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meus Pedidos'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (ctx, index) =>
              OrderWidget(compra: Compras.getCompra()[index]),
        ));
  }
}
