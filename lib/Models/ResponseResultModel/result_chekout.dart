import 'dart:convert';

class ResultChekout {
  final String url;

  ResultChekout({
    required this.url,
  });

  factory ResultChekout.fromRawJson(String str) =>
      ResultChekout.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultChekout.fromJson(Map<String, dynamic> json) => ResultChekout(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
