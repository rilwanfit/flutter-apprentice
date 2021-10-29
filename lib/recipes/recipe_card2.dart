import 'package:flutter/material.dart';
import 'package:my_app/recipes/author_card.dart';
import 'package:my_app/recipes/light_and_dark_theme.dart';

class RecipeCard2 extends StatelessWidget {
  const RecipeCard2({Key? key}) : super(key: key);

  final String description = 'Smoothies';
  final String title = 'Recipe';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          constraints: const BoxConstraints.expand(
            width: 350,
            height: 450,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/recipes/mag5.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            children: [
              const AuthorCard(
                authorName: 'Ahmed Yasha',
                title: 'Smoothie Connoisseur',
                imageProvider: AssetImage('assets/recipes/author.jpg'),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: Text(
                        title,
                        style: LightAndDarkTheme.lightTextTheme.headline1,
                      ),
                    ),
                    Positioned(
                        bottom: 70,
                        left: 16,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            description,
                            style: LightAndDarkTheme.lightTextTheme.bodyText1,
                          ),
                        )),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
