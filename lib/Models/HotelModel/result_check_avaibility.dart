import 'dart:convert';

class ResultCheckAvaibility {
  final List<RoomChekAvaibility>? rooms;

  ResultCheckAvaibility({this.rooms});

  ResultCheckAvaibility copyWith({List<RoomChekAvaibility>? rooms}) =>
      ResultCheckAvaibility(rooms: rooms ?? this.rooms);

  factory ResultCheckAvaibility.fromRawJson(String str) =>
      ResultCheckAvaibility.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultCheckAvaibility.fromJson(Map<String, dynamic> json) =>
      ResultCheckAvaibility(
        rooms: json["rooms"] != null
            ? List<RoomChekAvaibility>.from(
                json["rooms"].map((x) => RoomChekAvaibility.fromJson(x)))
            : [],
      );
  Map<String, dynamic> toJson() => {
        "rooms": rooms != null
            ? List<dynamic>.from(rooms!.map((x) => x.toJson()))
            : [],
      };
}

class RoomChekAvaibility {
  final int? id;
  final String? title;
  final dynamic price;
  final String? sizeHtml;
  final String? bedsHtml;
  final String? adultsHtml;
  final String? childrenHtml;
  final int? numberSelected;
  final int? number;
  final int? minDayStays;
  final dynamic image;
  final int? tmpNumber;
  final List<dynamic>? gallery;
  final dynamic priceHtml;
  final dynamic priceText;
  final Terms? terms;
  final List<TermFeature>? termFeatures;

  RoomChekAvaibility({
    this.id,
    this.title,
    this.price,
    this.sizeHtml,
    this.bedsHtml,
    this.adultsHtml,
    this.childrenHtml,
    this.numberSelected,
    this.number,
    this.minDayStays,
    this.image,
    this.tmpNumber,
    this.gallery,
    this.priceHtml,
    this.priceText,
    this.terms,
    this.termFeatures,
  });

  factory RoomChekAvaibility.fromRawJson(String str) =>
      RoomChekAvaibility.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoomChekAvaibility.fromJson(Map<String, dynamic> json) {
    return RoomChekAvaibility(
      id: json["id"],
      title: json["title"],
      price: json["price"] != null
          ? int.tryParse(json["price"].toString()) ?? 0
          : 0,
      sizeHtml: json["size_html"],
      bedsHtml: json["beds_html"],
      adultsHtml: json["adults_html"],
      childrenHtml: json["children_html"],
      numberSelected: json["number_selected"] ?? 0,
      number: json["number"] ?? 0,
      minDayStays: json["min_day_stays"] ?? 0,
      image: json["image"],
      tmpNumber: json["tmp_number"] ?? 0,
      gallery: json["gallery"] != null
          ? List<dynamic>.from(json["gallery"].map((x) => x))
          : [],
      priceHtml: json["price_html"],
      priceText: json["price_text"],
      terms: json["terms"] != null ? Terms.fromJson(json["terms"]) : null,
      termFeatures: json["term_features"] != null
          ? List<TermFeature>.from(
              json["term_features"].map((x) => TermFeature.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "size_html": sizeHtml,
        "beds_html": bedsHtml,
        "adults_html": adultsHtml,
        "children_html": childrenHtml,
        "number_selected": numberSelected,
        "number": number,
        "min_day_stays": minDayStays,
        "image": image,
        "tmp_number": tmpNumber,
        "gallery":
            gallery != null ? List<dynamic>.from(gallery!.map((x) => x)) : [],
        "price_html": priceHtml,
        "price_text": priceText,
        "terms": terms?.toJson(),
        "term_features": termFeatures != null
            ? List<dynamic>.from(termFeatures!.map((x) => x.toJson()))
            : [],
      };
}

class TermFeature {
  final String? icon;
  final String? title;

  TermFeature({this.icon, this.title});

  factory TermFeature.fromJson(Map<String, dynamic> json) => TermFeature(
        icon: json["icon"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "title": title,
      };
}

class Terms {
  final The8 the8;

  Terms({
    required this.the8,
  });

  factory Terms.fromRawJson(String str) => Terms.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Terms.fromJson(Map<String, dynamic> json) => Terms(
        the8: The8.fromJson(json["8"]),
      );

  Map<String, dynamic> toJson() => {
        "8": the8.toJson(),
      };
}

class The8 {
  final Parent parent;
  final List<Child> child;

  The8({
    required this.parent,
    required this.child,
  });

  factory The8.fromRawJson(String str) => The8.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory The8.fromJson(Map<String, dynamic> json) => The8(
        parent: Parent.fromJson(json["parent"]),
        child: List<Child>.from(json["child"].map((x) => Child.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "parent": parent.toJson(),
        "child": List<dynamic>.from(child.map((x) => x.toJson())),
      };
}

class Child {
  final int id;
  final String title;
  final dynamic content;
  final dynamic imageId;
  final String icon;
  final int attrId;
  final String slug;

  Child({
    required this.id,
    required this.title,
    required this.content,
    required this.imageId,
    required this.icon,
    required this.attrId,
    required this.slug,
  });

  factory Child.fromRawJson(String str) => Child.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        imageId: json["image_id"],
        icon: json["icon"],
        attrId: json["attr_id"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "image_id": imageId,
        "icon": icon,
        "attr_id": attrId,
        "slug": slug,
      };
}

class Parent {
  final int id;
  final String title;
  final String slug;
  final String service;

  Parent({
    required this.id,
    required this.title,
    required this.slug,
    required this.service,
  });

  factory Parent.fromRawJson(String str) => Parent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        service: json["service"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "service": service,
      };
}
