import 'package:ecom_mobile/Model/carrinho.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_mobile/Model/usuario.dart';
import 'package:flutter/material.dart';
import 'package:ecom_mobile/Model/carrinho.dart';
import 'package:provider/provider.dart';

Future<String> novoLogin(BuildContext context, String email, String password,
    CondicaoLogin condLogin) async {
  String errorMessage = '';
  //UserCredential? userCredential;
  //String userUID;

  CollectionReference users =
      Provider.of<CondicaoLogin>(context, listen: false).users!;

  try {
    final user = users.where("email", isEqualTo: email);
    final userData = (await user.get()).docs[0];
    final data = userData.data() as Map;
    condLogin.login(
        Usuario(id: userData.id, nome: data["name"], email: data["email"]));
  } catch (e) {
    print('Erro ao autenticar: $e');
  }

  Provider.of<Carrinho>(context, listen: false).initCarrinho(
      Provider.of<CondicaoLogin>(context, listen: false),
      Provider.of<ListaProdutos>(context, listen: false));

  return errorMessage;
}

Future<String?> validateEmailBeingUsed(String email) async {
  final querySnapshot = await FirebaseFirestore.instance
      .collection('user')
      .where('email', isEqualTo: email)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    return 'Este email já está em uso. Por favor, use outro email.';
  }

  return null;
}

void logout(BuildContext context) {
  CondicaoLogin user = Provider.of<CondicaoLogin>(context, listen: false);
  Carrinho carrinho = Provider.of<Carrinho>(context, listen: false);
  user.logout();
  carrinho.limpaCarrinho(user);
}
