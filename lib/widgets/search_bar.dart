import 'package:flutter/material.dart';
import 'package:ecom_mobile/View/pagina_selecao/pagina_pesquisa.dart';

class SearchBox extends StatelessWidget {
  SearchBox({super.key, this.onSearch = _defaultOnSearch, this.flags});
  final String? flags;
  static void _defaultOnSearch(p0) {}

  final Function(String) onSearch;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Material(
            // Add this
            child: TextField(
              autofocus: ModalRoute.of(context)?.settings.name == '/results',
              controller: _controller,
              decoration: InputDecoration(
                hintText: null != flags ? flags : " Pesquisar",
              ),
              onTap: () => {
                if (ModalRoute.of(context)?.settings.name != '/results')
                  {Navigator.pushNamed(context, '/results')}
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  if (onSearch != null) {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return SelecaoPage(
                        flag: _controller.text,
                        usuario: null,
                      );
                    }));
                  }
                },
                child: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
