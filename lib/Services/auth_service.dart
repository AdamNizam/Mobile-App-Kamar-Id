import 'dart:convert';

import 'package:hotelbookingapp/Models/sign_in_form_model.dart';
import 'package:hotelbookingapp/Models/user_model.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<LoginResponseResult> login(SignInFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        body: data.toJson(),
      );
      print(res.body);
      if (res.statusCode == 200) {
        LoginResponseResult resultLog = LoginResponseResult.fromJson(
          jsonDecode(res.body),
        );

        return resultLog;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
