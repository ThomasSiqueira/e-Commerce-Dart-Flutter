import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:flutter/widgets.dart';

class ProdutoCard extends StatelessWidget {
  final Produto produto;
  const ProdutoCard({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    //List for the horizontal scroll

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Colors.white,
      ),
      width: 200,
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        SizedBox(height: 150, child: Image(image: AssetImage(produto.imagem))),
        Center(
            child: Text(produto.nome,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ))),
        Center(
            child: Text('R\$ ${produto.precoBase}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ))),
      ]),
    );
  }
}
