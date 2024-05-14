import 'package:flutter/material.dart';

class SearchState extends ChangeNotifier {
  String state = '';

  changeState(state) {
    this.state = state;
    print(state);
    notifyListeners();
  }
}
