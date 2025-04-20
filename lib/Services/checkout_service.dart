import 'dart:convert';

import 'package:hotelbookingapp/Models/CheckoutModel/chekout_model.dart';
import 'package:hotelbookingapp/Models/ResponseResultModel/result_chekout.dart';
import 'package:hotelbookingapp/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class ChekoutService {
  Future<ResultChekout> doToChekout(CheckoutModel cartModel) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/booking/doCheckout'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(cartModel.toJson()),
      );

      // print('Result ChekOut : ${res.body}');

      if (res.statusCode == 200) {
        return ResultChekout.fromJson(jsonDecode(res.body));
      } else {
        throw jsonDecode(res.body)['error'] ?? 'Checkout failed!';
      }
    } catch (error) {
      rethrow;
    }
  }
}
