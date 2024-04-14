import 'package:ecom_mobile/Model/usuario.dart';
import 'package:ecom_mobile/ViewModel/vertical_scroll_itens.dart';
import 'package:ecom_mobile/objectbox.g.dart';
import 'package:flutter/material.dart';
import 'package:ecom_mobile/ViewModel/horizontal_scroll_list.dart';
import 'package:ecom_mobile/ViewModel/horizontal_scroll_itens.dart';
import 'package:ecom_mobile/ViewModel/vertical_scroll_itens.dart';
import 'package:ecom_mobile/View/home/side_menu.dart';

class HomePage extends StatelessWidget {
  final Usuario usuario; // Usuário recebido como parâmetro
  const HomePage({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //List for the horizontal scroll
    print(usuario.email);

    return Scaffold(
        appBar: AppBar(
          title: Text("Teste"),
        ),
        drawer: SideMenu(usuario: usuario),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[];
          },
          scrollDirection: Axis.vertical,
          body: SingleChildScrollView(
            child: Column(
              children: VerticalScrollList.criaLista(),
            ),
          ),
        ));
  }
}
