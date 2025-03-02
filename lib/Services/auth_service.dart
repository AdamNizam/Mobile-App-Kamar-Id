import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hotelbookingapp/Models/sign_in_form_model.dart';
import 'package:hotelbookingapp/Models/user_model.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<LoginResponseResult> login(SignInFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data.toJson()),
      );

      if (res.statusCode == 200) {
        LoginResponseResult userResultLog = LoginResponseResult.fromJson(
          jsonDecode(res.body),
        );

        await saveToken(userResultLog);
        await saveCredentials(data.email.toString(), data.password.toString());

        return userResultLog;
      } else {
        throw Exception(jsonDecode(res.body)['message'] ?? 'Terjadi kesalahan');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveToken(LoginResponseResult userLog) async {
    if (userLog.token != null && userLog.token!.isNotEmpty) {
      await storage.write(key: 'token', value: userLog.token);
    } else {
      throw Exception("Token tidak valid");
    }
  }

  Future<void> saveCredentials(String email, String password) async {
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'password', value: password);
  }

  Future<SignInFormModel> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();

      Map<String, String> values = await storage.readAll();

      if (values['email'] == null || values['password'] == null) {
        throw 'authenthicated';
      } else {
        final SignInFormModel data = SignInFormModel(
          email: values['email'],
          password: values['password'],
        );

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String? token = await storage.read(key: 'token');
    return token != null ? 'Bearer $token' : '';
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'email');
    await storage.delete(key: 'password');
  }
}
