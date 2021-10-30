import 'package:flutter/material.dart';
import 'package:my_app/recipes/components/components.dart';
import 'package:my_app/recipes/light_and_dark_theme.dart';
import 'package:my_app/recipes/models/models.dart';

class Card2 extends StatelessWidget {
  final ExploreRecipe recipe;
  const Card2({Key? key, required this.recipe}) : super(key: key);

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
              AuthorCard(
                authorName: recipe.authorName,
                title: recipe.role,
                imageProvider: AssetImage(recipe.profileImage),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: Text(
                        recipe.title,
                        style: LightAndDarkTheme.lightTextTheme.headline1,
                      ),
                    ),
                    Positioned(
                        bottom: 70,
                        left: 16,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            recipe.subtitle,
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
