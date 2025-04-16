import 'dart:convert';

import 'package:hotelbookingapp/Models/UserModel/user_model.dart';
import 'package:hotelbookingapp/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<UserModel> getUserProfile() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/auth/me'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      // print('Response status User Data Profiel: ${res.body}');
      if (res.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(res.body)['data']);
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
