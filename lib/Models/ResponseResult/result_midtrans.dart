class MidtransResult {
  final String transactionId;
  final String paymentType;
  final String transactionStatus;
  final String statusCode;
  final String grossAmount;
  final List<VaNumber>? vaNumbers;
  final List<ActionUrl>? actions;
  final String? qrString;

  MidtransResult({
    required this.transactionId,
    required this.paymentType,
    required this.transactionStatus,
    required this.statusCode,
    required this.grossAmount,
    this.vaNumbers,
    this.actions,
    this.qrString,
  });

  factory MidtransResult.fromJson(Map<String, dynamic> json) {
    return MidtransResult(
      transactionId: json['transaction_id'] ?? '',
      paymentType: json['payment_type'] ?? '',
      transactionStatus: json['transaction_status'] ?? '',
      statusCode: json['status_code'] ?? '',
      grossAmount: json['gross_amount'] ?? '',
      vaNumbers: json['va_numbers'] != null
          ? (json['va_numbers'] as List)
              .map((e) => VaNumber.fromJson(e))
              .toList()
          : null,
      actions: json['actions'] != null
          ? (json['actions'] as List).map((e) => ActionUrl.fromJson(e)).toList()
          : null,
      qrString: json['qr_string'],
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
  final String url;

  ActionUrl({required this.name, required this.url});

  factory ActionUrl.fromJson(Map<String, dynamic> json) {
    return ActionUrl(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
