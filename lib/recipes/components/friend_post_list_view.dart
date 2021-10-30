import 'package:flutter/material.dart';
import 'package:my_app/recipes/components/components.dart';

import 'package:my_app/recipes/models/models.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> friendPosts;

  const FriendPostListView({
    Key? key,
    required this.friendPosts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Social Chefs 👩‍🍳',
              style: Theme.of(context).textTheme.headline4),
          const SizedBox(height: 16),
          // Add PostListView here
          ListView.separated(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: friendPosts.length,
            itemBuilder: (context, index) {
              final post = friendPosts[index];
              return FriendPostTile(post: post);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
