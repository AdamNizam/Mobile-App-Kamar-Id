import 'dart:convert';

import 'package:hotelbookingapp/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  Future<Map<String, dynamic>> loadNotify() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/notification/load-notify'),
        headers: {'Authorization': token},
        body: jsonEncode(
          {'type': 'unread'},
        ),
      );

      print('Response API notification: ${res.body}');

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> readNotif(List<int> ids) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/notification/load-notify'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {'ids': ids},
        ),
      );

      print('Response Read notification: ${res.body}');

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
