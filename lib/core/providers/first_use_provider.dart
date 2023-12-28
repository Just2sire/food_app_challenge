import 'package:flutter/material.dart';

class FirstUserProvider extends ChangeNotifier {
  bool firstConnection = false;

  void hisFirstConnection() {
    firstConnection = true;
    notifyListeners();
  }
}
