import 'dart:convert';

import 'package:hotelbookingapp/Models/BookingModel/add_to_chart_model.dart';
import 'package:hotelbookingapp/Models/ResponseResultModel/result_add_to_chart.dart';
import 'package:hotelbookingapp/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class BookingService {
  Future<ResponseResultAddToChart> addToChart(AddToCartModel cartModel) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/booking/addToCart'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(cartModel.toJson()),
      );

      if (res.statusCode == 200) {
        return ResponseResultAddToChart.fromJson(jsonDecode(res.body));
      } else {
        throw jsonDecode(res.body)['message'] ?? 'Booking failed!';
      }
    } catch (error) {
      rethrow;
    }
  }
}
