import 'dart:convert';

import 'package:hotelbookingapp/Models/MidtransModel/request_midtrans.dart';
import 'package:hotelbookingapp/Models/MidtransModel/result_midtrans.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class PaymentMidtransService {
  Future<ResultMidtransModel> payWithMidtrans(
      RequestMidtrans midtransModel) async {
    try {
      final authHeader = 'Basic ${base64Encode(utf8.encode('$serverKey:'))}';

      final res = await http.post(
        Uri.parse(midtransUrl),
        headers: {
          'Authorization': authHeader,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(midtransModel.toJson()),
      );

      print("Midtrans respon body: ${res.body}");

      final data = jsonDecode(res.body);
      final statusCode = data['status_code']?.toString() ?? '';

      if (statusCode.startsWith('2')) {
        return ResultMidtransModel.fromJson(data);
      } else {
        throw data['status_message'].toString();
      }
    } catch (error) {
      rethrow;
    }
  }
}
