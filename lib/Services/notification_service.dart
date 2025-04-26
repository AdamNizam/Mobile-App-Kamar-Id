import 'dart:convert';

import 'package:hotelbookingapp/Models/NotificationModel/result_notification.dart';
import 'package:hotelbookingapp/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  Future<ResultNotification> notification(String type) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/notification/load-notify'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'type': type}),
      );

      print('Response API notification: ${res.body}');

      if (res.statusCode == 200) {
        return ResultNotification.fromJson(jsonDecode(res.body));
      } else {
        throw Exception('Failed to load notification');
      }
    } catch (e) {
      rethrow;
    }
  }
}
