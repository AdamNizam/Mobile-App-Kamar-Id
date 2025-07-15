import 'dart:convert';

class ResultUserUpdate {
  final int status;
  final Message? message;

  ResultUserUpdate({
    required this.status,
    this.message,
  });

  factory ResultUserUpdate.fromRawJson(String str) =>
      ResultUserUpdate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultUserUpdate.fromJson(Map<String, dynamic> json) =>
      ResultUserUpdate(
        status: json["status"],
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message?.toJson(),
      };
}

class Message {
  final List<String> userName;
  final List<String> phone;

  Message({
    required this.userName,
    required this.phone,
  });

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        userName: List<String>.from(json["user_name"].map((x) => x)),
        phone: List<String>.from(json["phone"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "user_name": List<dynamic>.from(userName.map((x) => x)),
        "phone": List<dynamic>.from(phone.map((x) => x)),
      };
}
