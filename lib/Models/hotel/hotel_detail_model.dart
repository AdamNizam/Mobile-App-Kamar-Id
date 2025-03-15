import 'dart:convert';

class HotelDetailModel {
  final int? id;
  final String? title;
  final String? slug;
  final String? content;
  final String? imageId;
  final String? bannerImageId;
  final int? locationId;
  final String? address;
  final String? mapLat;
  final String? mapLng;
  final int? mapZoom;
  final String? price;
  final double? reviewScore;
  final int? enableExtraPrice;
  final List<ExtraPrice>? extraPrice;
  final int? enableServiceFee;
  final List<ServiceFee>? serviceFee;
  final Location? location;
  final List<Offer>? offer;

  HotelDetailModel({
    this.id,
    this.title,
    this.slug,
    this.content,
    this.imageId,
    this.bannerImageId,
    this.locationId,
    this.address,
    this.mapLat,
    this.mapLng,
    this.mapZoom,
    this.price,
    this.reviewScore,
    this.enableExtraPrice,
    this.extraPrice,
    this.enableServiceFee,
    this.serviceFee,
    this.offer,
    this.location,
  });

  factory HotelDetailModel.fromJson(Map<String, dynamic> json) {
    return HotelDetailModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      content: json['content'],
      imageId: json['image_id'],
      bannerImageId: json['banner_image_id'],
      locationId: json['location_id'],
      address: json['address'],
      mapLat: json['map_lat'],
      mapLng: json['map_lng'],
      mapZoom: json['map_zoom'],
      price: json['price'],
      reviewScore: (json['reviewScore'] as num?)?.toDouble(),
      enableExtraPrice: json["enable_extra_price"],
      extraPrice: (json['extra_price'] as List<dynamic>?)
              ?.map((e) => ExtraPrice.fromJson(e))
              .toList() ??
          [],
      enableServiceFee: json["enable_service_fee"],
      serviceFee: (json['service_fee'] as List<dynamic>?)
              ?.map((e) => ServiceFee.fromJson(e))
              .toList() ??
          [],
      offer: (json['offer'] as List<dynamic>?)
              ?.map((e) => Offer.fromJson(e))
              .toList() ??
          [],
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'content': content,
      'imageId': imageId,
      'bannerImageId': bannerImageId,
      'locationId': locationId,
      'address': address,
      'mapLat': mapLat,
      'mapLng': mapLng,
      'mapZoom': mapZoom,
      'price': price,
      'reviewScore': reviewScore,
      'enableExtraPrice': enableExtraPrice,
      'extraPrice': extraPrice?.map((e) => e.toJson()).toList(),
      'enableServiceFee': enableServiceFee,
      'serviceFee': serviceFee?.map((e) => e.toJson()).toList(),
      'offer': offer?.map((e) => e.toJson()).toList(),
      'location': location?.toJson(),
    };
  }
}

class ExtraPrice {
  final String name;
  final String price;
  final String type;

  ExtraPrice({
    required this.name,
    required this.price,
    required this.type,
  });

  factory ExtraPrice.fromJson(Map<String, dynamic> json) {
    return ExtraPrice(
      name: json['name'],
      price: json['price'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'type': type,
    };
  }
}

class Location {
  final int id;
  final String name;
  final dynamic content;
  final String slug;
  final int imageId;
  final String mapLat;
  final String mapLng;
  final int mapZoom;

  Location({
    required this.id,
    required this.name,
    required this.content,
    required this.slug,
    required this.imageId,
    required this.mapLat,
    required this.mapLng,
    required this.mapZoom,
  });

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"] ?? 0,
        name: json["name"] ?? "No Data",
        content: json["content"] ??
            "No Data", // Bisa pakai dynamic atau string kosong
        slug: json["slug"] ?? "No Data",
        imageId: json["image_id"] ?? 0,
        mapLat: json["map_lat"] ?? "0.0",
        mapLng: json["map_lng"] ?? "0.0",
        mapZoom: json["map_zoom"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "content": content,
        "slug": slug,
        "image_id": imageId,
        "map_lat": mapLat,
        "map_lng": mapLng,
        "map_zoom": mapZoom,
      };
}

class ServiceFee {
  final String name;
  final dynamic desc;
  final dynamic nameEn;
  final dynamic descEn;
  final String price;
  final String unit;
  final String type;

  ServiceFee({
    required this.name,
    required this.desc,
    required this.nameEn,
    required this.descEn,
    required this.price,
    required this.unit,
    required this.type,
  });

  factory ServiceFee.fromRawJson(String str) =>
      ServiceFee.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceFee.fromJson(Map<String, dynamic> json) => ServiceFee(
        name: json["name"] ?? "Unknown Service",
        desc: json["desc"] ?? "No Desc",
        nameEn: json["name_en"] ?? "",
        descEn: json["desc_en"] ?? "",
        price: json["price"] ?? "0",
        unit: json["unit"] ?? "No Data",
        type: json["type"] ?? "No Data",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "desc": desc,
        "name_en": nameEn,
        "desc_en": descEn,
        "price": price,
        "unit": unit,
        "type": type,
      };
}

class Offer {
  final String cancelPolicy;
  final String foodPolicy;
  final String moveDate;
  final String breakfastType;

  Offer({
    required this.cancelPolicy,
    required this.foodPolicy,
    required this.moveDate,
    required this.breakfastType,
  });

  factory Offer.fromRawJson(String str) => Offer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        cancelPolicy: json["cancel_policy"] ?? "No Data",
        foodPolicy: json["food_policy"] ?? "No Data",
        moveDate: json["move_date"] ?? "No Data",
        breakfastType: json["breakfast_type"] ?? "None",
      );

  Map<String, dynamic> toJson() => {
        "cancel_policy": cancelPolicy,
        "food_policy": foodPolicy,
        "move_date": moveDate,
        "breakfast_type": breakfastType,
      };
}
