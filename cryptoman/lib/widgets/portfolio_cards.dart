import 'package:flutter/material.dart';

class PortfolioCard extends StatelessWidget {
  PortfolioCard({super.key, required this.text, required this.selected});

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      width: 70,
      decoration: BoxDecoration(
        color: selected ? Color(0xFF187efe) : Color(0xFFECEEEE),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
          child: Text(
        "$text",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: selected ? Color(0xFFD3F2FF) : Color(0xFF353536)),
      )),
    );
  }
}

List<PortfolioCard> pCards = [
  PortfolioCard(text: "Profit", selected: true),
  PortfolioCard(text: "Loss", selected: false),
  PortfolioCard(text: "24 HR", selected: false)
];
