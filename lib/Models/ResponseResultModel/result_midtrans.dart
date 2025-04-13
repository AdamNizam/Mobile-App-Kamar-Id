class MidtransResult {
  final String transactionId;
  final String paymentType;
  final String transactionStatus;
  final String statusCode;
  final String grossAmount;
  final String? orderId;
  final String? merchantId;
  final String? currency;
  final String? transactionTime;
  final String? fraudStatus;
  final String? expiryTime;
  final String? qrString;
  final String? acquirer;
  final List<VaNumber>? vaNumbers;
  final List<ActionUrl>? actions;

  MidtransResult({
    required this.transactionId,
    required this.paymentType,
    required this.transactionStatus,
    required this.statusCode,
    required this.grossAmount,
    this.orderId,
    this.merchantId,
    this.currency,
    this.transactionTime,
    this.fraudStatus,
    this.expiryTime,
    this.qrString,
    this.acquirer,
    this.vaNumbers,
    this.actions,
  });

  factory MidtransResult.fromJson(Map<String, dynamic> json) {
    return MidtransResult(
      transactionId: json['transaction_id'] ?? '',
      paymentType: json['payment_type'] ?? '',
      transactionStatus: json['transaction_status'] ?? '',
      statusCode: json['status_code'] ?? '',
      grossAmount: json['gross_amount'] ?? '',
      orderId: json['order_id'],
      merchantId: json['merchant_id'],
      currency: json['currency'],
      transactionTime: json['transaction_time'],
      fraudStatus: json['fraud_status'],
      expiryTime: json['expiry_time'],
      qrString: json['qr_string'],
      acquirer: json['acquirer'],
      vaNumbers: json['va_numbers'] != null
          ? (json['va_numbers'] as List)
              .map((e) => VaNumber.fromJson(e))
              .toList()
          : null,
      actions: json['actions'] != null
          ? (json['actions'] as List).map((e) => ActionUrl.fromJson(e)).toList()
          : null,
    );
  }
}

class VaNumber {
  final String bank;
  final String vaNumber;

  VaNumber({required this.bank, required this.vaNumber});

  factory VaNumber.fromJson(Map<String, dynamic> json) {
    return VaNumber(
      bank: json['bank'] ?? '',
      vaNumber: json['va_number'] ?? '',
    );
  }
}

class ActionUrl {
  final String name;
  final String method;
  final String url;

  ActionUrl({
    required this.name,
    required this.method,
    required this.url,
  });

  factory ActionUrl.fromJson(Map<String, dynamic> json) {
    return ActionUrl(
      name: json['name'] ?? '',
      method: json['method'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
