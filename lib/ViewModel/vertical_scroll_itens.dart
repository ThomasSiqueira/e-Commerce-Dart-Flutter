import 'package:flutter/material.dart';
import 'package:ecom_mobile/ViewModel/horizontal_scroll_itens.dart';
import 'package:ecom_mobile/ViewModel/horizontal_scroll_list.dart';

class VerticalScrollList {
  static List<Widget> criaLista() {
    List<String> titulo = [
      'Promoções',
      'Mais Vendidos',
      'Celulares',
      'Computadores',
      'Eletrodomesticos'
    ];
    List<String> flag = [
      'Promocoes',
      'MaisVendidos',
      'Celulares',
      'Computadores',
      'Eletrodomesticos'
    ];
    List<Widget> list = [
      Text("Espaço para barra de pesquisa"),
      Container(
        height: 100,
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: ScrollList.criaLista(),
        ),
      ),
    ];

    for (var i = 0; i < titulo.length; i++) {
      list.add(Text(titulo[i]));
      list.add(Container(
        height: 200,
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
