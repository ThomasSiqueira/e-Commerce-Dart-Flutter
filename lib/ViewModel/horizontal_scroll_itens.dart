import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/Model/produtos_database.dart';
import 'package:ecom_mobile/ViewModel/produto_card.dart';

class HorizontalScrollItens {
  static List<Widget> criaLista(String flag) {
    List<Produto> produtoList = pegaProdutos();
    List<Widget> list = [];

    for (var i = 0; i < produtoList.length; i++) {
      if (produtoList[i].tags.contains(flag)) {
        list.add(Padding(
          padding: const EdgeInsets.all(5.0),
          child: ProdutoCard(produto: produtoList[i]),
        ));
      }
    }

    return list;
  }
}
