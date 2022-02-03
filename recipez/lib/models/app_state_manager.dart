import 'dart:async';
import 'package:flutter/material.dart';
import 'package:recipez/main.dart';

class foodiezTab {
  static const int explore = 0;
  static const int recipes = 1;
  static const int toBuy = 2;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _onBoardingComplete = false;
  int _selectedTab = foodiezTab.explore;

  bool get isInitialized => _initialized;
  bool get isloggedIn => _loggedIn;
  bool get isonBoardingComplete => _onBoardingComplete;
  int get getSelectedTab => _selectedTab;

  void initializeApp() {
    Timer(const Duration(milliseconds: 2000), () {
      _initialized = true;

      notifyListeners();
    });
  }

  void login(String username, String password) {
    _loggedIn = true;

    notifyListeners();
  }

  void completeOnBoarding() {
    _onBoardingComplete = true;

    notifyListeners();
  }

  void gotoTab(index) {
    _selectedTab = index;

    notifyListeners();
  }

  void gotoRecipes() {
    _selectedTab = foodiezTab.recipes;

    notifyListeners();
  }

  void logout() {
    _initialized = true;
    _loggedIn = true;
    _onBoardingComplete = false;
    _selectedTab = 0;

    initializeApp();
    notifyListeners();
  }
}
