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
      title: 'Nome',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: const ColorScheme.dark()),
      home: const HomePage(),
    );
  }
}
