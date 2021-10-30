import 'package:flutter/material.dart';
import 'package:my_app/recipes/api/mock_recipe_service.dart';

import '../models/models.dart';
import '../components/components.dart';

class RecipesScreen extends StatelessWidget {
  final exploreService = MockRecipeService();

  RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return RecipesGridView(recipes: snapshot.data ?? []);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
