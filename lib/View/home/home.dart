import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/usuario.dart';
import 'package:ecom_mobile/ViewModel/vertical_scroll_itens.dart';
import 'package:ecom_mobile/objectbox.g.dart';
import 'package:ecom_mobile/View/home/side_menu.dart';
import 'package:ecom_mobile/View/home/side_menu_deslogado.dart';

class HomePage extends StatelessWidget {
  final Usuario? usuario; // Usuário recebido como parâmetro
  const HomePage({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste"),
      ),
      drawer: usuario == null ? const SideMenuDeslogado() : SideMenu(usuario: usuario!),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[];
          },
          scrollDirection: Axis.vertical,
          body: SingleChildScrollView(
            child: Column(
              children: VerticalScrollList.criaLista(),
            ),
          ),
        ),
      ),
    );
  }
}
