import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/ViewModel/horizontal_scroll_itens.dart';
import 'package:ecom_mobile/ViewModel/horizontal_scroll_list.dart';

class VerticalScrollList {
  static List<Widget> criaLista() {
    ScrollList scrollList = ScrollList();
    List<String> titulo = ['Promoções', 'Mais Vendidos', 'Celulares'];
    List<String> flag = ['Promocoes', 'MaisVendidos', 'Celulares'];
    List<Widget> list = [
      Text("Espaço para barra de pesquisa"),
      Container(
        height: 100,
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: scrollList.getList(),
        ),
      ),
    ];

    for (var i = 0; i < titulo.length; i++) {
      list.add(Text(titulo[i]));
      list.add(Container(
        height: 100,
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: HorizontalScrollItens.criaLista(flag[i]),
        ),
      ));
    }

    return list;
  }
}
