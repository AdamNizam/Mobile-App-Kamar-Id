import 'dart:convert';

class RequestWishlist {
  final int objectId;
  final String objectModel;

  RequestWishlist({
    required this.objectId,
    this.objectModel = 'hotel',
  });

  factory RequestWishlist.fromRawJson(String str) =>
      RequestWishlist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RequestWishlist.fromJson(Map<String, dynamic> json) =>
      RequestWishlist(
        objectId: json["object_id"],
        objectModel: json["object_model"],
      );

  Map<String, dynamic> toJson() => {
        "object_id": objectId,
        "object_model": objectModel,
      };
}
