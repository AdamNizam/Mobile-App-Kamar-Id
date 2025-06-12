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
  Map<String, dynamic> toFormData() {
    final Map<String, dynamic> data = {
      'start': start,
      'end': end,
      'date': date,
    };

    if (locationId != null) data['location_id'] = locationId.toString();
    if (priceRange != null) data['price_range'] = priceRange;

    if (starRate != null && starRate!.isNotEmpty) {
      data['star_rate'] = starRate!.map((e) => e.toString()).join(',');
    }

    if (terms != null && terms!.isNotEmpty) {
      data['terms'] = terms!.map((e) => e.toString()).join(',');
    }

    if (reviewScore != null && reviewScore!.isNotEmpty) {
      data['review_score'] = reviewScore!.map((e) => e.toString()).join(',');
    }

    return data;
  }
}
