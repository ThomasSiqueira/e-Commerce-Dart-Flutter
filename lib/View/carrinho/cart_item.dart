import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/carrinho.dart';

class CartItemWidget extends StatelessWidget {
  final ProdutoCarrinho cartItem;
  final int index;

  CartItemWidget(this.cartItem, this.index);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(index),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
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
        Carrinho.removeProduto(index);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(child: Text('${cartItem.produto.precoBase}')),
              ),
            ),
            title: Text(cartItem.produto.nome!),
            subtitle: Text(
                'Total: R\$ ${cartItem.produto.precoBase! * cartItem.quantidade!}'),
            trailing: Text('${cartItem.quantidade}x'),
          ),
        ),
      ),
    );
  }
}
