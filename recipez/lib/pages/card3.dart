import 'package:flutter/material.dart';
import 'package:recipez/recipez_theme.dart';

class Card3 extends StatelessWidget {
  const Card3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 400, height: 500),
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/mag2.png')),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.book,
                    size: 40,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Recipe Trends',
                    style: RecipezTheme.darkTextTheme.headline2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 12.0,
                      children: [
                        Chip(
                          label: Text(
                            'Vegan',
                            style: RecipezTheme.darkTextTheme.bodyText1,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                        ),
                        Chip(
                          label: Text(
                            'healthy',
                            style: RecipezTheme.darkTextTheme.bodyText1,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onDeleted: () => print('delete'),
                        ),
                        Chip(
                          label: Text(
                            'Carrot',
                            style: RecipezTheme.darkTextTheme.bodyText1,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                        ),
                        Chip(
                          label: Text(
                            'Low Fat',
                            style: RecipezTheme.darkTextTheme.bodyText1,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                        ),
                        Chip(
                          label: Text(
                            'Ghanaian',
                            style: RecipezTheme.darkTextTheme.bodyText1,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                        ),
                        Chip(
                          label: Text(
                            'Pizza',
                            style: RecipezTheme.darkTextTheme.bodyText1,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
