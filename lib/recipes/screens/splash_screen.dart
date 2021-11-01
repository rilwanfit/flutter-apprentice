import 'package:flutter/material.dart';
import 'package:my_app/recipes/models/models.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  // MaterialPage Helper
  static MaterialPage page() {
    return MaterialPage(
      name: Pages.splashPath,
      key: ValueKey(Pages.splashPath),
      child: const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize App
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              height: 200,
              image: AssetImage(
                  "assets/recipes/fooderlich_assets/loader-food.gif"),
            ),
            const Text('Initializing...'),
          ],
        ),
      ),
    );
  }
}
