import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/ViewModel/produto_card_selecao.dart';
import 'package:ecom_mobile/Model/usuario.dart';
import 'package:ecom_mobile/View/home/side_menu.dart';
import 'package:ecom_mobile/widgets/search_bar.dart';
import 'package:ecom_mobile/ViewModel/horizontal_scroll_list.dart';

class SelecaoPage extends StatelessWidget {
  final Usuario? usuario; //Usuário recebido como parâmetro
  final String flag; //
  const SelecaoPage({super.key, required this.usuario, required this.flag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Commerce"),
      ),
      drawer: SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[];
          },
          scrollDirection: Axis.vertical,
          body: SingleChildScrollView(
            child: Column(
              children: VerticalScrollSelecao.criaLista(flag),
            ),
          ),
        ),
      ),
    );
  }
}

class VerticalScrollSelecao {
  static List<Widget> criaLista(String flags) {
    List<Widget> list = [
      SearchBox(flags: flags),
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
    List<Produto> produtoList = [];
    for (var i = 0; i < produtoList.length; i++) {
      if (produtoList[i].tags!.contains(flags) ||
          produtoList[i].nome.toLowerCase().contains(flags.toLowerCase())) {
        list.add(Padding(
          padding: const EdgeInsets.all(5.0),
          child: ProdutoCardSelecao(produto: produtoList[i]),
        ));
      }
    }

    return list;
  }
}
