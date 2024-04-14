import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  SearchBox({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Pesquisar",
            ),
            onSubmitted: (value) {
              // Aqui você pode usar o Navigator para mudar a página
              // Use o valor para a pesquisa
            },
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Align(
              child: GestureDetector(
                onTap: () {
                  print(_controller.text);
                  // Aqui você pode usar o Navigator para mudar a página
                  // Use _controller.text para obter o texto da caixa de pesquisa
                },
                child: Icon(
                  Icons.search,
                  size: 50,
                ),
              ),
              alignment: Alignment.centerRight,
            ),
          )
        ],
      ),
    );
  }
}
