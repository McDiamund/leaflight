import 'package:flutter/material.dart';
import 'package:leaflite/authentication/domain/repository/auth_manager.dart';

class AuthProvider extends ChangeNotifier {

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  AuthProvider() {
    getLoggedIn().then((val) {
      _isLoggedIn = val;
    });
    notifyListeners();
  }

  static Future<bool> getLoggedIn() async {
    return await AuthManager.isLoggedIn();
  }

  loginUser() async {
    await AuthManager.loginUser();
    _isLoggedIn = true;
    notifyListeners();
  }

  logoutUser() async {
    await AuthManager.logoutUser();
    _isLoggedIn = false;
    notifyListeners();
  }

}
