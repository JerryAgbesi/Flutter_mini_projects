import 'package:flutter/material.dart';
import 'package:recipez/recipez_theme.dart';
import 'package:recipez/widgets/AuthorCard.dart';
import 'package:recipez/widgets/author_image.dart';

class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);

  final chefName = 'Antonio';
  final title = 'Smoothie Connoisseur ';
  final name = 'Smoothies';
  final recipe = 'Recipe';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          children: [
           AuthorCard(name: 'Antonio', title: 'Smoothie Connoissieur'),
            Positioned(
                bottom: 30,
                right: 20,
                child:
                    Text(recipe, style: RecipezTheme.lightTextTheme.headline1)),
          ],
        ),
        constraints: const BoxConstraints.expand(width: 400, height: 500),
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/mag5.png'),
          ),
        ),
      ),
    );
  }
}
