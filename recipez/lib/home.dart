import 'package:flutter/material.dart';
import 'recipez_theme.dart';
import 'pages/pages.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = [
    const Card1(),
   const Card2(),
    Container(
      color: Colors.green,
    ),
  ];

  void _selected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Foodiez',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _selected,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.card_giftcard,
              ),
              label: 'card1',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.card_giftcard,
              ),
              label: 'card2',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.card_giftcard,
              ),
              label: 'card3',
            ),
          ]),
    );
  }
}
