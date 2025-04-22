import 'dart:convert';

import 'package:hotelbookingapp/Models/MidtransModel/request_midtrans.dart';
import 'package:hotelbookingapp/Models/MidtransModel/result_midtrans.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class PaymentMidtransService {
  Future<ResultMidtransModel> payWithMidtrans(
      RequestMidtrans midtransModel) async {
    try {
      final basicAuth = 'Basic ${base64Encode(utf8.encode('$serverKey:'))}';

      final res = await http.post(
        Uri.parse(midtransUrl),
        headers: {
          'Authorization': basicAuth,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(midtransModel.toJson()),
      );

      print("Midtrans response: ${res.body}");

      final statusCode = res.statusCode;
      final data = jsonDecode(res.body);

      final midtransStatusCode = data['status_code']?.toString() ?? '';

      if ((statusCode >= 200 && statusCode < 300) ||
          midtransStatusCode.startsWith('2')) {
        return ResultMidtransModel.fromJson(data);
      } else {
        throw jsonDecode(data)['message'] ?? 'Payment failed: $statusCode';
      }
    } catch (error) {
      rethrow;
    }
  }
}
