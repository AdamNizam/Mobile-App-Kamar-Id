class RequestFilterModel {
  final String start;
  final String end;
  final String date;
  final String priceRange;

  RequestFilterModel({
    required this.start,
    required this.end,
    required this.date,
    required this.priceRange,
  });

  // Buat map sesuai x-www-form-urlencoded
  Map<String, String> toFormData() {
    return {
      'start': start,
      'end': end,
      'date': date,
      'price_range': priceRange,
    };
  }
}
