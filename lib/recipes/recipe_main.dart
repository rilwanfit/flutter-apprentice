import 'package:flutter/material.dart';
import 'package:my_app/recipes/recipe.dart';
import 'package:my_app/recipes/recipe_detail.dart';

class RecipeMain extends StatefulWidget {
  const RecipeMain({Key? key}) : super(key: key);

  @override
  _RecipeMainState createState() => _RecipeMainState();
}

class _RecipeMainState extends State<RecipeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: Recipe.samples.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RecipeDetail(
                        recipe: Recipe.samples[index],
                      );
                    }));
                  },
                  child: buildRecipeCard(Recipe.samples[index]),
                );
              })),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
        elevation: 2.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Image(image: AssetImage(recipe.imageUrl)),
              const SizedBox(
                height: 14.0,
              ),
              Text(
                recipe.label,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Palatino',
                ),
              )
            ],
          ),
        ));
  }
}
