import 'dart:convert';

class HotelDetailModel {
  final Row? row;
  final List<Gallery>? gallery;
  final List<LocationCategory>? locationCategory;

  HotelDetailModel({
    required this.row,
    required this.gallery,
    required this.locationCategory,
  });

  HotelDetailModel copyWith({
    Row? row,
    List<Gallery>? gallery,
    List<LocationCategory>? locationCategory,
  }) =>
      HotelDetailModel(
        row: row ?? this.row,
        gallery: gallery ?? this.gallery,
        locationCategory: locationCategory ?? this.locationCategory,
      );

  factory HotelDetailModel.fromRawJson(String str) =>
      HotelDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HotelDetailModel.fromJson(Map<String, dynamic> json) =>
      HotelDetailModel(
        row: Row.fromJson(json["row"]),
        gallery:
            List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
        locationCategory: List<LocationCategory>.from(
            json["location_category"].map((x) => LocationCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "row": row?.toJson(),
        "gallery": List<dynamic>.from(gallery!.map((x) => x.toJson())),
        "location_category":
            List<dynamic>.from(locationCategory!.map((x) => x.toJson())),
      };
}

class Gallery {
  final dynamic large;
  final dynamic thumb;

  Gallery({
    required this.large,
    required this.thumb,
  });

  Gallery copyWith({
    dynamic large,
    dynamic thumb,
  }) =>
      Gallery(
        large: large ?? this.large,
        thumb: thumb ?? this.thumb,
      );

  factory Gallery.fromRawJson(String str) => Gallery.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        large: json["large"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "thumb": thumb,
      };
}

class LocationCategory {
  final int id;
  final String name;
  final String iconClass;
  final dynamic content;
  final dynamic slug;
  final String status;
  final int lft;
  final int rgt;
  final dynamic parentId;
  final dynamic createUser;
  final dynamic updateUser;
  final dynamic deletedAt;
  final dynamic originId;
  final dynamic lang;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic locationCategoryTranslations;

  LocationCategory({
    required this.id,
    required this.name,
    required this.iconClass,
    required this.content,
    required this.slug,
    required this.status,
    required this.lft,
    required this.rgt,
    required this.parentId,
    required this.createUser,
    required this.updateUser,
    required this.deletedAt,
    required this.originId,
    required this.lang,
    required this.createdAt,
    required this.updatedAt,
    required this.locationCategoryTranslations,
  });

  LocationCategory copyWith({
    int? id,
    String? name,
    String? iconClass,
    dynamic content,
    dynamic slug,
    String? status,
    int? lft,
    int? rgt,
    dynamic parentId,
    dynamic createUser,
    dynamic updateUser,
    dynamic deletedAt,
    dynamic originId,
    dynamic lang,
    dynamic createdAt,
    dynamic updatedAt,
    dynamic locationCategoryTranslations,
  }) =>
      LocationCategory(
        id: id ?? this.id,
        name: name ?? this.name,
        iconClass: iconClass ?? this.iconClass,
        content: content ?? this.content,
        slug: slug ?? this.slug,
        status: status ?? this.status,
        lft: lft ?? this.lft,
        rgt: rgt ?? this.rgt,
        parentId: parentId ?? this.parentId,
        createUser: createUser ?? this.createUser,
        updateUser: updateUser ?? this.updateUser,
        deletedAt: deletedAt ?? this.deletedAt,
        originId: originId ?? this.originId,
        lang: lang ?? this.lang,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        locationCategoryTranslations:
            locationCategoryTranslations ?? this.locationCategoryTranslations,
      );

  factory LocationCategory.fromRawJson(String str) =>
      LocationCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationCategory.fromJson(Map<String, dynamic> json) =>
      LocationCategory(
        id: json["id"],
        name: json["name"],
        iconClass: json["icon_class"],
        content: json["content"],
        slug: json["slug"],
        status: json["status"],
        lft: json["_lft"],
        rgt: json["_rgt"],
        parentId: json["parent_id"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        deletedAt: json["deleted_at"],
        originId: json["origin_id"],
        lang: json["lang"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        locationCategoryTranslations: json["location_category_translations"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon_class": iconClass,
        "content": content,
        "slug": slug,
        "status": status,
        "_lft": lft,
        "_rgt": rgt,
        "parent_id": parentId,
        "create_user": createUser,
        "update_user": updateUser,
        "deleted_at": deletedAt,
        "origin_id": originId,
        "lang": lang,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "location_category_translations": locationCategoryTranslations,
      };
}

class Row {
  final int id;
  final String title;
  final String slug;
  final dynamic content;
  final String imageId;
  final String bannerImageId;
  final int locationId;
  final dynamic address;
  final dynamic mapLat;
  final dynamic mapLng;
  final int mapZoom;
  final int isFeatured;
  final String gallery;
  final dynamic video;
  final dynamic policy;
  final dynamic starRate;
  final String price;
  final dynamic checkInTime;
  final dynamic checkOutTime;
  final dynamic allowFullDay;
  final dynamic salePrice;
  final int enableExtraPrice;
  final List<ExtraPrice> extraPrice;
  final int enableServiceFee;
  final List<ServiceFee> serviceFee;
  final List<Offer> offer;
  final Location location;

  Row({
    required this.id,
    required this.title,
    required this.slug,
    required this.content,
    required this.imageId,
    required this.bannerImageId,
    required this.locationId,
    required this.address,
    required this.mapLat,
    required this.mapLng,
    required this.mapZoom,
    required this.isFeatured,
    required this.gallery,
    required this.video,
    required this.policy,
    required this.starRate,
    required this.price,
    required this.checkInTime,
    required this.checkOutTime,
    required this.allowFullDay,
    required this.salePrice,
    required this.enableExtraPrice,
    required this.extraPrice,
    required this.enableServiceFee,
    required this.serviceFee,
    required this.offer,
    required this.location,
  });

  Row copyWith({
    int? id,
    String? title,
    String? slug,
    dynamic content,
    String? imageId,
    String? bannerImageId,
    int? locationId,
    dynamic address,
    dynamic mapLat,
    dynamic mapLng,
    int? mapZoom,
    int? isFeatured,
    String? gallery,
    dynamic video,
    dynamic policy,
    dynamic starRate,
    String? price,
    dynamic checkInTime,
    dynamic checkOutTime,
    dynamic allowFullDay,
    dynamic salePrice,
    int? enableExtraPrice,
    List<ExtraPrice>? extraPrice,
    int? enableServiceFee,
    List<ServiceFee>? serviceFee,
    List<Offer>? offer,
    Location? location,
  }) =>
      Row(
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        content: content ?? this.content,
        imageId: imageId ?? this.imageId,
        bannerImageId: bannerImageId ?? this.bannerImageId,
        locationId: locationId ?? this.locationId,
        address: address ?? this.address,
        mapLat: mapLat ?? this.mapLat,
        mapLng: mapLng ?? this.mapLng,
        mapZoom: mapZoom ?? this.mapZoom,
        isFeatured: isFeatured ?? this.isFeatured,
        gallery: gallery ?? this.gallery,
        video: video ?? this.video,
        policy: policy ?? this.policy,
        starRate: starRate ?? this.starRate,
        price: price ?? this.price,
        checkInTime: checkInTime ?? this.checkInTime,
        checkOutTime: checkOutTime ?? this.checkOutTime,
        allowFullDay: allowFullDay ?? this.allowFullDay,
        salePrice: salePrice ?? this.salePrice,
        enableExtraPrice: enableExtraPrice ?? this.enableExtraPrice,
        extraPrice: extraPrice ?? this.extraPrice,
        enableServiceFee: enableServiceFee ?? this.enableServiceFee,
        serviceFee: serviceFee ?? this.serviceFee,
        offer: offer ?? this.offer,
        location: location ?? this.location,
      );

  factory Row.fromRawJson(String str) => Row.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Row.fromJson(Map<String, dynamic> json) => Row(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        content: json["content"],
        imageId: json["image_id"],
        bannerImageId: json["banner_image_id"],
        locationId: json["location_id"],
        address: json["address"],
        mapLat: json["map_lat"],
        mapLng: json["map_lng"],
        mapZoom: json["map_zoom"],
        isFeatured: json["is_featured"],
        gallery: json["gallery"],
        video: json["video"],
        policy: json["policy"],
        starRate: json["star_rate"],
        price: json["price"],
        checkInTime: json["check_in_time"],
        checkOutTime: json["check_out_time"],
        allowFullDay: json["allow_full_day"],
        salePrice: json["sale_price"],
        enableExtraPrice: json["enable_extra_price"],
        extraPrice: List<ExtraPrice>.from(
            json["extra_price"].map((x) => ExtraPrice.fromJson(x))),
        enableServiceFee: json["enable_service_fee"],
        serviceFee: List<ServiceFee>.from(
            json["service_fee"].map((x) => ServiceFee.fromJson(x))),
        offer: List<Offer>.from(json["offer"].map((x) => Offer.fromJson(x))),
        location: Location.fromJson(json["location"]),
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
        "map_lat": mapLat,
        "map_lng": mapLng,
        "map_zoom": mapZoom,
        "is_featured": isFeatured,
        "gallery": gallery,
        "video": video,
        "policy": policy,
        "star_rate": starRate,
        "price": price,
        "check_in_time": checkInTime,
        "check_out_time": checkOutTime,
        "allow_full_day": allowFullDay,
        "sale_price": salePrice,
        "enable_extra_price": enableExtraPrice,
        "extra_price": List<dynamic>.from(extraPrice.map((x) => x.toJson())),
        "enable_service_fee": enableServiceFee,
        "service_fee": List<dynamic>.from(serviceFee.map((x) => x.toJson())),
        "offer": List<dynamic>.from(offer.map((x) => x.toJson())),
        "location": location.toJson(),
      };
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

  ExtraPrice copyWith({
    String? name,
    dynamic nameEn,
    String? price,
    String? type,
    String? perPerson,
  }) =>
      ExtraPrice(
        name: name ?? this.name,
        nameEn: nameEn ?? this.nameEn,
        price: price ?? this.price,
        type: type ?? this.type,
        perPerson: perPerson ?? this.perPerson,
      );

  factory ExtraPrice.fromRawJson(String str) =>
      ExtraPrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
        id: json["id"],
        name: json["name"],
        content: json["content"],
        slug: json["slug"],
        imageId: json["image_id"],
        mapLat: json["map_lat"],
        mapLng: json["map_lng"],
        mapZoom: json["map_zoom"],
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
        cancelPolicy: json["cancel_policy"],
        foodPolicy: json["food_policy"],
        moveDate: json["move_date"],
        breakfastType: json["breakfast_type"],
      );

  Map<String, dynamic> toJson() => {
        "cancel_policy": cancelPolicy,
        "food_policy": foodPolicy,
        "move_date": moveDate,
        "breakfast_type": breakfastType,
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

  ServiceFee copyWith({
    String? name,
    dynamic desc,
    dynamic nameEn,
    dynamic descEn,
    String? price,
    String? unit,
    String? type,
  }) =>
      ServiceFee(
        name: name ?? this.name,
        desc: desc ?? this.desc,
        nameEn: nameEn ?? this.nameEn,
        descEn: descEn ?? this.descEn,
        price: price ?? this.price,
        unit: unit ?? this.unit,
        type: type ?? this.type,
      );

  factory ServiceFee.fromRawJson(String str) =>
      ServiceFee.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceFee.fromJson(Map<String, dynamic> json) => ServiceFee(
        name: json["name"],
        desc: json["desc"],
        nameEn: json["name_en"],
        descEn: json["desc_en"],
        price: json["price"],
        unit: json["unit"],
        type: json["type"],
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
