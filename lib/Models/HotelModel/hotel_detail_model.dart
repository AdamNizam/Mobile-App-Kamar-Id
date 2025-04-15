import 'dart:convert';

class HotelDetailModel {
  final RowData? rowData;
  final Author? author;
  final List<ListGallery>? gallery;
  final List<LocationCategory>? locationCategory;

  HotelDetailModel({
    this.rowData,
    this.author,
    this.gallery,
    this.locationCategory,
  });

  factory HotelDetailModel.fromJson(Map<String, dynamic> json) =>
      HotelDetailModel(
        rowData: RowData.fromJson(json["row"]),
        author: Author.fromJson(json["author"]),
        gallery: List<ListGallery>.from(
          json["gallery"].map((g) => ListGallery.fromJson(g)),
        ),
        locationCategory: List<LocationCategory>.from(
          json["location_category"].map((lc) => LocationCategory.fromJson(lc)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "row": rowData!.toJson(),
        "author": author!.toJson(),
        "gallery": List<dynamic>.from(gallery!.map((g) => g.toJson())),
        "location_category":
            List<dynamic>.from(locationCategory!.map((lc) => lc.toJson())),
      };
}

// start Row
class RowData {
  final int? id;
  final String? title;
  final String? slug;
  final String? content;
  final String? imageId;
  final String? bannerImageId;
  final dynamic isFeatured;
  final String? gallery;
  final String? video;
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

  RowData({
    this.id,
    this.title,
    this.slug,
    this.content,
    this.imageId,
    this.bannerImageId,
    this.isFeatured,
    this.gallery,
    this.video,
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

  factory RowData.fromJson(Map<String, dynamic> json) {
    return RowData(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      content: json['content'],
      imageId: json['image_id'],
      bannerImageId: json['banner_image_id'],
      isFeatured: json["is_featured"],
      gallery: json["gallery"],
      video: json["video"],
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
      "is_featured": isFeatured,
      "gallery": gallery,
      "video": video,
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
  final dynamic nameEn;
  final String price;
  final String type;
  final String perPerson;

  ExtraPrice({
    required this.name,
    required this.nameEn,
    required this.price,
    required this.type,
    required this.perPerson,
  });

  factory ExtraPrice.fromJson(Map<String, dynamic> json) => ExtraPrice(
        name: json["name"],
        nameEn: json["name_en"],
        price: json["price"],
        type: json["type"],
        perPerson: json["per_person"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "name_en": nameEn,
        "price": price,
        "type": type,
        "per_person": perPerson,
      };
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
        breakfastType: json["breakfast_type"] ?? "No Data",
      );

  Map<String, dynamic> toJson() => {
        "cancel_policy": cancelPolicy,
        "food_policy": foodPolicy,
        "move_date": moveDate,
        "breakfast_type": breakfastType,
      };
}

// End Row
// start Author
class Author {
  final int? id;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final dynamic city;
  final dynamic state;
  final String? country;
  final String? userName;
  final String? avatar;

  Author({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.city,
    this.state,
    this.country,
    this.userName,
    this.avatar,
  });

  factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "city": city,
        "state": state,
        "country": country,
        "user_name": userName,
        "avatar": avatar,
      };
}

// End Author
// Star Gallery
class ListGallery {
  final dynamic large;
  final dynamic thumb;

  ListGallery({
    required this.large,
    required this.thumb,
  });

  factory ListGallery.fromJson(Map<String, dynamic> json) => ListGallery(
        large: json["large"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "thumb": thumb,
      };
}

// End Gallery
// Start Location Category
class LocationCategory {
  final int? id;
  final String? name;
  final String? iconClass;
  final dynamic content;
  final dynamic slug;
  final String? status;

  LocationCategory({
    this.id,
    this.name,
    this.iconClass,
    this.content,
    this.slug,
    this.status,
  });

  factory LocationCategory.fromJson(Map<String, dynamic> json) =>
      LocationCategory(
        id: json["id"],
        name: json["name"],
        iconClass: json["icon_class"],
        content: json["content"],
        slug: json["slug"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon_class": iconClass,
        "content": content,
        "slug": slug,
        "status": status,
      };
}
// End Location Category

