import 'package:ecom_mobile/Model/open_database.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/objectbox.g.dart';

init() async {
  Box<Produto> produtoBox = ObjectBox.produtoBox;
  Produto produto = Produto(
      nome: "Celular3",
      precoBase: 2000.00,
      tags: ['Promocao', 'MaisVendidos', 'Celular'],
      imagem: 'assets/Produtos/celular1.webp');

  Produto produto2 = Produto(
      nome: "Celular2",
      precoBase: 2000.00,
      tags: ['Celular'],
      imagem: 'assets/Produtos/celular1.webp');

  final query = produtoBox.query().build();
  final produtos = query.find();
  //query.remove();
  // produtoBox.put(produto);
  // produtoBox.put(produto2);

  for (Produto produto in produtos) {
    print(produto.nome);
  }
}
