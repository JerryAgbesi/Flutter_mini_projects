import 'package:flutter/material.dart';
import 'author_image.dart';
import 'package:recipez/recipez_theme.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({Key? key, required this.name, required this.title})
      : super(key: key);

  final String name;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const AuthorImage(
            image: AssetImage('assets/antonio.jpg'),
          ),
          Column(),

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(name, style: RecipezTheme.lightTextTheme.bodyText1),
          //     Text(title, style: RecipezTheme.lightTextTheme.bodyText1),
          //   ],
          // ),

          // const SizedBox(
          //   width: 10,
          // ),
          //
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
            ),
          ),
        ],
      ),
    );
  }
}
