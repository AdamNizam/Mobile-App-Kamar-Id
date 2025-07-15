import 'dart:convert';

class HotelAllModel {
  final Data? data;

  HotelAllModel({
    this.data,
  });

  factory HotelAllModel.fromRawJson(String str) =>
      HotelAllModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HotelAllModel.fromJson(Map<String, dynamic> json) => HotelAllModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final Rows? rows;
  final List<ListLocation>? listLocation;
  final List<String>? hotelMinMaxPrice;
  final List<Attribute>? attributes;

  Data({
    this.rows,
    this.listLocation,
    this.hotelMinMaxPrice,
    this.attributes,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        rows: json["rows"] == null ? null : Rows.fromJson(json["rows"]),
        listLocation: json["list_location"] == null
            ? []
            : List<ListLocation>.from(
                json["list_location"]!.map((x) => ListLocation.fromJson(x))),
        hotelMinMaxPrice: json["hotel_min_max_price"] == null
            ? []
            : List<String>.from(json["hotel_min_max_price"]!.map((x) => x)),
        attributes: json["attributes"] == null
            ? []
            : List<Attribute>.from(
                json["attributes"]!.map((x) => Attribute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rows": rows?.toJson(),
        "list_location": listLocation == null
            ? []
            : List<dynamic>.from(listLocation!.map((x) => x.toJson())),
        "hotel_min_max_price": hotelMinMaxPrice == null
            ? []
            : List<dynamic>.from(hotelMinMaxPrice!.map((x) => x)),
        "attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x.toJson())),
      };
}

class Attribute {
  final int? id;
  final String? name;
  final String? slug;
  final String? service;
  final List<Term>? terms;
  final List<dynamic>? translations;

  Attribute({
    this.id,
    this.name,
    this.slug,
    this.service,
    this.terms,
    this.translations,
  });

  factory Attribute.fromRawJson(String str) =>
      Attribute.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        service: json["service"],
        terms: json["terms"] == null
            ? []
            : List<Term>.from(json["terms"]!.map((x) => Term.fromJson(x))),
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "service": service,
        "terms": terms == null
            ? []
            : List<dynamic>.from(terms!.map((x) => x.toJson())),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
      };
}

class Term {
  final int? id;
  final String? name;

  Term({
    this.id,
    this.name,
  });

  factory Term.fromRawJson(String str) => Term.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Term.fromJson(Map<String, dynamic> json) => Term(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class ListLocation {
  final int? id;
  final String? name;
  final List<Term>? children;

  ListLocation({
    this.id,
    this.name,
    this.children,
  });

  factory ListLocation.fromRawJson(String str) =>
      ListLocation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListLocation.fromJson(Map<String, dynamic> json) => ListLocation(
        id: json["id"],
        name: json["name"],
        children: json["children"] == null
            ? []
            : List<Term>.from(json["children"]!.map((x) => Term.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
      };
}

class Rows {
  final int? currentPage;
  final List<Datum>? data;

  Rows({
    this.currentPage,
    this.data,
  });

  factory Rows.fromRawJson(String str) => Rows.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rows.fromJson(Map<String, dynamic> json) => Rows(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? id;
  final String? title;
  final String? slug;
  final String? content;
  final String? imageId;
  final String? bannerImageId;
  final String? address;
  final dynamic isFeatured;
  final dynamic starRate;
  final String? price;
  final String? checkInTime;
  final String? checkOutTime;
  final dynamic allowFullDay;
  final dynamic salePrice;
  final String? status;
  final dynamic reviewScore;
  final dynamic enableExtraPrice;
  final dynamic extraPrice;
  final dynamic minDayBeforeBooking;
  final dynamic minDayStays;
  final List<Room>? rooms;
  final HasWishList? hasWishList;

  Datum({
    this.id,
    this.title,
    this.slug,
    this.content,
    this.imageId,
    this.bannerImageId,
    this.address,
    this.isFeatured,
    this.starRate,
    this.price,
    this.checkInTime,
    this.checkOutTime,
    this.allowFullDay,
    this.salePrice,
    this.status,
    this.reviewScore,
    this.enableExtraPrice,
    this.extraPrice,
    this.minDayBeforeBooking,
    this.minDayStays,
    this.rooms,
    this.hasWishList,
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
        address: json["address"],
        isFeatured: json["is_featured"],
        starRate: json["star_rate"],
        price: json["price"],
        checkInTime: json["check_in_time"],
        checkOutTime: json["check_out_time"],
        allowFullDay: json["allow_full_day"],
        salePrice: json["sale_price"],
        status: json["status"],
        reviewScore: json["review_score"],
        enableExtraPrice: json["enable_extra_price"],
        extraPrice: json["extra_price"],
        minDayBeforeBooking: json["min_day_before_booking"],
        minDayStays: json["min_day_stays"],
        rooms: json["rooms"] == null
            ? []
            : List<Room>.from(json["rooms"]!.map((x) => Room.fromJson(x))),
        hasWishList: json["has_wish_list"] == null
            ? null
            : HasWishList.fromJson(json["has_wish_list"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "content": content,
        "image_id": imageId,
        "banner_image_id": bannerImageId,
        "address": address,
        "is_featured": isFeatured,
        "star_rate": starRate,
        "price": price,
        "check_in_time": checkInTime,
        "check_out_time": checkOutTime,
        "allow_full_day": allowFullDay,
        "sale_price": salePrice,
        "status": status,
        "review_score": reviewScore,
        "enable_extra_price": enableExtraPrice,
        "extra_price": extraPrice,
        "min_day_before_booking": minDayBeforeBooking,
        "min_day_stays": minDayStays,
        "rooms": rooms == null
            ? []
            : List<dynamic>.from(rooms!.map((x) => x.toJson())),
        "has_wish_list": hasWishList?.toJson(),
      };
}

class HasWishList {
  final int? id;
  final int? objectId;
  final String? objectModel;

  HasWishList({
    this.id,
    this.objectId,
    this.objectModel,
  });

  factory HasWishList.fromRawJson(String str) =>
      HasWishList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HasWishList.fromJson(Map<String, dynamic> json) => HasWishList(
        id: json["id"],
        objectId: json["object_id"],
        objectModel: json["object_model"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object_id": objectId,
        "object_model": objectModel,
      };
}

class Room {
  final int? id;
  final String? title;

  Room({
    this.id,
    this.title,
  });

  factory Room.fromRawJson(String str) => Room.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
