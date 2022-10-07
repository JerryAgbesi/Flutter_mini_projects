import 'package:cryptoman/widgets/constants.dart';
import 'package:flutter/material.dart';

class ForYouCard extends StatelessWidget {
  ForYouCard(
      {super.key,
      required this.icon,
      required this.label,
      required this.cardColor,
      required this.iconColor,
      required this.state});

  IconData icon;
  String label;
  Color cardColor;
  Color iconColor;
  bool state = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(
          height: 10,
        ),
        Text(label,
            style: this.state
                ? debitCardText.copyWith(fontWeight: FontWeight.w600)
                : TextStyle(
                    color: Color(0xFF232527),
                    fontWeight: FontWeight.w600,
                  ))
      ]),
    );
  }
}

List<ForYouCard> ForYouCards = [
  ForYouCard(
    icon: Icons.menu_book_rounded,
    label: "Learn Crypto \nEarn Crypto",
    cardColor: Color(0xFF187efe),
    iconColor: Color(0xFFD3F2FF),
    state: true,
  ),
  ForYouCard(
    icon: Icons.calendar_today_outlined,
    label: "DCA \nSimulation",
    cardColor: Color(0xFFF6F6F6),
    iconColor: Color(0xFF187efe),
    state: false,
  ),
  ForYouCard(
    icon: Icons.people_outline,
    label: "Join \nCommunity",
    cardColor: Color(0xFFF6F6F6),
    iconColor: Color(0xFF187efe),
    state: false,
  ),
];
