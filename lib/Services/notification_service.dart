import 'dart:convert';

import 'package:hotelbookingapp/Models/NotificationModel/result_notification.dart';
import 'package:hotelbookingapp/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;
// Tempat baseUrl didefinisikan

class NotificationService {
  Future<ResultNotification> loadNotify(String type) async {
    try {
      final token = await AuthService().getToken();

      final response = await http.post(
        Uri.parse('$baseUrl/notification/load-notify'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'type': type}),
      );

      print('Response API notification: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ResultNotification.fromJson(data);
      } else {
        final error = jsonDecode(response.body);
        throw Exception(error['message'] ?? 'Terjadi kesalahan');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
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
