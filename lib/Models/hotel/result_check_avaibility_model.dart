class ResultChekAvaibilityModel {
  final int? id;
  final String? title;
  final int? price;
  final String? sizeHtml;
  final String? bedsHtml;
  final String? adultsHtml;
  final String? childrenHtml;
  final int? numberSelected;
  final int? number;
  final int? minDayStays;
  final bool? image;
  final int? tmpNumber;
  final List<dynamic>? gallery;
  final String? priceHtml;
  final String? priceText;
  final Terms? terms;
  final List<TermFeature>? termFeatures;

  ResultChekAvaibilityModel({
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

  factory ResultChekAvaibilityModel.fromJson(Map<String, dynamic> json) =>
      ResultChekAvaibilityModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        sizeHtml: json["size_html"],
        bedsHtml: json["beds_html"],
        adultsHtml: json["adults_html"],
        childrenHtml: json["children_html"],
        numberSelected: json["number_selected"],
        number: json["number"],
        minDayStays: json["min_day_stays"],
        image: json["image"],
        tmpNumber: json["tmp_number"],
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
        "gallery": gallery ?? [],
        "price_html": priceHtml,
        "price_text": priceText,
        "terms": terms?.toJson(),
        "term_features": termFeatures?.map((x) => x.toJson()).toList() ?? [],
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
  final The8? the8;

  Terms({this.the8});

  factory Terms.fromJson(Map<String, dynamic> json) => Terms(
        the8: json["8"] != null ? The8.fromJson(json["8"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "8": the8?.toJson(),
      };
}

class The8 {
  final Parent? parent;
  final List<Child>? child;

  The8({this.parent, this.child});

  factory The8.fromJson(Map<String, dynamic> json) => The8(
        parent: json["parent"] != null ? Parent.fromJson(json["parent"]) : null,
        child: json["child"] != null
            ? List<Child>.from(json["child"].map((x) => Child.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "parent": parent?.toJson(),
        "child": child?.map((x) => x.toJson()).toList() ?? [],
      };
}

class Child {
  final int? id;
  final String? title;
  final dynamic content;
  final dynamic imageId;
  final String? icon;
  final int? attrId;
  final String? slug;

  Child({
    this.id,
    this.title,
    this.content,
    this.imageId,
    this.icon,
    this.attrId,
    this.slug,
  });

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
  final int? id;
  final String? title;
  final String? slug;
  final String? service;
  final dynamic displayType;
  final dynamic hideInSingle;

  Parent({
    this.id,
    this.title,
    this.slug,
    this.service,
    this.displayType,
    this.hideInSingle,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        service: json["service"],
        displayType: json["display_type"],
        hideInSingle: json["hide_in_single"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "service": service,
        "display_type": displayType,
        "hide_in_single": hideInSingle,
      };
}
