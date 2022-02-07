import 'package:flutter/material.dart';
import 'package:recipez/models/models.dart';
import 'package:recipez/screens/screens.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;
  final GroceryManager groceryManager;
  final ProfileManager profileManager;

  AppRouter({
    required this.appStateManager,
    required this.groceryManager,
    required this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(() {
      notifyListeners();
    });
    groceryManager.addListener(() {
      notifyListeners();
    });
    profileManager.addListener(() {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    appStateManager.removeListener(() {
      notifyListeners();
    });
    groceryManager.removeListener(() {
      notifyListeners();
    });
    profileManager.removeListener(() {
      notifyListeners();
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePop,
      //stack of pages to define the navigation task
      pages: [
        // SplashScreen.page(),
        if (!appStateManager.isInitialized) SplashScreen.page(),
        if (appStateManager.isInitialized && !appStateManager.isloggedIn)
          LoginScreen.page(),
        if (appStateManager.isloggedIn && !appStateManager.isonBoardingComplete)
          OnboardingScreen.page(),
        if (appStateManager.isonBoardingComplete)
          Home.page(appStateManager.getSelectedTab),
        if (groceryManager.isCreatingNewItem)
          GroceryItemScreen.page(
              onCreate: (item) {
                groceryManager.addItem(item);
              },
              onUpdate: (item, index) {}),
        if (groceryManager.selectedIndex != -1)
          GroceryItemScreen.page(
              item: groceryManager.selectedGroceryItem,
              index: groceryManager.selectedIndex,
              onCreate: (_) {},
              onUpdate: (item, index) {
                groceryManager.updateItem(item, index);
              }),
        if (profileManager.didSelectUser)
          ProfileScreen.page(profileManager.getUser),
        if (profileManager.didTapOnRaywenderlich) WebViewScreen.page(),
      ],
    );
  }

  bool _handlePop(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    if (route.settings.name == FoodiezPages.onboardingPath) {
      appStateManager.logout();
    }
    if (route.settings.name == FoodiezPages.groceryItemDetails) {
      groceryManager.groceryItemTapped(-1);
    }
    if (route.settings.name == FoodiezPages.raywenderlich) {
      profileManager.tapOnRaywenderlich(false);
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
