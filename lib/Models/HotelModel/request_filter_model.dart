import 'dart:convert';

class RequestFilterModel {
  final int locationId;
  final String start;
  final String end;
  final String date;
  final String priceRange;

  RequestFilterModel({
    required this.locationId,
    required this.start,
    required this.end,
    required this.date,
    required this.priceRange,
  });

  factory RequestFilterModel.fromRawJson(String str) =>
      RequestFilterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RequestFilterModel.fromJson(Map<String, dynamic> json) =>
      RequestFilterModel(
        locationId: json["location_id"],
        start: json["start"],
        end: json["end"],
        date: json["date"],
        priceRange: json["price_range"],
      );

  Map<String, dynamic> toJson() => {
        "location_id": locationId,
        "start": start,
        "end": end,
        "date": date,
        "price_range": priceRange,
      };
}
