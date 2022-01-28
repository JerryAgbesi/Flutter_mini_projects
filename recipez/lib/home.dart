import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipez/models/models.dart';
import 'package:recipez/screens/explore_screen.dart';
import 'screens/recipe_screen.dart';
import 'package:recipez/screens/grocery_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipeScreen(),
    GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabmanager, child) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Foodiez',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        body: IndexedStack(index: tabmanager.selected_tab, children: pages),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: tabmanager.selected_tab,
          onTap: (index) {
            tabmanager.goToTab(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'To Buy',
            ),
          ],
        ),
      );
    });
  }
}
