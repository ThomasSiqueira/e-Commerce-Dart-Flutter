import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListaProdutos extends ChangeNotifier {
  List<Produto> produtos = [];
  CollectionReference<Produto>? refProduto;

  ListaProdutos._create() {
    refProduto = FirebaseFirestore.instance
        .collection('produtos')
        .withConverter(
            fromFirestore: Produto.fromFirestore,
            toFirestore: (Produto produto, options) => produto.toFirestore());
  }

  static Future<ListaProdutos> create() async {
    ListaProdutos lp = ListaProdutos._create();

    List<QueryDocumentSnapshot<Produto>> bancoProdutos =
        (await (lp.refProduto)!.get()).docs;

    for (var item in bancoProdutos) {
      var produto = item.data();
      lp.produtos.add(produto);
    }
    //////////// não usado

    // var produto = Produto(
    //     nome: "Xiaomi Redmi 13",
    //     precoBase: 1098.00,
    //     tags: ['Celular'],
    //     imagem: 'assets/Produtos/redmi12.webp');

    return lp;
  }
}

class Produto {
  final String? id;
  final String nome;
  final List<String>? tags;
  final num precoBase;
  final String imagem;

  Produto(
      {this.id,
      required this.nome,
      required this.tags,
      required this.precoBase,
      required this.imagem});

  factory Produto.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Produto(
      id: snapshot.id,
      nome: data?['nome'],
      tags: data?['tags'] is Iterable ? List.from(data?['tags']) : null,
      precoBase: data?['valor'],
      imagem: data?['imagem'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "nome": nome,
      "tags": tags,
      "valor": precoBase,
      "imagem": imagem,
    };
  }
}
