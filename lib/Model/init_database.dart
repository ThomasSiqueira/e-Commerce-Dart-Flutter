import 'package:ecom_mobile/Model/open_database.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/objectbox.g.dart';
import 'package:ecom_mobile/Model/usuario.dart';
import 'package:objectbox/objectbox.dart';

init() async {
  Box<Produto> produtoBox = ObjectBox.produtoBox;
  Box<Usuario> usuarioBox = ObjectBox.usuarioBox;

//////////// não excluir - lista de produros caso mude a database
  Produto produto = Produto(
      nome: "Dell Inspiron 15",
      precoBase: 2399.00,
      tags: ['MaisVendidos', 'Computadores'],
      imagem: 'assets/Produtos/notebook_inspiron_15.png');

  Produto produto2 = Produto(
      nome: "ASUS Vivobook 15",
      precoBase: 2464.00,
      tags: ['Computadores', 'Promocoes'],
      imagem: 'assets/Produtos/ASUS_Vivobook_12.jpg');

  Produto produto3 = Produto(
      nome: "Atlas 4 bocas",
      precoBase: 549.00,
      tags: ['MaisVendidos', 'Eletrodomesticos'],
      imagem: 'assets/Produtos/Atlas_4bocas.jpg');

  Produto produto4 = Produto(
      nome: "Brastemp Duplex 375L",
      precoBase: 3299.00,
      tags: ['Eletrodomesticos', 'Promocoes'],
      imagem: 'assets/Produtos/brastemp_375L.jpg');

  /* Produto produto5 = Produto(
      nome: "POCO C65 8GB+256GB",
      precoBase: 879.00,
      tags: ['Promocao', 'MaisVendidos', 'Celular'],
      imagem: 'assets/Produtos/poco65.jpg');

  Produto produto6 = Produto(
      nome: "Xiaomi Redmi 12",
      precoBase: 998.00,
      tags: ['Celular'],
      imagem: 'assets/Produtos/redmi12.webp'); */

///////////////////

  final queryu = usuarioBox.query().build();
  final usuarios = queryu.find();

  final query = produtoBox.query().build();
  final produtos = query.find();


  //////////////// somente desinvolvimento
  //query.remove();

  produtoBox.put(produto);
  produtoBox.put(produto2);
  produtoBox.put(produto3);
  produtoBox.put(produto4);

  //produtoBox.remove(11);

  for (Produto produto in produtos) {
    print(produto.id);
    print(produto.nome);
  }
  for (Usuario usuario in usuarios) {
    print(usuario.nome);
    print(usuario.email);
    print(usuario.senha);
  }
////////////////////
}
