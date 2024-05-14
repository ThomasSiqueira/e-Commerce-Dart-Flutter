import 'package:ecom_mobile/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:ecom_mobile/ViewModel/horizontal_scroll_itens.dart';
import 'package:ecom_mobile/ViewModel/horizontal_scroll_list.dart';
import 'package:provider/provider.dart';
import 'package:ecom_mobile/View/pagina_selecao/selecao_produtos.dart';
import 'package:ecom_mobile/Model/searchState.dart';

class VerticalScrollList extends StatefulWidget {
  VerticalScrollList() {}
  @override
  _VerticalScrollListState createState() => _VerticalScrollListState();
}

class _VerticalScrollListState extends State<VerticalScrollList> {
  String state = "";
  List<String> titulo = [
    'Promoções',
    'Mais Vendidos',
    'Celulares',
    'Computadores',
    'Eletrodomesticos',
    'Vestuário'
  ];
  List<String> flag = [
    'Promocoes',
    'MaisVendidos',
    'Celulares',
    'Computadores',
    'Eletrodomesticos',
    'Vestuario'
  ];
  List<Widget> list = [];

  getList() {
    if (state == "" || state == "Todos") {
      state = "";
      list = [];
      for (var i = 0; i < titulo.length; i++) {
        list.add(Text(titulo[i]));
        list.add(Container(
          height: 200,
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: HorizontalScrollItens.criaLista(context, flag[i]),
          ),
        ));
      }
    } else {
      list = SelecaoPage.geraLista(context, state);
    }
  }

  @override
  Widget build(BuildContext context) {
    state = Provider.of<SearchState>(context, listen: false).state;
    return Consumer<SearchState>(builder: (context, state, child) {
      this.state = state.state;
      getList();
      return Column(children: [
        SearchBox(),
        Container(
          height: 100,
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: ScrollList.criaLista(),
          ),
        ),
        ...list
      ]);
    });
  }
}
