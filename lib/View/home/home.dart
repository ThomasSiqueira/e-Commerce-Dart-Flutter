import 'package:flutter/material.dart';
import 'package:ecom_mobile/ViewModel/vertical_scroll_itens.dart';
import 'package:ecom_mobile/View/home/side_menu.dart';
//joao

class HomePage extends StatelessWidget {
  // Usuário recebido como parâmetro
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Commerce"),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[];
          },
          scrollDirection: Axis.vertical,
          body: SingleChildScrollView(
            child: VerticalScrollList(),
          ),
        ),
      ),
    );
  }
}
