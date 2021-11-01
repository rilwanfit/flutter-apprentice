import 'package:flutter/material.dart';
import 'package:my_app/recipes/models/models.dart';
import 'package:my_app/recipes/screens/grocery_item_screen.dart';
import 'package:my_app/recipes/screens/home.dart';
import 'package:my_app/recipes/screens/login_screen.dart';
import 'package:my_app/recipes/screens/onboarding_screen.dart';
import 'package:my_app/recipes/screens/profile_screen.dart';
import 'package:my_app/recipes/screens/splash_screen.dart';
import 'package:my_app/recipes/screens/webview_screen.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;
  final GroceryManager groceryManager;
  final ProfileManager profileManager;

  AppRouter({
    required this.appStateManager,
    required this.groceryManager,
    required this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    groceryManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    groceryManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.isInitialized) SplashScreen.page(),
        if (appStateManager.isInitialized && !appStateManager.isLoggedIn)
          LoginScreen.page(),
        if (appStateManager.isLoggedIn && !appStateManager.isOnboardingComplete)
          OnboardingScreen.page(),
        if (appStateManager.isOnboardingComplete)
          Home.page(appStateManager.getSelectedTab),
        if (groceryManager.isCreatingNewItem)
          GroceryItemScreen.page(onCreate: (item) {
            groceryManager.addItem(item);
          }, onUpdate: (item, index) {
            // No update
          }),
        if (groceryManager.selectedIndex != -1)
          GroceryItemScreen.page(
              item: groceryManager.selectedGroceryItem,
              index: groceryManager.selectedIndex,
              onUpdate: (item, index) {
                groceryManager.updateItem(item, index);
              },
              onCreate: (_) {
                // 4 No create
              }),
        if (profileManager.didSelectUser)
          ProfileScreen.page(profileManager.getUser),
        if (profileManager.didTapOnKinit) WebViewScreen.page()
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    // TODO: Handle Onboarding and splash
    // Handle state when user closes grocery item screen
    if (route.settings.name == Pages.groceryItemDetails) {
      groceryManager.groceryItemTapped(-1);
    }
    // Handle state when user closes profile screen
    if (route.settings.name == Pages.profilePath) {
      profileManager.tapOnProfile(false);
    }
    // Handle state when user closes WebView screen
    if (route.settings.name == Pages.kinit) {
      profileManager.tapOnKinit(false);
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
