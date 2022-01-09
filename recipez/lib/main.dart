import 'package:flutter/material.dart';
import 'recipez_theme.dart';
import 'home.dart';
void main() {
  runApp(const Foodiez());
}

class Foodiez extends StatelessWidget {
  const Foodiez({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appTheme = RecipezTheme.dark();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'Foodiez',
      home: Home()
    );
  }
}
