import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/Model/usuario.dart';

init(ListaProdutos? produtos, CondicaoLogin? users) async {
  ///inicia a lista de produtos antes de começar o programa

  produtos = await ListaProdutos.create();
  users = CondicaoLogin();

  print(produtos);
  print(users);
}
