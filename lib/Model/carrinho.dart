import 'package:ecom_mobile/Model/produto.dart';

class Carrinho {
  static List<ProdutoCarrinho> lista = [];

  static addProduto(Produto produto, int quantidade) {
    ProdutoCarrinho p =
        ProdutoCarrinho(produto: produto, quantidade: quantidade);
    lista.add(p);
  }

  static removeProduto(int i) {
    lista.remove(lista[i]);
  }

  static limpaCarrinho() {
    lista.clear();
  }

  static List<ProdutoCarrinho> getProdutos() {
    return lista;
  }

  static double getTotal() {
    double total = 0;
    for (ProdutoCarrinho p in lista) {
      total += p.produto.precoBase * p.quantidade;
    }

    return total;
  }
}

class ProdutoCarrinho {
  final Produto produto;
  final int quantidade;
  ProdutoCarrinho({required this.produto, required this.quantidade});
}
