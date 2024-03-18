import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:leaflite/authentication/domain/repository/auth_manager.dart';

class DevicesService {
  static const baseUrl = 'http://10.0.0.112:3000'; 

  static Future<String> getDevices() async {
    final url = Uri.parse('$baseUrl/devices');
    final user_model = await AuthManager.getUserModel();
    final user_id = jsonDecode(user_model!)["id"];

    final response = await http.post(
      url,
      body: {
        'user_id': '${user_id ?? 0}', 
      },
    );
    
    var data = await jsonDecode(response.body);

    if (data['message'] != null && response.statusCode != 200) {
      throw Exception(data['message']);
    }
    
    return response.body;
  }

  static Future<String> registerDevice(String device_code) async {
    final url = Uri.parse('$baseUrl/devices/register');
    final user_model = await AuthManager.getUserModel();
    final user_id = jsonDecode(user_model!)["id"];

    final response = await http.post(
      url,
      body: {
        'user_id': '${user_id ?? 0}',
        'device_code': device_code 
      },
    );
    
    var data = await jsonDecode(response.body);

    if (data['message'] != null && response.statusCode != 200) {
      throw Exception(data['message']);
    }
    
    return response.body;
  }

  static Future<String> deleteDevice(int device_id) async {
    final url = Uri.parse('$baseUrl/devices/delete');

    final response = await http.post(
      url,
      body: {
        'device_id': '${device_id}'
      },
    );
    var data = await jsonDecode(response.body);

    if (data['message'] != null && response.statusCode != 201) {
      throw Exception(data['message']);
    }
    
    return response.body;
  }

}
