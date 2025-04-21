import 'dart:convert';

class FormUpdatePassword {
  final String currentPassword;
  final String newPassword;

  FormUpdatePassword({
    required this.currentPassword,
    required this.newPassword,
  });

  factory FormUpdatePassword.fromRawJson(String str) =>
      FormUpdatePassword.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FormUpdatePassword.fromJson(Map<String, dynamic> json) =>
      FormUpdatePassword(
        currentPassword: json["current_password"],
        newPassword: json["new_password"],
      );

  Map<String, dynamic> toJson() => {
        "current_password": currentPassword,
        "new_password": newPassword,
      };
}
