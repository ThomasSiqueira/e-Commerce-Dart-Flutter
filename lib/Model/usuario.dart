import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  final String id;
  final String nome;
  final String email;

  Usuario({required this.id, required this.nome, required this.email});
}

class CondicaoLogin extends ChangeNotifier {
  Usuario? usuario;
  CollectionReference? users;

  CondicaoLogin() {
    users = FirebaseFirestore.instance.collection('user');
  }

  login(Usuario user) {
    usuario = user;
    notifyListeners();
  }

  logout() {
    usuario = null;
    notifyListeners();
  }

  isLogado() {
    return usuario != null ? true : false;
  }
}
