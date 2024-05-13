import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/usuario.dart';
import 'package:ecom_mobile/ViewModel/vertical_scroll_itens.dart';
import 'package:ecom_mobile/View/home/side_menu.dart';
import 'package:ecom_mobile/View/home/side_menu_deslogado.dart';
//joao

class HomePage extends StatelessWidget {
  final CondicaoLogin condLogin; // Usuário recebido como parâmetro
  const HomePage({super.key, required this.condLogin});

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
              children: VerticalScrollList.criaLista(context),
            ),
          ),
        ),
      ),
    );
  }
}
