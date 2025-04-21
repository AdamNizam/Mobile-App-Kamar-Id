import 'dart:convert';

class ResultUserUpdate {
  final dynamic message; // bisa String atau Map
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
        status: json["status"] == true || json["status"] == 1,
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
