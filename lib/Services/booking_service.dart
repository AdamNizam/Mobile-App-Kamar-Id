import 'dart:convert';

import 'package:hotelbookingapp/Models/booking_history_model.dart';
import 'package:hotelbookingapp/Services/auth_service.dart';
import 'package:hotelbookingapp/shared/shared_url.dart';
import 'package:http/http.dart' as http;

class BookingService {
  Future<List<BookingHistoryModel>> getBookingHistory() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/user/booking-history'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        final jsonData = jsonDecode(res.body);

        if (jsonData == null || !jsonData.containsKey('data')) {
          throw 'Data booking history tidak ditemukan';
        }

        return List<BookingHistoryModel>.from(
          jsonData['data'].map(
            (booking) => BookingHistoryModel.fromJson(booking),
          ),
        );
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
