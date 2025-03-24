import 'dart:convert';

class ResultCheckAvaibility {
  final List<Room>? rooms;

  ResultCheckAvaibility({this.rooms});

  ResultCheckAvaibility copyWith({List<Room>? rooms}) =>
      ResultCheckAvaibility(rooms: rooms ?? this.rooms);

  factory ResultCheckAvaibility.fromRawJson(String str) =>
      ResultCheckAvaibility.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultCheckAvaibility.fromJson(Map<String, dynamic> json) =>
      ResultCheckAvaibility(
        rooms: json["rooms"] != null
            ? List<Room>.from(json["rooms"].map((x) => Room.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "rooms": rooms != null
            ? List<dynamic>.from(rooms!.map((x) => x.toJson()))
            : [],
      };
}

class Room {
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

  Room({
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

  factory Room.fromRawJson(String str) => Room.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
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

class Terms {
  Terms();

  factory Terms.fromJson(Map<String, dynamic> json) => Terms();

  Map<String, dynamic> toJson() => {};
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
