import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:leaflite/authentication/domain/models/user.dart';
import 'package:leaflite/authentication/domain/repository/auth_manager.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  setUser(User user) {
    _user = user;
    AuthManager.saveUserModel(user);
    notifyListeners();
  }

  initUser() async {
    var userJson = await AuthManager.getUserModel();

    Map<String, dynamic> json = jsonDecode(userJson!);

    User user = User(
        id: json['id'],
        login_key: json['login_key'],
        email: json['email'],
        created_at: json['created_at']
    );

    _user = user;
    
  }

}
