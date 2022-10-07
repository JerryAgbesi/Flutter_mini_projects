import 'package:flutter/material.dart';
import 'widgets/debit_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Man',
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.grid_view_rounded,
                      color: Color(0xFF232527),
                    ),
                    Icon(Icons.notifications, color: Color(0xFF232527))
                  ]),
              SizedBox(
                height: 15,
              ),
              DebitCard(),
            ]),
          ),
        ),
      ),
    );
  }
}
