import 'package:flutter/material.dart';
import 'package:my_app/recipes/models/models.dart';
import 'package:my_app/recipes/screens/explore_screen.dart';
import 'package:my_app/recipes/screens/grocery_screen.dart';
import 'package:my_app/recipes/screens/recipes_screen.dart';
import 'package:provider/provider.dart';

class RecipeInteractiveMain extends StatefulWidget {
  const RecipeInteractiveMain({Key? key}) : super(key: key);

  @override
  _RecipeInteractiveMainState createState() => _RecipeInteractiveMainState();
}

class _RecipeInteractiveMainState extends State<RecipeInteractiveMain> {
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    GroceryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          ChangeNotifierProvider(create: (context) => GroceryManager()),
        ],
        child: Consumer<TabManager>(
          builder: (context, tabManager, child) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Recipes',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              body:
                  IndexedStack(index: tabManager.selectedTab, children: pages),
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor:
                    Theme.of(context).textSelectionTheme.selectionColor,
                currentIndex: tabManager.selectedTab,
                onTap: (index) {
                  tabManager.goToTab(index);
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.explore),
                    label: 'Explore',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.book),
                    label: 'Recipes',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'To Buy',
                  ),
                ],
              ),
            );
          },
        ));
  }
}
