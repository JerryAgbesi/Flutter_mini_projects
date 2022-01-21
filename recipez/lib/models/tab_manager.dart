import 'package:flutter/material.dart';

class TabManager extends ChangeNotifier {
  int selected_tab = 0;

  void goToTab(index) {
    selected_tab = index;

    notifyListeners();
  }

  void goToRecipe() {
    selected_tab = 1;

    notifyListeners();
  }
}
