import 'dart:convert';

import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class PaymentService {
  Future<Map<String, dynamic>> payNow({
    required int totalPrice,
    required String selectedType,
    required String customerEmail,
    String? selectedBank,
  }) async {
    final orderId = "ORDER-${DateTime.now().millisecondsSinceEpoch}";
    final basicAuth = 'Basic ${base64Encode(utf8.encode('$serverKey:'))}';

    final Map<String, dynamic> body = {
      "transaction_details": {
        "order_id": orderId,
        "gross_amount": totalPrice,
      },
      "payment_type": selectedType,
      "customer_details": {
        "email": customerEmail,
      },
    };
    if (selectedType == 'bank_transfer' && selectedBank != null) {
      body["bank_transfer"] = {"bank": selectedBank};
    }
    try {
      final response = await http.post(
        Uri.parse(midtransUrl),
        headers: {
          'Authorization': basicAuth,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      final data = jsonDecode(response.body);

      print("Midtrans response: ${response.body}");

      final statusCode = response.statusCode;
      final midtransStatusCode = data['status_code']?.toString() ?? '';
      final statusMessage = data['status_message'] ?? 'No status message';

      if ((statusCode >= 200 && statusCode < 300) ||
          midtransStatusCode.startsWith('2')) {
        return data;
      } else {
        throw Exception("Payment failed: $statusMessage");
      }
    } catch (e) {
      throw Exception("Payment exception: $e");
    }
  }
}
