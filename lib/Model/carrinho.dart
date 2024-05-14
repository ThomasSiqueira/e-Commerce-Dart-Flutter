import 'package:ecom_mobile/Model/produto.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_mobile/Model/usuario.dart';

class Carrinho extends ChangeNotifier {
  final List<ProdutoCarrinho> _lista = [];
  late CollectionReference carrinho;

  Carrinho() {
    carrinho = (FirebaseFirestore.instance.collection('carrinho'));
  }

  initCarrinho(user, ListaProdutos produtos) async {
    if (user.isLogado()) {
      print(user.usuario!.id);
      List<QueryDocumentSnapshot<Object?>> data = (await (carrinho
              .where("user", isEqualTo: user.usuario!.id)
              .limit(1)
              .get()))
          .docs;

      for (var valor in data) {
        var p = valor.data() as Map;
        for (var entrada in p["itens"]) {
          for (var item in produtos.produtos) {
            if (item.id == entrada["item"]) {
              _lista.add(
                ProdutoCarrinho(
                    produto: item, quantidade: entrada["quantidade"]),
              );
            }
          }
        }
      }
    }
  }

  attCarrinho(user) async {
    if (user.isLogado()) {
      print(user.usuario!.id);
      (carrinho.where("user", isEqualTo: user.usuario!.id).limit(1).get())
          .then((QuerySnapshot snapshot) {
        if (snapshot.size < 1) {
          try {
            carrinho.add({
              "user": user.usuario!.id,
              "itens": {
                for (var item in _lista)
                  {"item": item.produto.id, "quantidade": item.quantidade}
              }
            });

            print("Tentando2");
          } catch (e) {
            print("Error");
          }
        } else {
          print("Tentando3");
          var batch = FirebaseFirestore.instance.batch();
          final post = snapshot.docs[0].reference;
          try {
            batch.update(post, {
              "itens": {
                for (var item in _lista)
                  {"item": item.produto.id, "quantidade": item.quantidade}
              }
            });
            batch.commit().then(
                  (value) => print("value"),
                );
          } catch (e) {
            print("Error");
          }
        }
      });
    }
  }

  addProduto(Produto produto, int quantidade, CondicaoLogin user) {
    ProdutoCarrinho p =
        ProdutoCarrinho(produto: produto, quantidade: quantidade);
    bool existe = false;
    for (ProdutoCarrinho item in _lista) {
      if (item.produto.id == produto.id) {
        item.quantidade += quantidade;
        existe = true;
      }
    }
    if (!existe) {
      _lista.add(p);
    }
    attCarrinho(user);
  }

  removeProduto(int i, CondicaoLogin user) {
    _lista.remove(_lista[i]);
    attCarrinho(user);
  }

  limpaCarrinho(CondicaoLogin user) {
    _lista.clear();
    attCarrinho(user);
    notifyListeners();
  }

  List<ProdutoCarrinho> getProdutos(user) {
    return _lista;
  }

  double getTotal() {
    double total = 0;
    for (ProdutoCarrinho p in _lista) {
      total += p.produto.precoBase * p.quantidade;
    }

    return total;
  }
}

class ProdutoCarrinho {
  final Produto produto;
  int quantidade;
  ProdutoCarrinho({required this.produto, required this.quantidade});
}
