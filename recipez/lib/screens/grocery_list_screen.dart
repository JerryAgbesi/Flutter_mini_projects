import 'package:flutter/material.dart';
import 'package:recipez/models/models.dart';
import 'package:recipez/components/grocery_tile.dart';
import 'package:recipez/screens/grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {
  GroceryListScreen({Key? key, required this.manager}) : super(key: key);

  final GroceryManager manager;

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.getItems;
    return Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
            itemBuilder: (context, index) {
              final currentItem = groceryItems[index];
              return Dismissible(
                key: Key(currentItem.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  color: Colors.red,
                  child: const Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
                onDismissed: (direction) {
                  manager.deleteItem(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${currentItem.name} has been deleted'),
                    ),
                  );
                },
                child: InkWell(
                  child: GroceryTile(
                    key: Key(currentItem.id),
                    item: currentItem,
                    onComplete: (change) {
                      if (change != null) {
                        manager.completeItem(index, change);
                      }
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return GroceryItemScreen(
                            originalItem: currentItem,
                            onCreate: (item) {},
                            onUpdate: (item) {
                              manager.updateItem(item, index);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16,
              );
            },
            itemCount: groceryItems.length));
  }
}
