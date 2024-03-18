import 'dart:convert';

import 'package:leaflite/authentication/domain/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthManager {
  static const _loggedInKey = 'loggedIn';
  static const _userModelKey = 'userModel';

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loggedInKey) ?? false;
  }

  static Future<void> saveUserModel(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = json.encode(user.toJson());
    await prefs.setString(_userModelKey, userJson);
  }

  static Future<String?> getUserModel() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userModelKey);
  }

  static Future<void> loginUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loggedInKey, true);
  }

  static Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loggedInKey, false);
    await prefs.remove(_userModelKey);
  }
}