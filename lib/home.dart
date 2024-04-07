import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'teste',
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.red,
        toolbarHeight: 50,
      ),
      body: Center(
        child: Text('teste'),
      ),
    );
  }
}
