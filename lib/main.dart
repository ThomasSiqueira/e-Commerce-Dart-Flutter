import 'package:ecom_mobile/Model/login_atual.dart';
import 'package:ecom_mobile/Model/usuario.dart';
import 'package:ecom_mobile/View/search/results.dart';
import 'package:ecom_mobile/View/login/login.dart';
import 'package:ecom_mobile/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ecom_mobile/View/home/home.dart';
import 'package:ecom_mobile/Model/init_database.dart';
import 'package:ecom_mobile/Model/open_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  await ObjectBox.create();
  await init();
  runApp(const MainApp());

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
      ),      
      
      home: HomePage(usuario: CondicaoLogin.usuario),
      //initialRoute: '/login',
      routes: {
        '/home': (context) => HomePage(usuario: CondicaoLogin.usuario),
        '/login': (context) => LoginPage(),
        '/results': (context) => SearchResults(),
      },
    );
  }
}
