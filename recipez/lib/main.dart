import 'package:flutter/material.dart';

import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(const Foodiez());
}

class Foodiez extends StatelessWidget {
  const Foodiez({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = FoodiezTheme.light();
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      title: 'Foodiez',
      home: const Home(),
    );
  }
}
