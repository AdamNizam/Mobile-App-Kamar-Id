import 'dart:convert';

class ResponseResultAddToChart {
  final String url;
  final String bookingCode;
  final int status;
  final String message;

  ResponseResultAddToChart({
    required this.url,
    required this.bookingCode,
    required this.status,
    required this.message,
  });

  factory ResponseResultAddToChart.fromRawJson(String str) =>
      ResponseResultAddToChart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseResultAddToChart.fromJson(Map<String, dynamic> json) =>
      ResponseResultAddToChart(
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
