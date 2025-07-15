import 'dart:convert';

class ResultChekout {
  final String? url;
  final String? snapToken;

  ResultChekout({
    this.url,
    this.snapToken,
  });

  factory ResultChekout.fromRawJson(String str) =>
      ResultChekout.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultChekout.fromJson(Map<String, dynamic> json) => ResultChekout(
        url: json["url"],
        snapToken: json["snap_token"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "snap_token": snapToken,
      };
}
