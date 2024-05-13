import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/ViewModel/produto_card.dart';
import 'package:provider/provider.dart';

class HorizontalScrollItens {
  static List<Widget> criaLista(BuildContext context, String flag) {
    List<Produto> produtoList =
        Provider.of<ListaProdutos>(context, listen: false).produtos;
    List<Widget> list = [];

    for (var i = 0; i < produtoList.length; i++) {
      if (produtoList[i].tags!.contains(flag)) {
        list.add(Padding(
          padding: const EdgeInsets.all(5.0),
          child: ProdutoCard(produto: produtoList[i]),
        ));
      }
    }

    return list;
  }
}
