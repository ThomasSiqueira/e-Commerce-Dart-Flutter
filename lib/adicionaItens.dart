import 'package:ecom_mobile/Model/open_database.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/objectbox.g.dart';

init() async {
  Box<Produto> produtoBox = ObjectBox.produtoBox;
  Produto produto = Produto(
      nome: "Celular",
      precoBase: 1000.00,
      tags: ['Promocao', 'MaisVendidos', 'Celular'],
      imagem: './');

  Produto produto2 = Produto(
      nome: "Celular2", precoBase: 2000.00, tags: ['Celular'], imagem: './');

  produtoBox.put(produto);
  produtoBox.put(produto2);

  final query = produtoBox.query().build();
  final produtos = query.find();

  print(produtos[0].nome);
  print(produtos[1].nome);
}
