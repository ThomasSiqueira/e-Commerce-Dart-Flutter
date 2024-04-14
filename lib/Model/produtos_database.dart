import 'package:ecom_mobile/Model/open_database.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/objectbox.g.dart';

List<Produto> pegaProdutos() {
  Box<Produto> produtoBox = ObjectBox.produtoBox;

  final query = produtoBox.query().build();
  final produtos = query.find();

  return produtos;
}

List<Produto> pegaProdutosComNome(String nome) {
  Box<Produto> produtoBox = ObjectBox.produtoBox;

  final query = produtoBox.query(Produto_.nome.equals(nome)).build();
  final produtos = query.find();

  return produtos;
}
