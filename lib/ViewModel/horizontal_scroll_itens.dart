import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/Model/open_database.dart';
import 'package:ecom_mobile/Model/produtos_database.dart';

class HorizontalScrollItens {
  static List<Widget> criaLista(String flag) {
    List<Produto> produtoList = pegaProdutos();
    List<Widget> list = [];

    for (var i = 0; i < produtoList.length; i++) {
      list.add(Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.white,
            ),
            width: 200,
            height: 60,
            child: Image(image: AssetImage(produtoList[i].imagem)),
          )));
    }

    return list;
  }
}
