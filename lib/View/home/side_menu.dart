import 'package:ecom_mobile/Model/usuario.dart';
import 'package:flutter/material.dart';
import 'package:ecom_mobile/View/login/login.dart';
import 'package:ecom_mobile/View/home/user_side_menu.dart';

class SideMenu extends StatelessWidget {
  final Usuario usuario;
  const SideMenu({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: ListView(
              children: [
                UserSideMenu(),
                Center(child: Text(usuario.nome)),
              ],
            ),
          ),
          ListTile(
            title: const Text('Home'),
          ),
          ListTile(
            title: const Text('Carrinho'),
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return LoginPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
