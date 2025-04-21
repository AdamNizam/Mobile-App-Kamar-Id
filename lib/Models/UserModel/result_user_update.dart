import 'dart:convert';

class ResultUserUpdate {
  final String message;
  final bool status;

  ResultUserUpdate({
    required this.message,
    required this.status,
  });

  factory ResultUserUpdate.fromRawJson(String str) =>
      ResultUserUpdate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultUserUpdate.fromJson(Map<String, dynamic> json) =>
      ResultUserUpdate(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
