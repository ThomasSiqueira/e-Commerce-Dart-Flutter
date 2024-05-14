import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/ViewModel/produto_card_selecao.dart';
import 'package:provider/provider.dart';

class SelecaoPage {
  //Usuário recebido como parâmetro
  final String flag; //
  const SelecaoPage({Key? key, required this.flag});

  static geraLista(context, flag) {
    List<Widget> list = [];
    List<Produto> produtoList =
        Provider.of<ListaProdutos>(context, listen: false).produtos;
    for (var i = 0; i < produtoList.length; i++) {
      if (produtoList[i].tags!.contains(flag) ||
          (produtoList[i].nome.toUpperCase()).contains(flag.toUpperCase())) {
        list.add(Padding(
          padding: const EdgeInsets.all(5.0),
          child: ProdutoCardSelecao(produto: produtoList[i]),
        ));
      }
    }

    return list;
  }
}
