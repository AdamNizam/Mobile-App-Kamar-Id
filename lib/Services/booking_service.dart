import 'dart:convert';

import 'package:hotelbookingapp/Models/BookingModel/history_booking.model.dart';
import 'package:hotelbookingapp/Models/BookingModel/request_add_to_chart.dart';
import 'package:hotelbookingapp/Models/BookingModel/result_add_to_chart.dart';
import 'package:hotelbookingapp/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class BookingService {
  Future<ResultAddToCart> addToChart(RequestAddToChart data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/booking/addToCart'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data.toJson()),
      );

      if (res.statusCode == 200) {
        return ResultAddToCart.fromJson(jsonDecode(res.body));
      } else {
        throw jsonDecode(res.body)['message'] ?? 'Booking failed!';
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<HistoryBookingModel> getHistoryBooking() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/user/booking-history'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      // print('RESPONSE GET History Booking ${res.body}');

      if (res.statusCode == 200) {
        return HistoryBookingModel.fromJson(jsonDecode(res.body));
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
