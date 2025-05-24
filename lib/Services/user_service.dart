import 'dart:convert';

import 'package:hotelbookingapp/Models/UserModel/form_update_password.dart';
import 'package:hotelbookingapp/Models/UserModel/request_user_update.dart';
import 'package:hotelbookingapp/Models/UserModel/result_update_password.dart';
import 'package:hotelbookingapp/Models/UserModel/result_user_update.dart';
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

      print('Response API Get Profile: ${res.body}');

      if (res.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(res.body)['data']);
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<ResultUserUpdate> updatePorfile(RequestUserUpdate data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/auth/me'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data.toJson()),
      );

      print('Response API Update Profile: ${res.body}');

      if (res.statusCode == 200) {
        return ResultUserUpdate.fromJson(jsonDecode(res.body));
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<ResultUpdatePassword> updatePassword(FormUpdatePassword data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/auth/change-password'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data.toJson()),
      );

      print('Response API Update Password: ${res.body}');

      if (res.statusCode == 200) {
        return ResultUpdatePassword.fromJson(jsonDecode(res.body));
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (error) {
      rethrow;
    }
  }
}
