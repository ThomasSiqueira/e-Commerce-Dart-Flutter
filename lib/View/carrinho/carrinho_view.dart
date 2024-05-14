import 'package:ecom_mobile/Model/compra.dart';
import 'package:ecom_mobile/Model/usuario.dart';
import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/carrinho.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/View/carrinho/cart_item.dart';
import 'package:provider/provider.dart';

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
    return Consumer<Carrinho>(builder: (contect, carrinho, child) {
      var user = Provider.of<CondicaoLogin>(context, listen: false);
      List<ProdutoCarrinho> getProdutos = carrinho.getProdutos(user);
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
                      label:
                          Text('R\$${carrinho.getTotal().toStringAsFixed(2)}'),
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
              child: user.isLogado()
                  ? ListView.builder(
                      itemCount: getProdutos.length,
                      itemBuilder: (ctx, index) =>
                          CartItemWidget((getProdutos)[index], index),
                    )
                  : ListView.builder(
                      itemCount: 0,
                      itemBuilder: (ctx, index) =>
                          CartItemWidget(([])[index], index),
                    ),
            ),
          ],
        ),
        floatingActionButton: DialogCarrinho(
          carrinho: carrinho,
          notifyParent: cartState,
        ),
      );
    });
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
    var compras = Provider.of<ListaCompra>(context, listen: false);
    var user = Provider.of<CondicaoLogin>(context, listen: false);
    var produtos = Provider.of<ListaProdutos>(context, listen: false);
    var carrinho = Provider.of<Carrinho>(context, listen: false);
    return TextButton(
      child: Text(
        'COMPRAR',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () => {
        compras.novaCompra(user, carrinho.getProdutos(user), produtos),
        carrinho.limpaCarrinho(user)
      },
    );
  }
}

class DialogCarrinho extends StatelessWidget {
  final Function() notifyParent;
  final Carrinho carrinho;
  const DialogCarrinho(
      {super.key, required this.carrinho, required this.notifyParent});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<CondicaoLogin>(context, listen: false);
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
                carrinho.limpaCarrinho(user),
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
