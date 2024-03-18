import 'dart:convert';

import 'package:http/http.dart' as http;


class AuthService {
  static const baseUrl = 'http://10.0.0.112:3000'; 

  static Future<String> signup(
    String email,
    String password,
    ) async {
    final url = Uri.parse('$baseUrl/signup');

    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password
      },
    );

    if (response.statusCode == 201) {
      // Signup successful
      return response.body; // Return any response data from the API
    } else {
      throw Exception('Signup failed');
    }
  }

  static Future<String> signin(String email, String password) async {
    final url = Uri.parse('$baseUrl/signin');

    final response = await http.post(
      url,
      body: {
        'email': email, 
        'password': password,
      },
    );
    
    var data = await jsonDecode(response.body);

    if (data['message'] != null && response.statusCode != 200) {
      throw Exception(data['message']);
    }
    
    return response.body;
  }

}
