import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Data/Api/auth_service.dart';
import 'package:hotelbookingapp/Data/Models/BookingModel/history_booking.model.dart';
import 'package:hotelbookingapp/Data/Models/BookingModel/request_add_to_chart.dart';
import 'package:hotelbookingapp/Data/Models/BookingModel/result_add_to_chart.dart';
import 'package:hotelbookingapp/Data/Models/CheckoutModel/request_chekout.dart';
import 'package:hotelbookingapp/Data/Models/CheckoutModel/result_chekout.dart';
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
      print('Response add to cart:  ${res.body}');

      if (res.statusCode == 200) {
        if (jsonDecode(res.body)['status'] == 0) {
          throw jsonDecode(res.body)['message'];
        }
        return ResultAddToCart.fromJson(jsonDecode(res.body));
      } else {
        throw jsonDecode(res.body)['message'] ?? 'Booking failed!';
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<ResultChekout> doToChekout(RequestChekout data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/booking/doCheckout'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data.toJson()),
      );

      debugPrint('Response API do Chekout: ${res.body}');

      if (res.statusCode == 200) {
        return ResultChekout.fromJson(jsonDecode(res.body));
      } else if (res.statusCode == 500) {
        debugPrint('response api error 500: ${res.body}');
        throw Exception(
            "Server ${res.statusCode} ${jsonDecode(res.body)['errors']}");
      } else {
        throw jsonDecode(res.body)['meesage'];
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

      debugPrint('Response GET History Booking ${res.body}');

      if (res.statusCode == 200) {
        return HistoryBookingModel.fromJson(jsonDecode(res.body));
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
