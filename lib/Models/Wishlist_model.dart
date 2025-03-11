import 'dart:convert';

class WishlistModel {
  final List<Datum> data;
  final int total;
  final int totalPages;
  final int status;

  WishlistModel({
    required this.data,
    required this.total,
    required this.totalPages,
    required this.status,
  });

  factory WishlistModel.fromRawJson(String str) =>
      WishlistModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"],
        totalPages: json["total_pages"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
        "total_pages": totalPages,
        "status": status,
      };
}

class Datum {
  final int id;
  final int objectId;
  final String objectModel;
  final int userId;
  final int createUser;
  final dynamic updateUser;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Service service;

  Datum({
    required this.id,
    required this.objectId,
    required this.objectModel,
    required this.userId,
    required this.createUser,
    required this.updateUser,
    required this.createdAt,
    required this.updatedAt,
    required this.service,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        objectId: json["object_id"],
        objectModel: json["object_model"],
        userId: json["user_id"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        service: Service.fromJson(json["service"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object_id": objectId,
        "object_model": objectModel,
        "user_id": userId,
        "create_user": createUser,
        "update_user": updateUser,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "service": service.toJson(),
      };
}

class Service {
  final int id;
  final String title;
  final String price;
  final dynamic salePrice;
  final dynamic discountPercent;
  final bool image;
  final String? content;
  final Location location;
  final int? isFeatured;
  final String serviceIcon;
  final ReviewScore reviewScore;
  final String serviceType;

  Service({
    required this.id,
    required this.title,
    required this.price,
    required this.salePrice,
    required this.discountPercent,
    required this.image,
    required this.content,
    required this.location,
    required this.isFeatured,
    required this.serviceIcon,
    required this.reviewScore,
    required this.serviceType,
  });

  factory Service.fromRawJson(String str) => Service.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        salePrice: json["sale_price"],
        discountPercent: json["discount_percent"],
        image: json["image"],
        content: json["content"],
        location: Location.fromJson(json["location"]),
        isFeatured: json["is_featured"],
        serviceIcon: json["service_icon"],
        reviewScore: ReviewScore.fromJson(json["review_score"]),
        serviceType: json["service_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "sale_price": salePrice,
        "discount_percent": discountPercent,
        "image": image,
        "content": content,
        "location": location.toJson(),
        "is_featured": isFeatured,
        "service_icon": serviceIcon,
        "review_score": reviewScore.toJson(),
        "service_type": serviceType,
      };
}

class Location {
  final int id;
  final String name;

  Location({
    required this.id,
    required this.name,
  });

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class ReviewScore {
  final int scoreTotal;
  final int totalReview;
  final String reviewText;

  ReviewScore({
    required this.scoreTotal,
    required this.totalReview,
    required this.reviewText,
  });

  factory ReviewScore.fromRawJson(String str) =>
      ReviewScore.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReviewScore.fromJson(Map<String, dynamic> json) => ReviewScore(
        scoreTotal: json["score_total"],
        totalReview: json["total_review"],
        reviewText: json["review_text"],
      );

  Map<String, dynamic> toJson() => {
        "score_total": scoreTotal,
        "total_review": totalReview,
        "review_text": reviewText,
      };
}
