import 'package:flutter/material.dart';
import 'constants.dart';

class DebitCard extends StatelessWidget {
  const DebitCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Color(0xFF187efe),
      ),
      height: 0.25 * size.height,
      width: 0.85 * size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Wallet",
                style: debitCardText,
              ),
              Image.asset(
                'assets/mastercard_logo.png',
                scale: 3,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Balance",
            style: debitCardText,
          ),
          Text(
            "\$2,946",
            style: debitCardText.copyWith(
                fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
          Text(
            "/USD",
            style: debitCardText,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Option(
                icon: Icons.storage_rounded,
                label: 'Deposit',
              ),
              Option(
                icon: Icons.wallet_rounded,
                label: 'Withdraw',
              ),
              Option(
                icon: Icons.read_more_rounded,
                label: 'More',
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Option extends StatelessWidget {
  Option({required this.icon, required this.label});

  IconData icon;
  String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: Color(0xFFD3F2FF),
            size: 30,
          ),
          SizedBox(width: 5),
          Text(
            label,
            style: debitCardText,
          ),
        ],
      ),
    );
  }
}
