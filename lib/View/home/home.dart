import 'package:ecom_mobile/ViewModel/vertical_scroll_itens.dart';
import 'package:flutter/material.dart';
import 'package:ecom_mobile/ViewModel/horizontal_scroll_list.dart';
import 'package:ecom_mobile/ViewModel/horizontal_scroll_itens.dart';
import 'package:ecom_mobile/ViewModel/vertical_scroll_itens.dart';
import 'package:ecom_mobile/View/home/side_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //List for the horizontal scroll

    return Scaffold(
        appBar: AppBar(
          title: Text("Teste"),
        ),
        drawer: SideMenu(),
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
