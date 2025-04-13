import 'dart:convert';

import 'package:hotelbookingapp/Models/MidtransModel/midtrans_model.dart';
import 'package:hotelbookingapp/Models/ResponseResultModel/result_midtrans.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class PaymentMidtransService {
  Future<MidtransResponseResult> payWithMidtrans({
    required int totalPrice,
    required String selectedType,
    required String customerEmail,
    String? selectedBank,
  }) async {
    final orderId = "ORDER-${DateTime.now().millisecondsSinceEpoch}";
    final basicAuth = 'Basic ${base64Encode(utf8.encode('$serverKey:'))}';

    final body = MidtransModel(
      transactionDetails: TransactionDetails(
        orderId: orderId,
        grossAmount: totalPrice,
      ),
      paymentType: selectedType,
      customerDetails: CustomerDetails(
        email: customerEmail,
      ),
      bankTransfer: selectedType == 'bank_transfer' && selectedBank != null
          ? BankTransfer(bank: selectedBank)
          : null,
    ).toJson();

    try {
      final res = await http.post(
        Uri.parse(midtransUrl),
        headers: {
          'Authorization': basicAuth,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      print("Midtrans response: ${res.body}");

      final statusCode = res.statusCode;
      final data = jsonDecode(res.body);

      final midtransStatusCode = data['status_code']?.toString() ?? '';
      final statusMessage = data['status_message'] ?? 'No status message';

      if ((statusCode >= 200 && statusCode < 300) ||
          midtransStatusCode.startsWith('2')) {
        return MidtransResponseResult.fromJson(data);
      } else {
        throw Exception("Payment failed: $statusMessage");
      }
    } catch (error) {
      throw Exception("Payment exception: $error");
    }
  }
}
