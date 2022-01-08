import 'package:flutter/material.dart';

void main() {
  runApp(const Foodiez());
}

class Foodiez extends StatelessWidget {
  const Foodiez({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Foodiez',
        home: Scaffold(
          appBar: AppBar(title:const Text('Foodiez')),
          body: const Center(child: Text('Let\'s get cooking 👩‍🍳'))
        ));
  }
}
