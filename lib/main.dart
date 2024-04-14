import 'package:ecom_mobile/Model/usuario.dart';
import 'package:ecom_mobile/View/search/results.dart';
import 'package:ecom_mobile/View/login/login.dart';
import 'package:ecom_mobile/View/login/register.dart';
import 'package:ecom_mobile/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:ecom_mobile/View/home/home.dart';
import 'package:ecom_mobile/Model/init_database.dart';
import 'package:ecom_mobile/Model/open_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      theme: ThemeData(colorScheme: const ColorScheme.dark()),
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          final Usuario usuario = settings.arguments as Usuario; // Recebe o usuário como parâmetro
          return MaterialPageRoute(
            builder: (context) => HomePage(usuario: usuario),
          );
        }
        return null;
      },
      initialRoute: '/login', 
      routes: {
        '/login': (context) => LoginPage(),
        '/results': (context) => SearchBox(),
      },
    );
  }
}
