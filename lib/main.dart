import 'package:flutter/material.dart';
import 'package:ecom_mobile/home/home.dart';
import 'package:ecom_mobile/login/login.dart';

void main() {
  runApp(MainApp());
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
