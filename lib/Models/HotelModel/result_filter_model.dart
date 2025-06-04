import 'dart:convert';

class ResultFilterModel {
  final Data data;

  ResultFilterModel({required this.data});

  factory ResultFilterModel.fromRawJson(String str) =>
      ResultFilterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultFilterModel.fromJson(Map<String, dynamic> json) =>
      ResultFilterModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  final Rows rows;
  final List<String> hotelMinMaxPrice;

  Data({
    required this.rows,
    required this.hotelMinMaxPrice,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        rows: Rows.fromJson(json["rows"]),
        hotelMinMaxPrice:
            List<String>.from(json["hotel_min_max_price"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "rows": rows.toJson(),
        "hotel_min_max_price":
            List<dynamic>.from(hotelMinMaxPrice.map((x) => x)),
      };
}

class Rows {
  final int currentPage;
  final List<Datum> data;

  Rows({
    required this.currentPage,
    required this.data,
  });

  factory Rows.fromRawJson(String str) => Rows.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rows.fromJson(Map<String, dynamic> json) => Rows(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int id;
  final String title;
  final String slug;
  final String content;
  final String imageId;
  final String bannerImageId;
  final dynamic locationId;
  final String address;
  final String? mapLat;
  final String? mapLng;
  final int mapZoom;
  final dynamic isFeatured;
  final String gallery;
  final dynamic video;
  final dynamic policy;
  final dynamic starRate;
  final String price;
  final String checkInTime;
  final String checkOutTime;
  final dynamic allowFullDay;
  final dynamic salePrice;
  final String status;
  final int createUser;
  final int updateUser;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic reviewScore;
  final dynamic icalImportUrl;
  final int? enableExtraPrice;
  final dynamic extraPrice;
  final dynamic minDayBeforeBooking;
  final dynamic minDayStays;
  final dynamic enableServiceFee;
  final dynamic serviceFee;
  final dynamic surrounding;
  final List<Offer> offer;
  final List<Room> rooms;
  final dynamic location;
  final HasWishList? hasWishList;
  final List<dynamic> translations;
  final List<TermsByAttributeInListingPage> termsByAttributeInListingPage;

  Datum({
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
    required this.status,
    required this.createUser,
    required this.updateUser,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.reviewScore,
    required this.icalImportUrl,
    required this.enableExtraPrice,
    required this.extraPrice,
    required this.minDayBeforeBooking,
    required this.minDayStays,
    required this.enableServiceFee,
    required this.serviceFee,
    required this.surrounding,
    required this.offer,
    required this.rooms,
    required this.location,
    required this.hasWishList,
    required this.translations,
    required this.termsByAttributeInListingPage,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        status: json["status"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        reviewScore: json["review_score"],
        icalImportUrl: json["ical_import_url"],
        enableExtraPrice: json["enable_extra_price"],
        extraPrice: json["extra_price"],
        minDayBeforeBooking: json["min_day_before_booking"],
        minDayStays: json["min_day_stays"],
        enableServiceFee: json["enable_service_fee"],
        serviceFee: json["service_fee"],
        surrounding: json["surrounding"],
        offer: List<Offer>.from(json["offer"].map((x) => Offer.fromJson(x))),
        rooms: List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
        location: json["location"],
        hasWishList: json["has_wish_list"] == null
            ? null
            : HasWishList.fromJson(json["has_wish_list"]),
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
        termsByAttributeInListingPage: List<TermsByAttributeInListingPage>.from(
            json["terms_by_attribute_in_listing_page"]
                .map((x) => TermsByAttributeInListingPage.fromJson(x))),
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
        "status": status,
        "create_user": createUser,
        "update_user": updateUser,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "review_score": reviewScore,
        "ical_import_url": icalImportUrl,
        "enable_extra_price": enableExtraPrice,
        "extra_price": extraPrice,
        "min_day_before_booking": minDayBeforeBooking,
        "min_day_stays": minDayStays,
        "enable_service_fee": enableServiceFee,
        "service_fee": serviceFee,
        "surrounding": surrounding,
        "offer": List<dynamic>.from(offer.map((x) => x.toJson())),
        "rooms": List<dynamic>.from(rooms.map((x) => x.toJson())),
        "location": location,
        "has_wish_list": hasWishList?.toJson(),
        "translations": List<dynamic>.from(translations.map((x) => x)),
        "terms_by_attribute_in_listing_page": List<dynamic>.from(
            termsByAttributeInListingPage.map((x) => x.toJson())),
      };
}

class HasWishList {
  final int id;
  final int objectId;
  final String objectModel;
  final int userId;
  final int createUser;
  final dynamic updateUser;
  final DateTime createdAt;
  final DateTime updatedAt;

  HasWishList({
    required this.id,
    required this.objectId,
    required this.objectModel,
    required this.userId,
    required this.createUser,
    required this.updateUser,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HasWishList.fromRawJson(String str) =>
      HasWishList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HasWishList.fromJson(Map<String, dynamic> json) => HasWishList(
        id: json["id"],
        objectId: json["object_id"],
        objectModel: json["object_model"],
        userId: json["user_id"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
      };
}

class Offer {
  final dynamic cancelPolicy;
  final dynamic foodPolicy;
  final dynamic moveDate;
  final dynamic breakfastType;

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

class Room {
  final int id;
  final String title;
  final dynamic content;
  final int imageId;
  final String gallery;
  final dynamic video;
  final String price;
  final int parentId;
  final int number;
  final int beds;
  final int size;
  final int adults;
  final int children;
  final String status;
  final dynamic icalImportUrl;
  final dynamic minDayStays;
  final List<dynamic> translations;

  Room({
    required this.id,
    required this.title,
    required this.content,
    required this.imageId,
    required this.gallery,
    required this.video,
    required this.price,
    required this.parentId,
    required this.number,
    required this.beds,
    required this.size,
    required this.adults,
    required this.children,
    required this.status,
    required this.icalImportUrl,
    required this.minDayStays,
    required this.translations,
  });

  factory Room.fromRawJson(String str) => Room.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        imageId: json["image_id"],
        gallery: json["gallery"],
        video: json["video"],
        price: json["price"],
        parentId: json["parent_id"],
        number: json["number"],
        beds: json["beds"],
        size: json["size"],
        adults: json["adults"],
        children: json["children"],
        status: json["status"],
        icalImportUrl: json["ical_import_url"],
        minDayStays: json["min_day_stays"],
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "image_id": imageId,
        "gallery": gallery,
        "video": video,
        "price": price,
        "parent_id": parentId,
        "number": number,
        "beds": beds,
        "size": size,
        "adults": adults,
        "children": children,
        "status": status,
        "ical_import_url": icalImportUrl,
        "min_day_stays": minDayStays,
        "translations": List<dynamic>.from(translations.map((x) => x)),
      };
}

class TermsByAttributeInListingPage {
  final int id;
  final String name;
  final dynamic content;
  final int attrId;
  final String slug;
  final dynamic createUser;
  final dynamic updateUser;
  final dynamic originId;
  final dynamic lang;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final dynamic imageId;
  final String icon;
  final int laravelThroughKey;
  final List<dynamic> translations;

  TermsByAttributeInListingPage({
    required this.id,
    required this.name,
    required this.content,
    required this.attrId,
    required this.slug,
    required this.createUser,
    required this.updateUser,
    required this.originId,
    required this.lang,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.imageId,
    required this.icon,
    required this.laravelThroughKey,
    required this.translations,
  });

  factory TermsByAttributeInListingPage.fromRawJson(String str) =>
      TermsByAttributeInListingPage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TermsByAttributeInListingPage.fromJson(Map<String, dynamic> json) =>
      TermsByAttributeInListingPage(
        id: json["id"],
        name: json["name"],
        content: json["content"],
        attrId: json["attr_id"],
        slug: json["slug"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        originId: json["origin_id"],
        lang: json["lang"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        imageId: json["image_id"],
        icon: json["icon"],
        laravelThroughKey: json["laravel_through_key"],
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "content": content,
        "attr_id": attrId,
        "slug": slug,
        "create_user": createUser,
        "update_user": updateUser,
        "origin_id": originId,
        "lang": lang,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "image_id": imageId,
        "icon": icon,
        "laravel_through_key": laravelThroughKey,
        "translations": List<dynamic>.from(translations.map((x) => x)),
      };
}
