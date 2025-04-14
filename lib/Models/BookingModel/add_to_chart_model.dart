import 'dart:convert';

class AddToCartModel {
  final String? serviceId;
  final String? serviceType;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<ExtraPrice>? extraPrice;
  final String? adults;
  final String? children;
  final List<Room>? rooms;

  AddToCartModel({
    this.serviceId,
    this.serviceType,
    this.startDate,
    this.endDate,
    this.extraPrice,
    this.adults,
    this.children,
    this.rooms,
  });

  factory AddToCartModel.fromRawJson(String str) =>
      AddToCartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddToCartModel.fromJson(Map<String, dynamic> json) => AddToCartModel(
        serviceId: json["service_id"],
        serviceType: json["service_type"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        extraPrice: List<ExtraPrice>.from(
            json["extra_price"].map((x) => ExtraPrice.fromJson(x))),
        adults: json["adults"],
        children: json["children"],
        rooms: List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "service_id": serviceId,
        "service_type": serviceType,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "extra_price": List<dynamic>.from(extraPrice!.map((x) => x.toJson())),
        "adults": adults,
        "children": children,
        "rooms": List<dynamic>.from(rooms!.map((x) => x.toJson())),
      };
}

class ExtraPrice {
  final String name;
  final dynamic nameEn;
  final String price;
  final String type;
  final String number;
  final String enable;
  final String priceHtml;
  final dynamic priceType;

  ExtraPrice({
    required this.name,
    required this.nameEn,
    required this.price,
    required this.type,
    required this.number,
    required this.enable,
    required this.priceHtml,
    required this.priceType,
  });

  factory ExtraPrice.fromRawJson(String str) =>
      ExtraPrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExtraPrice.fromJson(Map<String, dynamic> json) => ExtraPrice(
        name: json["name"],
        nameEn: json["name_en"],
        price: json["price"],
        type: json["type"],
        number: json["number"],
        enable: json["enable"],
        priceHtml: json["price_html"],
        priceType: json["price_type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "name_en": nameEn,
        "price": price,
        "type": type,
        "number": number,
        "enable": enable,
        "price_html": priceHtml,
        "price_type": priceType,
      };
}

class Room {
  final String id;
  final String numberSelected;

  Room({
    required this.id,
    required this.numberSelected,
  });

  factory Room.fromRawJson(String str) => Room.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        numberSelected: json["number_selected"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number_selected": numberSelected,
      };
}
