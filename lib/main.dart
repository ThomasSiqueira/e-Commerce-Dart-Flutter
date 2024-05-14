import 'package:ecom_mobile/Model/usuario.dart';
import 'package:ecom_mobile/Model/searchState.dart';
import 'package:ecom_mobile/Model/carrinho.dart';
import 'package:ecom_mobile/Model/produto.dart';
import 'package:ecom_mobile/View/search/results.dart';
import 'package:ecom_mobile/View/login/login.dart';
import 'package:ecom_mobile/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ecom_mobile/View/home/home.dart';
import 'package:provider/provider.dart';
import 'package:ecom_mobile/Model/compra.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  ListaProdutos produtos = await ListaProdutos.create();
  CondicaoLogin users = CondicaoLogin();
  Carrinho carrinho = Carrinho();

  runApp(MainApp(
    produtos: produtos,
    users: users,
    carrinho: carrinho,
  ));
}

class MainApp extends StatelessWidget {
  final ListaProdutos produtos;
  final CondicaoLogin users;
  final Carrinho carrinho;
  const MainApp(
      {super.key,
      required this.produtos,
      required this.users,
      required this.carrinho});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => users),
          ChangeNotifierProvider(create: (context) => produtos),
          ChangeNotifierProvider(create: (context) => carrinho),
          ChangeNotifierProvider(create: (context) => ListaCompra()),
          ChangeNotifierProvider(
              create: (context) => SearchState()), // other providers
        ],
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.dark,
                primaryColor: Colors.black,
              ),

              home: const HomePage(),
              //initialRoute: '/login',
              routes: {
                '/home': (context) => const HomePage(),
                '/login': (context) => const LoginPage(),
                '/results': (context) => const SearchResults(),
              },
            ));
  }
}
