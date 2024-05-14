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
                child: ListView.builder(
              itemCount: getProdutos.length,
              itemBuilder: (ctx, index) =>
                  CartItemWidget((getProdutos)[index], index),
            )),
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
        onPressed: () => user.isLogado()
            ? showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Comfirme sua compra!'),
                  content:
                      const Text('Tem certeza que deseja finalizar a compra?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () => {
                        Navigator.pop(context),
                        compras.novaCompra(
                            user, carrinho.getProdutos(user), produtos),
                        carrinho.limpaCarrinho(user),
                        _showSuccessDialog(context)
                      },
                      child: const Text('Sim'),
                    ),
                  ],
                ),
              )
            : showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Center(child: Text('Calma!')),
                  content:
                      const Text('Voce precisa estar logado para comprar!'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text('Sair'),
                    ),
                  ],
                ),
              ));
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

_showSuccessDialog(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Compra Concluído'),
        content: Text('Compra realizado com sucesso!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ;
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
