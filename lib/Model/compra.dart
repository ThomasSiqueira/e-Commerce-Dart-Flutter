import 'package:ecom_mobile/Model/carrinho.dart';

class Compra {
  List<ProdutoCarrinho> lista = [];

  Compra({required this.lista});

  List<ProdutoCarrinho> getCompra() {
    return lista;
  }
}

class Compras {
  static List<Compra> lista = [];

  static List<Compra> getCompra() {
    return lista;
  }

  static void setLista(List<Compra> l) {
    lista = l;
  }
}
