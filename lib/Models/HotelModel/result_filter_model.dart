import 'dart:convert';

class ResultFilterModel {
  final int id;
  final String title;
  final String slug;
  final String content;
  final String imageId;
  final String bannerImageId;
  final dynamic locationId;
  final String address;
  final String price;
  final String checkInTime;
  final String checkOutTime;
  final String status;

  ResultFilterModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.content,
    required this.imageId,
    required this.bannerImageId,
    required this.locationId,
    required this.address,
    required this.price,
    required this.checkInTime,
    required this.checkOutTime,
    required this.status,
  });

  factory ResultFilterModel.fromRawJson(String str) =>
      ResultFilterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultFilterModel.fromJson(Map<String, dynamic> json) =>
      ResultFilterModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        content: json["content"],
        imageId: json["image_id"],
        bannerImageId: json["banner_image_id"],
        locationId: json["location_id"],
        address: json["address"],
        price: json["price"],
        checkInTime: json["check_in_time"],
        checkOutTime: json["check_out_time"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "content": content,
        "image_id": imageId,
        "banner_image_id": bannerImageId,
        "location_id": locationId,
        "address": address,
        "price": price,
        "check_in_time": checkInTime,
        "check_out_time": checkOutTime,
        "status": status,
      };
}
