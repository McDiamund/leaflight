import 'dart:convert';

import 'package:leaflite/authentication/domain/models/user.dart';
import 'package:leaflite/authentication/domain/service/auth_service.dart';

class UserService {
  static Future<User> signin(username, password) async {
    final response = await AuthService.signin(username, password);
    final data = await jsonDecode(response);

    if (data['message'] != null) {
      throw Exception(data['message']);
    }

    User userData = User(
      id: data['user']['id'],
      login_key: data['user']['login_key'],
      email: data['user']['email'],
      created_at: data['user']['created_at']
    );

    return userData;
  }
}
