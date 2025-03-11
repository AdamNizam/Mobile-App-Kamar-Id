import 'dart:convert';

import 'package:hotelbookingapp/Models/user_model.dart';
import 'package:hotelbookingapp/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<List<DataProfile>> getUserProfile() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/auth/me'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        return List<DataProfile>.from(
          jsonDecode(res.body)['data']
              .map((profile) => DataProfile.fromJson(profile)),
        );
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
