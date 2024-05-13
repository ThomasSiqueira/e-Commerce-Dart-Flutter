import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/Model/usuario.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Carrinho extends ChangeNotifier {
  List<ProdutoCarrinho> lista = [];

  attCarrinho(
    context,
  ) async {
    CondicaoLogin user = Provider.of<CondicaoLogin>(context, listen: false);
    if (user.isLogado()) {
      CollectionReference carrinho =
          (FirebaseFirestore.instance.collection('carrinho'));
      (carrinho.where("user", isEqualTo: user.usuario!.id).limit(1).get())
          .then((QuerySnapshot snapshot) {
        var batch = FirebaseFirestore.instance.batch();
        final post = snapshot.docs[0].reference;

        batch.update(post, {});
      });
    }
  }

  addProduto(Produto produto, int quantidade) {
    ProdutoCarrinho p =
        ProdutoCarrinho(produto: produto, quantidade: quantidade);
    lista.add(p);
  }

  removeProduto(int i) {
    lista.remove(lista[i]);
  }

  limpaCarrinho() {
    lista.clear();
  }

  List<ProdutoCarrinho> getProdutos() {
    return lista;
  }

  double getTotal() {
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
