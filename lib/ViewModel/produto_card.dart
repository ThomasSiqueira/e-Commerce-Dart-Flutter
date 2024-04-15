import 'package:ecom_mobile/View/produto/dedtalhes_produto.dart';
import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:flutter/widgets.dart';

class ProdutoCard extends StatelessWidget {
  final Produto produto;
  const ProdutoCard({Key? key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navega para a página do produto quando o card for clicado
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalhesProdutoPage(produto: produto),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Colors.white,
        ),
        width: 180,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 150,
              child: Image(image: AssetImage(produto.imagem)),
            ),
            Center(
              child: Text(
                produto.nome,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Text(
                'R\$ ${produto.precoBase}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

