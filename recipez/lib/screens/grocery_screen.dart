import 'package:flutter/material.dart';
import 'package:recipez/screens/empty_grocery_screen.dart';
import 'package:recipez/models/models.dart';
import 'package:provider/provider.dart';
import 'grocery_item_screen.dart';
import 'grocery_list_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final manager = Provider.of<GroceryManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroceryItemScreen(
                  onCreate: (item) {
                    manager.addItem(item);
                    Navigator.pop(context);
                  },
                  onUpdate: (item) {}),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(builder: (context, manager, child) {
      if (manager.getItems.isNotEmpty) {
        return GroceryListScreen(manager: manager);
      } else {
        return EmptyGroceryScreen();
      }
    });
  }
}
