import 'dart:convert';

class ResultFilterModel {
  final int id;
  final String? title;
  final String slug;
  final String content;
  final String? imageId;
  final String? bannerImageId;
  final String? address;
  final String? mapLat;
  final String? mapLng;
  final int? mapZoom;
  final dynamic isFeatured;
  final dynamic starRate;
  final String? price;
  final dynamic salePrice;
  final String? status;

  ResultFilterModel({
    required this.id,
    this.title,
    required this.slug,
    required this.content,
    this.imageId,
    this.bannerImageId,
    this.address,
    this.mapLat,
    this.mapLng,
    this.mapZoom,
    this.isFeatured,
    this.starRate,
    this.price,
    this.salePrice,
    this.status,
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
        address: json["address"],
        mapLat: json["map_lat"],
        mapLng: json["map_lng"],
        mapZoom: json["map_zoom"],
        isFeatured: json["is_featured"],
        starRate: json["star_rate"],
        price: json["price"],
        salePrice: json["sale_price"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "content": content,
        "image_id": imageId,
        "banner_image_id": bannerImageId,
        "address": address,
        "map_lat": mapLat,
        "map_lng": mapLng,
        "map_zoom": mapZoom,
        "is_featured": isFeatured,
        "star_rate": starRate,
        "price": price,
        "sale_price": salePrice,
        "status": status,
      };
}
