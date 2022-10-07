import 'package:flutter/material.dart';
import 'package:cryptoman/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key,});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0.0,
              unselectedItemColor: Color(0xFFA1A6B1),
              selectedItemColor: Color(0xFF187efe),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_rounded), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance_wallet_rounded),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bar_chart_rounded), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list_alt_rounded), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble_rounded), label: ""),
              ]),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.grid_view_rounded,
                      color: Color(0xFF232527),
                    ),
                    Icon(Icons.notifications, color: Color(0xFF232527))
                  ]),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 2, 0),
              height: 0.23 * MediaQuery.of(context).size.height,
              width: double.infinity,
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                        width: 15,
                      ),
                  scrollDirection: Axis.horizontal,
                  itemCount: cards.length,
                  itemBuilder: (BuildContext context, int index) {
                    return cards[index];
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "For You",
                  style: TextStyle(
                      color: Color(0xFF353536),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 2, 0),
              height: 130,
              width: double.infinity,
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                        width: 15,
                      ),
                  scrollDirection: Axis.horizontal,
                  itemCount: ForYouCards.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ForYouCards[index];
                  }),
            ),
          ]),
        ),
      );
    });
  }
}
