import 'dart:convert';

class RequestWishlistModel {
  final int objectId;
  final String objectModel;

  RequestWishlistModel({
    required this.objectId,
    required this.objectModel,
  });

  factory RequestWishlistModel.fromRawJson(String str) =>
      RequestWishlistModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RequestWishlistModel.fromJson(Map<String, dynamic> json) =>
      RequestWishlistModel(
        objectId: json["object_id"],
        objectModel: json["object_model"],
      );

  Map<String, dynamic> toJson() => {
        "object_id": objectId,
        "object_model": objectModel,
      };
}
