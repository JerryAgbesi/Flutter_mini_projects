import 'package:flutter/material.dart';
import 'author_image.dart';
import 'package:recipez/recipez_theme.dart';

class AuthorCard extends StatefulWidget {
  const AuthorCard({Key? key, required this.name, required this.title})
      : super(key: key);

  final String name;
  final String title;

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isfavorite = false;

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
                  Text(widget.name,
                      style: RecipezTheme.lightTextTheme.bodyText1),
                  Text(widget.title,
                      style: RecipezTheme.lightTextTheme.bodyText1),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _isfavorite = !_isfavorite;
              });
              const snackbar = SnackBar(
                content: Text('You like smoothies?'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
            icon: Icon(
              _isfavorite ? Icons.favorite : Icons.favorite_border,
              size: 30,
              color: Colors.red[400],
            ),
          ),
        ],
      ),
    );
  }
}
