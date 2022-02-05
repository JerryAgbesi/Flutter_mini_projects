import 'package:flutter/material.dart';
import 'constants.dart';

class NewsCard extends StatelessWidget {
 
  final String title;
  final String author;

  NewsCard({
    Key? key,
    required this.author,
    required this.title,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 15, right: 10, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 2.0)],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          Text(title, style: titleFormat),
          const SizedBox(height: 8.0),
          Text(author),
        ],
      ),
    );
  }
}
