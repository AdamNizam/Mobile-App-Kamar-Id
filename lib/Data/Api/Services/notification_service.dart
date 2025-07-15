import 'dart:convert';

import 'package:hotelbookingapp/Data/Models/NotificationModel/result_notification.dart';
import 'package:hotelbookingapp/Data/Api/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;
// Tempat baseUrl didefinisikan

class NotificationService {
  Future<ResultNotification> loadNotify(String type) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/notification/load-notify'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'type': type}),
      );

      print('Response API notification: ${res.body}');

      if (res.statusCode == 200) {
        return ResultNotification.fromJson(jsonDecode(res.body));
      } else if (res.statusCode == 500) {
        throw Exception("Server error :  ${res.statusCode}");
      } else {
        throw jsonDecode(res.body)['message'];
      }
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
      } else if (res.statusCode == 500) {
        throw Exception("Server error :  ${res.statusCode}");
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
