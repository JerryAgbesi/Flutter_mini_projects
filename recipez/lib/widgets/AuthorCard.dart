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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const AuthorImage(
                image: AssetImage('assets/antonio.jpg'),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: RecipezTheme.lightTextTheme.bodyText1),
                  Text(title, style: RecipezTheme.lightTextTheme.bodyText1),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              const snackbar = SnackBar(
                content: Text('You like smoothies?'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
            icon: const Icon(
              Icons.favorite_border,
              size: 30,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
