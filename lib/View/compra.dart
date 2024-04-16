import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/compra.dart';

class OrderWidget extends StatefulWidget {
  final Compra compra;
  OrderWidget({required this.compra});
  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final itemsHeight = (widget.compra.lista.length * 22.0) + 4;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: _expanded ? itemsHeight + 92 : 92,
      child: Card(
        color: Color.fromARGB(255, 228, 228, 228),
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'R\$ 4000.00',
                style: TextStyle(color: Colors.black),
              ),
              subtitle:
                  Text("10/04/2024", style: TextStyle(color: Colors.black)),
              trailing: IconButton(
                icon: Icon(
                  Icons.expand_more,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _expanded ? itemsHeight : 0,
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
              child: ListView(
                children: widget.compra.lista.map((product) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        product.produto.nome!,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        '${product.quantidade} x R\$${product.produto.precoBase!}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 94, 94, 94),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
