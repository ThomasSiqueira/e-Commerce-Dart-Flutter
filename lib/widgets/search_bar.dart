import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  SearchBox({super.key, this.onSearch = _defaultOnSearch});

  static void _defaultOnSearch(p0) {
    print("No");
  }

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
                hintText: "Pesquisar",
              ),
              onSubmitted: (value) {
                if (onSearch != null) {
                  onSearch(value);
                }
              },
              onTap: () => {
                if (ModalRoute.of(context)?.settings.name != '/results')
                  {Navigator.pushNamed(context, '/results')}
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Align(
              child: GestureDetector(
                onTap: () {
                  if (onSearch != null) {
                    onSearch(_controller.text);
                  }
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
