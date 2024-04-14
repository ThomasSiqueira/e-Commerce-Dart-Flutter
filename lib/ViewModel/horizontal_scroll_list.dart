import 'package:flutter/material.dart';

class ScrollList {
  static List<String> stringList = [
    "Todos",
    "Computadores",
    "Celulares",
    "Eletrodomesticos",
    "Vestuario"
  ];

  static List<Widget> criaLista() {
    List<Widget> list = [];
    for (var i = 0; i < stringList.length; i++) {
      list.add(Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              color: Colors.white,
            ),
            width: 90,
            height: 60,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 40,
                      child: Image(
                          image: AssetImage(
                              "assets/icones/${stringList[i]}.png"))),
                  Center(
                      child: Text(stringList[i],
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ))),
                ]),
          )));
    }
    return list;
  }
}
