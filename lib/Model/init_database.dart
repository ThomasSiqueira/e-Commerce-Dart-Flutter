import 'package:ecom_mobile/Model/open_database.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/objectbox.g.dart';
import 'package:ecom_mobile/Model/usuario.dart';

init() async {
  Box<Produto> produtoBox = ObjectBox.produtoBox;
  Box<Usuario> usuarioBox = ObjectBox.usuarioBox;

//////////// somente para o desinvolvimento
  /* Produto produto = Produto(
      nome: "Celular3",
      precoBase: 2000.00,
      tags: ['Promocao', 'MaisVendidos', 'Celular'],
      imagem: 'assets/Produtos/celular1.webp');

  Produto produto2 = Produto(
      nome: "Celular2",
      precoBase: 2000.00,
      tags: ['Celular'],
      imagem: 'assets/Produtos/celular1.webp'); */

///////////////////

  final queryu = usuarioBox.query().build();
  final usuarios = queryu.find();

  final query = produtoBox.query().build();
  final produtos = query.find();
  //query.remove();
  // produtoBox.put(produto);
  // produtoBox.put(produto2);

  for (Produto produto in produtos) {
    print(produto.nome);
  }
  for (Usuario usuario in usuarios) {
    print(usuario.nome);
    print(usuario.email);
    print(usuario.senha);
  }
}
