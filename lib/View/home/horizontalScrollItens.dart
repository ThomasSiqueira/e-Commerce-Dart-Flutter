import 'package:flutter/material.dart';

class ScrollItens {
  List<Widget> list = [];
  List<String> stringList = [
    "P1",
    "P2",
    "P3",
    "P4",
    "teste",
    "teste",
    "teste",
    "teste",
    "teste"
  ];

  void criaList() {
    for (var i = 0; i < stringList.length; i++) {
      list.add(Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.red,
            ),
            width: 300,
            height: 60,
            child: Text(stringList[i]),
          )));
    }
  }

  List<Widget> getList() {
    return list;
  }
}
