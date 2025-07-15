import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Data/Models/UserModel/form_update_password.dart';
import 'package:hotelbookingapp/Data/Models/UserModel/request_user_update.dart';
import 'package:hotelbookingapp/Data/Models/UserModel/result_image_profile.dart';
import 'package:hotelbookingapp/Data/Models/UserModel/result_update_password.dart';
import 'package:hotelbookingapp/Data/Models/UserModel/result_user_update.dart';
import 'package:hotelbookingapp/Data/Models/UserModel/user_model.dart';
import 'package:hotelbookingapp/Data/Api/Services/auth_service.dart';
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
          throw decoded['message']?.toString() ?? '-';
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
      } else if (res.statusCode == 500) {
        throw Exception("Server error :  ${res.statusCode}");
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<ResultImageProfile> uploadImageProfile(File file) async {
    try {
      final token = await AuthService().getToken();

      var res = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/admin/module/media/store'),
      );

      res.headers['Authorization'] = 'Bearer $token';
      res.files.add(await http.MultipartFile.fromPath('file', file.path));

      var streamedResponse = await res.send();
      var response = await http.Response.fromStream(streamedResponse);

      debugPrint(
          'Response Upload Image & status code ${response.statusCode}: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == 1 && data['uploaded'] == 1) {
          return ResultImageProfile.fromJson(data);
        } else {
          final errorMessage =
              data['error']?['message'] ?? data['message'] ?? 'Upload gagal';
          throw Exception(errorMessage);
        }
      } else if (response.statusCode == 500) {
        throw Exception("Server error :  ${response.statusCode}");
      } else {
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (error) {
      rethrow;
    }
  }
}
