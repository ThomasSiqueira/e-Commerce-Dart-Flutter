import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MessageProvider extends ChangeNotifier {
  int state = 0;

  void chronometer() async {
    Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
      print("Att");

      http.Response result = await http.get(Uri.parse(
          'https://us-central1-ecommerce-2bb50.cloudfunctions.net/ServerState'));

      var res = json.decode(result.body);
      if (res['state'] != state) {
        print("N state");
        state = res['state'];
        notifyListeners();
      }
    });
  }
}
