import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/compra.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var compras = Provider.of<ListaCompra>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('Meus Pedidos'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: compras.lista.length,
          itemBuilder: (ctx, index) =>
              OrderWidget(compra: compras, index: index),
        ));
  }
}

class OrderWidget extends StatefulWidget {
  final ListaCompra compra;
  final int index;
  const OrderWidget({super.key, required this.compra, required this.index});
  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final itemsHeight =
        (widget.compra.lista[widget.index].lista.length * 24.0) + 7;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _expanded ? itemsHeight + 100 : 100,
      child: Card(
        color: const Color.fromARGB(255, 228, 228, 228),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'R\$ ${widget.compra.lista[widget.index].getTotal()}',
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text("${widget.compra.lista[widget.index].data}",
                  style: TextStyle(color: Colors.black)),
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
                children:
                    widget.compra.lista[widget.index].lista.map((product) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        product.produto.nome,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        '${product.quantidade} x R\$${product.produto.precoBase}',
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
