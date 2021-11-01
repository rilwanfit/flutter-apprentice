import 'dart:async';
import 'package:flutter/material.dart';

class RecipeTab {
  static const int explore = 0;
  static const int recipe = 1;
  static const int toBuy = 2;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _onboardingComplete = false;
  int _selectedTab = RecipeTab.explore;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;
  int get getSelectedTab => _selectedTab;

  // Initialize app
  void initializeApp() {
    Timer(const Duration(microseconds: 2000), () {
      _initialized = true;
      notifyListeners();
    });
  }

  // Login
  void login(String username, String password) {
    _loggedIn = true;
    notifyListeners();
  }

  // Complete onboarding
  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }

  // goToTab
  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  // goToRecipes
  void goToRecipes() {
    _selectedTab = RecipeTab.recipe;
    notifyListeners();
  }

  // Logout
  void logout() {
    _loggedIn = false;
    _onboardingComplete = false;
    _initialized = false;
    _selectedTab = 0;

    initializeApp();

    notifyListeners();
  }
}
