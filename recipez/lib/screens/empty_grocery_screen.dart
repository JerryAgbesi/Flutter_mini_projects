import 'package:flutter/material.dart';
import 'package:recipez/screens/recipe_screen.dart';
import 'package:recipez/models/models.dart';
import 'package:provider/provider.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child:
                        Image.asset('assets/foodiez_assets/empty_list.png'))),
            const Text(
              'No Groceries',
              style: TextStyle(fontSize: 21.0),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Shopping for ingredients ?\n'
              'tap the + button to add some',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              onPressed: () {
                 Provider.of<TabManager>(context,listen: false).goToRecipe();
              },
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              textColor: Colors.white,
              child: const Text('Browse Recipes'),
            )
          ],
        ),
      ),
    );
  }
}
