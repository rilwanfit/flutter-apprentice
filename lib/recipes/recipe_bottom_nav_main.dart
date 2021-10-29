import 'package:flutter/material.dart';
import 'package:my_app/recipes/recipe_card1.dart';
import 'package:my_app/recipes/recipe_card2.dart';
import 'package:my_app/recipes/recipe_card3.dart';

class RecipeBottomNavMain extends StatefulWidget {
  const RecipeBottomNavMain({Key? key}) : super(key: key);

  @override
  _RecipeBottomNavMainState createState() => _RecipeBottomNavMainState();
}

class _RecipeBottomNavMainState extends State<RecipeBottomNavMain> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    const RecipeCard1(),
    const RecipeCard2(),
    const RecipeCard3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
