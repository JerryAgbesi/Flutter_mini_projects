import 'package:flutter/material.dart';
import 'package:recipez/recipez_theme.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);

  final category = 'Editor\'s Choice';
  final title = 'The Art of Dough';
  final description = 'Learn to make the perfect Bread';
  final chef = 'Jerry Elikem';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: 10,
              child: Text(
                category,
                style: RecipezTheme.darkTextTheme.bodyText1,
              ),
            ),
            Positioned(
                top: 30,
                left: 10,
                child:
                    Text(title, style: RecipezTheme.darkTextTheme.headline2)),
            Positioned(
                bottom: 50,
                right: 15,
                child: Text(description,
                    style: RecipezTheme.darkTextTheme.bodyText1)),
            Positioned(
                bottom: 30,
                right: 15,
                child: Text(chef, style: RecipezTheme.darkTextTheme.bodyText1)),
          ],
        ),
        constraints: const BoxConstraints.expand(width: 400, height: 500),
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/mag1.png'),
          ),
        ),
      ),
    );
  }
}
