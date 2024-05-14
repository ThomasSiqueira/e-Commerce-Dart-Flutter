//import 'package:ecom_mobile/Model/carrinho.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/Model/carrinho.dart';
import 'package:intl/intl.dart';

class ListaCompra extends ChangeNotifier {
  List<Compra> lista = [];
  late CollectionReference compras;

  ListaCompra() {
    compras = (FirebaseFirestore.instance.collection('compras'));
  }

  initCompras(user, ListaProdutos produtos) async {
    lista = [];
    if (user.isLogado()) {
      List<QueryDocumentSnapshot<Object?>> data =
          (await (compras.where("user", isEqualTo: user.usuario!.id).get()))
              .docs;

      for (var valor in data) {
        var p = valor.data() as Map;
        Compra listaCompras = Compra(data: p["data"]);
        for (var entrada in p["compra"]) {
          for (var item in produtos.produtos) {
            if (item.id == entrada["produtoId"]) {
              listaCompras.lista.add(
                ProdutoCompra(produto: item, quantidade: entrada["quantidade"]),
              );
            }
          }
        }

        lista.add(listaCompras);
      }
    }
  }

  novaCompra(
      user, List<ProdutoCarrinho> carrinho, ListaProdutos produtos) async {
    if (user.isLogado()) {
      try {
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('kk:mm \nd/m/y').format(now);
        compras.add({
          "user": user.usuario!.id,
          "compra": {
            for (var item in carrinho)
              {"produtoId": item.produto.id, "quantidade": item.quantidade}
          },
          "data": formattedDate
        });
      } catch (e) {
        print("Error");
      }
    }
    initCompras(user, produtos);
  }

  List<Compra> getCompras() {
    return lista;
  }
}

class Compra {
  List<ProdutoCompra> lista = [];
  String data;
  Compra({required this.data});

  double getTotal() {
    double total = 0;
    for (ProdutoCompra p in lista) {
      total += p.produto.precoBase * p.quantidade;
    }

    return total;
  }
}

class ProdutoCompra {
  final Produto produto;

  int quantidade;
  ProdutoCompra({required this.produto, required this.quantidade});
}
