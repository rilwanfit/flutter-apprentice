import 'package:flutter/material.dart';
import 'package:my_app/recipes/light_and_dark_theme.dart';

class RecipeLightAndDarkMain extends StatefulWidget {
  const RecipeLightAndDarkMain({Key? key}) : super(key: key);

  @override
  _RecipeLightAndDarkMainState createState() => _RecipeLightAndDarkMainState();
}

class _RecipeLightAndDarkMainState extends State<RecipeLightAndDarkMain> {
  @override
  Widget build(BuildContext context) {
    // Create theme
    final theme = LightAndDarkTheme.dark();

    // TODO: Apply Home widget
    // 3
    return MaterialApp(
      // Add theme
      theme: theme,
      title: 'Recipe light and dark theme',
      // 4
      home: Scaffold(
        // Styled title
        appBar: AppBar(
            title: Text(
          'Recipe L&D',
          style: theme.textTheme.headline6,
        )),
        //Styled body text
        body: Center(
            child: Text(
          'Let\'s get cooking 👩‍🍳',
          style: theme.textTheme.headline1,
        )),
      ),
    );
  }
}
