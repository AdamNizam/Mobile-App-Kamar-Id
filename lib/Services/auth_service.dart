import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hotelbookingapp/Models/AuthModel/form_login_model.dart';
import 'package:hotelbookingapp/Models/AuthModel/form_register_model.dart';
import 'package:hotelbookingapp/Models/AuthModel/result_login.dart';
import 'package:hotelbookingapp/Models/AuthModel/result_register.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  Future<LoginResponse> login(FormLoginModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data.toJson()),
      );

      debugPrint('Response log: ${res.body}');

      if (res.statusCode == 200) {
        LoginResponse userResultLog = LoginResponse.fromJson(
          jsonDecode(res.body),
        );

        await saveToken(userResultLog);

        // await saveCredentials(data.email.toString(), data.password.toString());

        return userResultLog;
      } else {
        throw Exception(jsonDecode(res.body)['message'] ?? 'Terjadi kesalahan');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginResponse> authFacebook(String accessToken) async {
    LoginResponse? userResultLog;
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/auth/social-callback/facebook'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': accessToken}),
      );

      debugPrint('Response Auth With Facebook: ${res.body}');

      if (res.statusCode == 200) {
        userResultLog = LoginResponse.fromJson(
          jsonDecode(res.body),
        );
        await saveToken(userResultLog);
      } else {
        throw Exception(jsonDecode(res.body)['message']);
      }
      return userResultLog;
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginResponse> authGoogle(String accessToken) async {
    LoginResponse? userResultLog;
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/auth/social-callback/google'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': accessToken}),
      );

      debugPrint('Response Auth With Google: ${res.body}');

      if (res.statusCode == 200) {
        userResultLog = LoginResponse.fromJson(
          jsonDecode(res.body),
        );
        await saveToken(userResultLog);
      } else {
        throw Exception(jsonDecode(res.body)['message']);
      }
      return userResultLog;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveToken(LoginResponse userLog) async {
    if (userLog.token != null && userLog.token!.isNotEmpty) {
      await storage.write(key: 'token', value: userLog.token);
    } else {
      throw Exception("Token tidak valid");
    }
  }

  Future<String> getToken() async {
    String? token = await storage.read(key: 'token');
    return token != null ? 'Bearer $token' : '';
  }

  // Future<void> saveCredentials(String email, String password) async {
  //   await storage.write(key: 'email', value: email);
  //   await storage.write(key: 'password', value: password);
  // }

  // Future<FormLoginModel?> getCredentialFromLocal() async {
  //   try {
  //     Map<String, String> values = await storage.readAll();

  //     if (values['email'] == null || values['password'] == null) {
  //       return null;
  //     } else {
  //       return FormLoginModel(
  //         email: values['email']!,
  //         password: values['password']!,
  //       );
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<void> logout() async {
    try {
      final token = await getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/auth/logout'),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode == 200) {
        await clearLocalStorage();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> clearLocalStorage() async {
    await storage.deleteAll();
  }

  Future<RegisterResponse> register(FormRegisterModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data.toJson()),
      );

      print('Register User Response: ${res.body}');

      if (res.statusCode == 200) {
        return RegisterResponse.fromJson(jsonDecode(res.body));
      } else {
        throw Exception(jsonDecode(res.body)['message'] ?? 'Terjadi kesalahan');
      }
    } catch (e) {
      rethrow;
    }
  }
}
