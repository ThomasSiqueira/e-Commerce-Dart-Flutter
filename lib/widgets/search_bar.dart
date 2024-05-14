import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecom_mobile/Model/searchState.dart';

class SearchBox extends StatelessWidget {
  final String value;
  SearchBox(
      {super.key,
      this.value = "",
      this.onSearch = _defaultOnSearch,
      this.flags});
  final String? flags;
  static void _defaultOnSearch(p0) {}

  final Function(String) onSearch;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<SearchState>(context, listen: false);

    return Container(
      child: Stack(
        children: [
          Material(
            // Add this
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: null != flags ? flags : " Pesquisar",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  state.changeState(_controller.text);
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
