import 'package:flutter/material.dart';
import 'package:ecom_mobile/home/horizontalScrollList.dart';
import 'package:ecom_mobile/home/horizontalScrollItens.dart';
import 'dart:developer';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //List for the horizontal scroll
    ScrollList scrollList = ScrollList();
    scrollList.criaList();

    //List for the horizontal scroll
    ScrollItens scrollItens = ScrollItens();
    scrollItens.criaList();

    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          const SliverAppBar(
            pinned: true,
            title: Text('Ecommerce Demo'),
          ),
        ];
      },
      scrollDirection: Axis.vertical,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: scrollList.getList(),
              ),
            ),
            Container(child: Text("Promoções")),
            Container(
              height: 200,
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: scrollItens.getList(),
              ),
            ),
            Container(child: Text("Mais vendidos")),
            Container(
              height: 200,
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: scrollItens.getList(),
              ),
            ),
            Container(child: Text("Produtos")),
            Container(
              height: 200,
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: scrollItens.getList(),
              ),
            ),
            Container(child: Text("Produtos")),
            Container(
              height: 200,
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: scrollItens.getList(),
              ),
            ),
            Container(child: Text("Produtos")),
            Container(
              height: 200,
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: scrollItens.getList(),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
