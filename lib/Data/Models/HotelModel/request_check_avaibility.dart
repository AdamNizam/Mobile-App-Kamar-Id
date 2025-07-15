class RequestCheckAvaibility {
  final int hotelId;
  final DateTime startDate;
  final DateTime endDate;
  final bool firstLoad;
  final int? adults;
  final int? children;

  RequestCheckAvaibility({
    required this.hotelId,
    required this.startDate,
    required this.endDate,
    this.firstLoad = false,
    this.adults = 0,
    this.children = 0,
  });

  factory RequestCheckAvaibility.fromJson(Map<String, dynamic> json) {
    return RequestCheckAvaibility(
      hotelId: json["hotel_id"],
      startDate: DateTime.parse(json["start_date"]),
      endDate: DateTime.parse(json["end_date"]),
      firstLoad: json["firstLoad"],
      adults: json["adults"],
      children: json["children"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "hotel_id": hotelId,
      "start_date":
          "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
      "end_date":
          "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
      "firstLoad": firstLoad,
      "adults": adults,
      "children": children,
    };
  }
}
