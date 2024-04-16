import 'package:ecom_mobile/Model/usuario.dart';
import 'package:ecom_mobile/View/carrinho/carrinho_view.dart';
import 'package:flutter/material.dart';
import 'package:ecom_mobile/View/home/user_side_menu.dart';
import 'package:ecom_mobile/View/home/home.dart';
import 'package:ecom_mobile/View/historico_compras.dart';
import 'package:ecom_mobile/ViewModel/login_viewmodel.dart';

class SideMenu extends StatelessWidget {
  final Usuario usuario;
  const SideMenu({super.key, required this.usuario});

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
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: ListView(
              children: [
                UserSideMenu(),
                Center(
                    child: Text(usuario.nome.toUpperCase(),
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20))),
              ],
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false);
            },
          ),
          ListTile(
            title: const Text('Carrinho'),
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return CartScreen();
              }));
            },
          ),
          ListTile(
            title: const Text('Minhas Compras'),
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                return OrdersScreen();
              }));
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              logout();
              Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
            },
          ),
        ],
      ),
    );
  }
}
