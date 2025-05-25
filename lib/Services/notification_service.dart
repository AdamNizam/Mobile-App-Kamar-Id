import 'dart:convert';

import 'package:hotelbookingapp/Services/auth_service.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  Future<Map<String, dynamic>> loadNotify() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse(
            'https://develop.tripordare.com/api/notification/load-notify'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'type': 'unread'}),
      );

      print('Response API notification: ${res.body}');

      if (res.statusCode == 200) {
        final decoded = jsonDecode(res.body);
        return decoded; // return langsung hasil decode
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
