import 'dart:convert';

class ResultUpdatePassword {
  final dynamic message;
  final int status; // ✅ ubah dari bool ke int

  ResultUpdatePassword({
    required this.message,
    required this.status,
  });

  factory ResultUpdatePassword.fromRawJson(String str) =>
      ResultUpdatePassword.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultUpdatePassword.fromJson(Map<String, dynamic> json) =>
      ResultUpdatePassword(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
