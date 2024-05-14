import 'package:ecom_mobile/View/produto/detalhes_produto.dart';
import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/produto.dart';

class ProdutoCardSelecao extends StatelessWidget {
  final Produto produto;
  const ProdutoCardSelecao({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navega para a página do produto quando o card for clicado
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => DetalhesProdutoPage(produto: produto),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Colors.white,
        ),
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 200,
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
