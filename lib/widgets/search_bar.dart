import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          SearchBar(
            hintText: "Pesquisar",
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Align(
              child: Icon(
                Icons.search,
                size: 50,
              ),
              alignment: Alignment.centerRight,
            ),
          )
        ],
      ),
    );
  }
}
