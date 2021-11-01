import 'package:flutter/material.dart';
import 'models.dart';

class ProfileManager extends ChangeNotifier {
  User get getUser => User(
      firstName: 'Ahmed Yasha',
      lastName: 'Rilwan',
      role: 'Flutterista',
      profileImageUrl: 'assets/recipes/author.jpg',
      points: 100,
      darkMode: _darkMode);

  bool get didSelectUser => _didSelectUser;
  bool get didTapOnKinit => _tapOnKinit;
  bool get darkMode => _darkMode;

  var _didSelectUser = false;
  var _tapOnKinit = false;
  var _darkMode = false;

  void set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  void tapOnKinit(bool selected) {
    _tapOnKinit = selected;
    notifyListeners();
  }

  void tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}
