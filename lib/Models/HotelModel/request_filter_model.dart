class RequestFilterModel {
  final int? locationId;
  final String start;
  final String end;
  final String date;
  final String? priceRange;
  final List<int>? starRate;
  final List<int>? terms;
  final List<int>? reviewScore;

  RequestFilterModel({
    this.locationId,
    required this.start,
    required this.end,
    required this.date,
    this.priceRange,
    this.starRate,
    this.terms,
    this.reviewScore,
  });

  // Buat map sesuai x-www-form-urlencoded
  Map<String, dynamic> toFormData() {
    return {
      'location_id': locationId!,
      'start': start,
      'end': end,
      'date': date,
      'price_range': priceRange,
      'star_rate': starRate,
      'terms': terms,
      'review_score': reviewScore,
    };
  }
}
