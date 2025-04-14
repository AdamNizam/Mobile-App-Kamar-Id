class MidtransModel {
  final TransactionDetails transactionDetails;
  final String paymentType;
  final CustomerDetails customerDetails;
  final BankTransfer bankTransfer;

  MidtransModel({
    required this.transactionDetails,
    required this.paymentType,
    required this.customerDetails,
    required this.bankTransfer,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      "transaction_details": transactionDetails.toJson(),
      "payment_type": paymentType,
      "customer_details": customerDetails.toJson(),
      "bank_transfer": bankTransfer.toJson(),
    };
    return json;
  }
}

class TransactionDetails {
  final String orderId;
  final int grossAmount;

  TransactionDetails({
    required this.orderId,
    required this.grossAmount,
  });

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "gross_amount": grossAmount,
      };
}

class CustomerDetails {
  final String email;

  CustomerDetails({
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}

class BankTransfer {
  final String bank;

  BankTransfer({required this.bank});

  Map<String, dynamic> toJson() => {
        "bank": bank,
      };
}
