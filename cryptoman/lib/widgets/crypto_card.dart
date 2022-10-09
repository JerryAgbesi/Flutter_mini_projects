import 'package:cryptoman/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CryptoCard extends StatelessWidget {
  CryptoCard(
      {super.key,
      required this.image,
      required this.rise,
      required this.percentage,
      required this.amount,
      required this.cryptoName,
      required this.description});

  String image;
  bool rise;
  String percentage;
  String amount;
  String cryptoName;
  String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 227, 228, 230),
              blurRadius: 7,
              spreadRadius: 1,
              offset: Offset(0.0, 4))
        ],
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset(
          '$image',
          scale: 1.5,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "$cryptoName",
              style: PortfolioCardText,
            ),
            Text(
              "$description",
              style: PortfolioCardText,
            ),
          ],
        ),
        Spacer(
          flex: 1,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("\$$amount", style: PortfolioCardText),
            Row(
              children: [
                Icon(
                  rise ? Icons.expand_less_rounded : Icons.expand_more,
                  color: rise ? riseColor : fallColor,
                ),
                Text(
                  "\$$percentage",
                  style:
                      TextStyle(color: rise?riseColor:fallColor, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}

List<CryptoCard> cryptos = [
  CryptoCard(
      image: 'assets/BTC.png',
      rise: true,
      percentage: '0.9',
      amount: '59,601.00',
      cryptoName: 'Bitcoin',
      description: 'BTC/USD'),
  CryptoCard(
      image: 'assets/ETH.png',
      rise: false,
      percentage: '0.25',
      amount: '21.784.00',
      cryptoName: 'Ethereum',
      description: 'ETH/USD'),
  CryptoCard(
      image: 'assets/BTC.png',
      rise: true,
      percentage: '0.9',
      amount: '59,601.00',
      cryptoName: 'Bitcoin',
      description: 'BTC/USD'),
];
