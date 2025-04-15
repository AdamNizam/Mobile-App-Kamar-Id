import 'dart:convert';

class ResultAddToCart {
  final String url;
  final String bookingCode;
  final int status;
  final String message;

  ResultAddToCart({
    required this.url,
    required this.bookingCode,
    required this.status,
    required this.message,
  });

  factory ResultAddToCart.fromRawJson(String str) =>
      ResultAddToCart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultAddToCart.fromJson(Map<String, dynamic> json) =>
      ResultAddToCart(
        url: json["url"],
        bookingCode: json["booking_code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "booking_code": bookingCode,
        "status": status,
        "message": message,
      };
}
