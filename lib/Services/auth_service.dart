import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

        return userResultLog;
      } else {
        throw Exception(jsonDecode(res.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginResponse> logFacebook(String accessToken) async {
    LoginResponse? userResultLog;
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/auth/social-callback/facebook'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': accessToken}),
      );

      debugPrint('Response API Auth With Facebook: ${res.body}');

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

  Future<LoginResponse> logGoogle(String accessToken) async {
    LoginResponse? userResultLog;
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/auth/social-callback/google'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': accessToken}),
      );

      debugPrint('Response API Auth With Google: ${res.body}');

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

      if (userLog.expiresIn != null) {
        final expiredAt = DateTime.now()
            .add(Duration(seconds: userLog.expiresIn!))
            .millisecondsSinceEpoch
            .toString();
        await storage.write(key: 'expiredTime', value: expiredAt);
      }
    } else {
      throw Exception("Token invalid");
    }
  }

  Future<String> getToken() async {
    String? token = await storage.read(key: 'token');
    return token != null ? 'Bearer $token' : '';
  }

  Future<bool> isTokenValid() async {
    final token = await storage.read(key: 'token');
    final expiredStr = await storage.read(key: 'expiredTime');

    if (token == null || expiredStr == null) return false;

    final expiredAt = int.tryParse(expiredStr);
    if (expiredAt == null) return false;

    final now = DateTime.now().millisecondsSinceEpoch;
    return now < expiredAt;
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

  Future<void> logout() async {
    await storage.deleteAll();
    await FacebookAuth.instance.logOut();
    await GoogleSignIn().signOut();
  }
}
