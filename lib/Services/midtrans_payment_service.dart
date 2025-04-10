import 'dart:convert';

import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class PaymentService {
  Future<Map<String, dynamic>> payNow({
    required int totalPrice,
    required String selectedType,
    String? selectedBank,
  }) async {
    final orderId = "ORDER-${DateTime.now().millisecondsSinceEpoch}";
    final basicAuth = 'Basic ${base64Encode(utf8.encode('$serverKey:'))}';

    final body = {
      "transaction_details": {
        "order_id": orderId,
        "gross_amount": totalPrice,
      },
      "payment_type": selectedType,
    };

    if (selectedType == 'bank_transfer') {
      body["bank_transfer"] = {"bank": selectedBank};
    }

    final response = await http.post(
      Uri.parse(midtransUrl),
      headers: {
        'Authorization': basicAuth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 201 && data['status_code'] == '201') {
      return data;
    } else {
      throw Exception("Payment failed: ${data['status_message']}");
    }
  }
}
