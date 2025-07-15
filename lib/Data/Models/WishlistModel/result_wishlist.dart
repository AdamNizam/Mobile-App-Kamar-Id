import 'dart:convert';

class ResultWishlist {
  final String resultWishlistClass;
  final int status;

  ResultWishlist({
    required this.resultWishlistClass,
    required this.status,
  });

  factory ResultWishlist.fromRawJson(String str) =>
      ResultWishlist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultWishlist.fromJson(Map<String, dynamic> json) => ResultWishlist(
        resultWishlistClass: json["class"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "class": resultWishlistClass,
        "status": status,
      };
}
