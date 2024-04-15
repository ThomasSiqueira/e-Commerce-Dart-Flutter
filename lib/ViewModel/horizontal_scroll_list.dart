import 'package:flutter/material.dart';
import 'package:ecom_mobile/View/pagina_selecao/selecao_produtos.dart';

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
      list.add(ScrollListBlock(nome: stringList[i]));
    }
    return list;
  }
}

class ScrollListBlock extends StatelessWidget {
  final String nome;
  const ScrollListBlock({super.key, required this.nome});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: GestureDetector(
            onTap: () => {
                  if (ModalRoute.of(context)?.settings.name != '/')
                    {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                        return SelecaoPage(
                          flag: nome,
                          usuario: null,
                        );
                      }))
                    }
                  else
                    {
                      Navigator.push(context, MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                        return SelecaoPage(
                          flag: nome,
                          usuario: null,
                        );
                      }))
                    }
                },
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
                            image: AssetImage("assets/icones/${nome}.png"))),
                    Center(
                        child: Text(nome,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ))),
                  ]),
            )));
  }
}
