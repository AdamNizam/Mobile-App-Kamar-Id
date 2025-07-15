import 'dart:convert';

class ResultReview {
  final int status;
  final String message;

  ResultReview({
    required this.status,
    required this.message,
  });

  factory ResultReview.fromRawJson(String str) =>
      ResultReview.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultReview.fromJson(Map<String, dynamic> json) => ResultReview(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
