import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/carrinho.dart';
import 'package:provider/provider.dart';
import 'package:ecom_mobile/Model/usuario.dart';

class CartItemWidget extends StatelessWidget {
  final ProdutoCarrinho cartItem;
  final int index;

  CartItemWidget(this.cartItem, this.index);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<CondicaoLogin>(context, listen: false);
    var carrinho = Provider.of<Carrinho>(context, listen: false);
    return Dismissible(
      key: ValueKey(index),
      background: Container(
        child: Icon(
          Icons.delete,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Tem certeza?'),
            content: Text('Quer remover o item do carrinho?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: Text('Não'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: Text('Sim'),
              ),
            ],
          ),
        );
      },
      onDismissed: (_) {
        carrinho.removeProduto(index, user);
      },
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 73, 73, 73),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                    child: Text('${cartItem.produto.precoBase}',
                        style: TextStyle(fontSize: 20, color: Colors.white))),
              ),
            ),
            title: Text(cartItem.produto.nome,
                style: TextStyle(fontSize: 20, color: Colors.black)),
            subtitle: Text(
                'Total: R\$ ${cartItem.produto.precoBase * cartItem.quantidade}',
                style: TextStyle(fontSize: 17, color: Colors.black)),
            trailing: Text('${cartItem.quantidade}x',
                style: TextStyle(fontSize: 13, color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
