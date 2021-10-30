import 'package:flutter/material.dart';
import 'package:my_app/recipes/api/mock_recipe_service.dart';
import 'package:my_app/recipes/components/friend_post_list_view.dart';
import 'package:my_app/recipes/components/today_recipe_list_view.dart';
import 'package:my_app/recipes/models/models.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockRecipeService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Add Nested List Views
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
                const SizedBox(height: 16),
                //Replace this with FriendPostListView
                FriendPostListView(
                  friendPosts: snapshot.data?.friendPosts ?? [],
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
