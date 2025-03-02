import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hotelbookingapp/Models/sign_in_form_model.dart';
import 'package:hotelbookingapp/Models/sign_up_form_model.dart';
import 'package:hotelbookingapp/Models/user_model.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

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
      print('token : {$userLog.token}');
    } else {
      throw Exception("Token tidak valid");
    }
  }

  Future<void> saveCredentials(String email, String password) async {
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'password', value: password);
    print('email : {$email}');
    print('password : {$password}');
  }

  Future<SignInFormModel?> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();

      Map<String, String> values = await storage.readAll();

      if (values['email'] == null || values['password'] == null) {
        return null;
      } else {
        return SignInFormModel(
          email: values['email']!,
          password: values['password']!,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String? token = await storage.read(key: 'token');
    return token != null ? 'Bearer $token' : '';
  }

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

  Future<RegisterResponseResult> register(SignUpFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data.toJson()),
      );
      print('response ${res.body}');

      if (res.statusCode == 200) {
        return RegisterResponseResult.fromJson(jsonDecode(res.body));
      } else {
        throw Exception(jsonDecode(res.body)['message'] ?? 'Terjadi kesalahan');
      }
    } catch (e) {
      rethrow;
    }
  }
}
