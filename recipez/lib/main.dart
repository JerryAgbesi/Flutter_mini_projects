import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipez/navigation/app_router.dart';
import 'fooderlich_theme.dart';
import 'models/models.dart';

import 'package:recipez/models/app_state_manager.dart';

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
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
        appStateManager: _appStateManager,
        groceryManager: _groceryManager,
        profileManager: _profileManager);
    super.initState();
  }

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
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
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
            home: Router(
              backButtonDispatcher: RootBackButtonDispatcher(),
              routerDelegate: _appRouter,
            ),
          );
        },
      ),
    );
  }
}
