import 'dart:io';

import 'package:ecom_mobile/Model/usuario.dart';
import 'package:ecom_mobile/Model/carrinho.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/View/search/results.dart';
import 'package:ecom_mobile/View/login/login.dart';
import 'package:ecom_mobile/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ecom_mobile/View/home/home.dart';
import 'package:ecom_mobile/Model/init_database.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  ListaProdutos produtos = await ListaProdutos.create();
  CondicaoLogin users = CondicaoLogin();

  runApp(MainApp(
    produtos: produtos,
    users: users,
  ));
}

class MainApp extends StatelessWidget {
  final ListaProdutos produtos;
  final CondicaoLogin users;
  const MainApp({super.key, required this.produtos, required this.users});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => users),
          ChangeNotifierProvider(create: (context) => produtos),
          ChangeNotifierProvider(
              create: (context) => Carrinho()), // other providers
        ],
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.dark,
                primaryColor: Colors.black,
              ),

              home: Consumer<CondicaoLogin>(
                builder: (context, login, child) {
                  return HomePage(condLogin: login);
                },
              ),
              //initialRoute: '/login',
              routes: {
                '/home': (context) => Consumer<CondicaoLogin>(
                      builder: (contect, login, child) {
                        return HomePage(condLogin: login);
                      },
                    ),
                '/login': (context) => LoginPage(),
                '/results': (context) => SearchResults(),
              },
            ));
  }
}
