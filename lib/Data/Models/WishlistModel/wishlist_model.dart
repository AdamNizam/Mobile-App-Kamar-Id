import 'dart:convert';

class GetWishlistModel {
  final List<Datum> dataWishlist;
  final int total;
  final int totalPages;
  final int status;

  GetWishlistModel({
    required this.dataWishlist,
    required this.total,
    required this.totalPages,
    required this.status,
  });

  factory GetWishlistModel.fromRawJson(String str) =>
      GetWishlistModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetWishlistModel.fromJson(Map<String, dynamic> json) =>
      GetWishlistModel(
        dataWishlist:
            List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"],
        totalPages: json["total_pages"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(dataWishlist.map((dw) => dw.toJson())),
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
  final ServiceWishlist service;

  Datum({
    required this.id,
    required this.objectId,
    required this.objectModel,
    required this.userId,
    required this.service,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        objectId: json["object_id"],
        objectModel: json["object_model"],
        userId: json["user_id"],
        service: ServiceWishlist.fromJson(json["service"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object_id": objectId,
        "object_model": objectModel,
        "user_id": userId,
        "service": service.toJson(),
      };
}

class ServiceWishlist {
  final int id;
  final String title;
  final String price;
  final String? salePrice;
  final String? discountPercent;
  final String? image;
  final String? content;
  final Location? location;
  final dynamic isFeatured;
  final String serviceIcon;
  final ReviewScore reviewScore;
  final String serviceType;

  ServiceWishlist({
    required this.id,
    required this.title,
    required this.price,
    required this.salePrice,
    required this.discountPercent,
    required this.image, // <- Sesuaikan di sini juga
    required this.content,
    required this.location,
    required this.isFeatured,
    required this.serviceIcon,
    required this.reviewScore,
    required this.serviceType,
  });

  factory ServiceWishlist.fromJson(Map<String, dynamic> json) =>
      ServiceWishlist(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        salePrice: json["sale_price"]?.toString(),
        discountPercent: json["discount_percent"]?.toString(),
        image: json["image"]?.toString(), // <- Perubahan penting
        content: json["content"],
        location: json["location"] != null
            ? Location.fromJson(json["location"])
            : null,
        isFeatured: json["is_featured"] ?? 0,
        serviceIcon: json["service_icon"] ?? "",
        reviewScore: json["review_score"] != null
            ? ReviewScore.fromJson(json["review_score"])
            : ReviewScore(
                scoreTotal: 0, totalReview: 0, reviewText: "Not rated"),
        serviceType: json["service_type"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "sale_price": salePrice,
        "discount_percent": discountPercent,
        "image": image,
        "content": content,
        "location": location?.toJson(),
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

  factory ReviewScore.fromJson(Map<String, dynamic> json) => ReviewScore(
        scoreTotal: json["score_total"] ?? 0,
        totalReview: json["total_review"] ?? 0,
        reviewText: json["review_text"] ?? "Not rated",
      );

  Map<String, dynamic> toJson() => {
        "score_total": scoreTotal,
        "total_review": totalReview,
        "review_text": reviewText,
      };
}
