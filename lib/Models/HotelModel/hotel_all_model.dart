import 'dart:convert';

class HotelAllModel {
  final int? id;
  final String? title;
  final String? slug;
  final String? imageId;
  final String? bannerImageId;
  final String? address;
  final int? isFeatured;
  final double? starRate;
  final double? price;
  final double? reviewScore;
  final HasWishList? hasWishList;

  HotelAllModel({
    this.id,
    this.title,
    this.slug,
    this.imageId,
    this.bannerImageId,
    this.address,
    this.starRate,
    this.isFeatured,
    this.price,
    this.reviewScore,
    this.hasWishList,
  });

  factory HotelAllModel.fromJson(Map<String, dynamic> json) {
    return HotelAllModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      imageId: json['image_id'] as String?,
      isFeatured: json['is_featured'] as int?,
      bannerImageId: json['banner_image_id'] as String?,
      address: json['address'] as String?,
      starRate: json['star_rate'] != null
          ? double.tryParse(json['star_rate'].toString())
          : null,
      price: json['price'] != null
          ? double.tryParse(json['price'].toString())
          : null,
      reviewScore: json['review_score'] != null
          ? double.tryParse(json['review_score'].toString())
          : null,
      hasWishList: json["has_wish_list"] == null
          ? null
          : HasWishList.fromJson(json["has_wish_list"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'image_id': imageId,
      'banner_image_id': bannerImageId,
      'address': address,
      'star_rate': starRate,
      'is_featured': isFeatured,
      'price': price,
      'review_score': reviewScore,
      "has_wish_list": hasWishList,
    };
  }
}

class HasWishList {
  final int id;
  final int objectId;
  final String objectModel;
  final int userId;

  HasWishList({
    required this.id,
    required this.objectId,
    required this.objectModel,
    required this.userId,
  });

  factory HasWishList.fromRawJson(String str) =>
      HasWishList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HasWishList.fromJson(Map<String, dynamic> json) => HasWishList(
        id: json["id"],
        objectId: json["object_id"],
        objectModel: json["object_model"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object_id": objectId,
        "object_model": objectModel,
        "user_id": userId,
      };
}
