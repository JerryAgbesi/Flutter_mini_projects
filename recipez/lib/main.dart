import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fooderlich_theme.dart';
import 'models/models.dart';
import 'screens/splash_screen.dart';
// TODO: Import app_router

void main() {
  runApp(const Foodiez());
}

class Foodiez extends StatefulWidget {
  const Foodiez({Key? key}) : super(key: key);

  @override
  _FoodiezState createState() => _FoodiezState();
}

class _FoodiezState extends State<Foodiez> {
  final _groceryManager = GroceryManager();
  final _profileManager = ProfileManager();
  // TODO: Create AppStateManager
  // TODO: Define AppRouter

  // TODO: Initialize app router

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _groceryManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        ),
        // TODO: Add AppStateManager ChangeNotifierProvider
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = FooderlichTheme.dark();
          } else {
            theme = FooderlichTheme.light();
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            title: 'Foodiez',
            // TODO: Replace with Router widget
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
