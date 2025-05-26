import 'dart:convert';
import 'dart:io';

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

  Future<ResultUserUpdate> updateProfile(RequestUserUpdate data) async {
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

      print(
        'Response API Update Profile & status code ${res.statusCode}: ${res.body}',
      );

      if (res.statusCode == 200) {
        final decoded = jsonDecode(res.body);

        if (decoded['status'] == 1) {
          return ResultUserUpdate.fromJson(decoded);
        } else {
          // Ubah Map jadi string
          final messageMap = decoded['message'] as Map<String, dynamic>;
          final messageList =
              messageMap.values.expand((e) => e as List).toList();
          final messageString = messageList.join('\n');

          throw messageString; // hanya teks error
        }
      } else {
        final error = jsonDecode(res.body)['message'];
        throw error.toString();
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

  Future<Map<String, dynamic>> uploadImageProfile(File file) async {
    try {
      final token = await AuthService().getToken();

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/admin/module/media/store'),
      );

      request.headers['Authorization'] = 'Bearer $token';

      request.files.add(await http.MultipartFile.fromPath('file', file.path));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw jsonDecode(response.body)['message'] ?? 'Gagal upload file';
      }
    } catch (error) {
      rethrow;
    }
  }
}
