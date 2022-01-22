import 'package:flutter/material.dart';
import 'package:recipez/screens/empty_grocery_screen.dart';
import 'package:recipez/models/models.dart';
import 'package:provider/provider.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(builder: (context, manager, child) {
      if (manager.getItems.isNotEmpty) {
        return Container();
      } else {
        return EmptyGroceryScreen();
      }
    });
  }
}
