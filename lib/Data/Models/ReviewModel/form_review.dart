import 'dart:convert';

class FormReview {
  final String reviewTitle;
  final String reviewContent;
  final ReviewStats reviewStats;
  final String reviewServiceId;
  final String reviewServiceType;
  final String submit;

  FormReview({
    required this.reviewTitle,
    required this.reviewContent,
    required this.reviewStats,
    required this.reviewServiceId,
    required this.reviewServiceType,
    required this.submit,
  });

  factory FormReview.fromRawJson(String str) =>
      FormReview.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FormReview.fromJson(Map<String, dynamic> json) => FormReview(
        reviewTitle: json["review_title"],
        reviewContent: json["review_content"],
        reviewStats: ReviewStats.fromJson(json["review_stats"]),
        reviewServiceId: json["review_service_id"],
        reviewServiceType: json["review_service_type"],
        submit: json["submit"],
      );

  Map<String, dynamic> toJson() => {
        "review_title": reviewTitle,
        "review_content": reviewContent,
        "review_stats": reviewStats.toJson(),
        "review_service_id": reviewServiceId,
        "review_service_type": reviewServiceType,
        "submit": submit,
      };
}

class ReviewStats {
  final String service;
  final String organization;
  final String friendliness;
  final String areaExpert;
  final String safety;

  ReviewStats({
    required this.service,
    required this.organization,
    required this.friendliness,
    required this.areaExpert,
    required this.safety,
  });

  factory ReviewStats.fromRawJson(String str) =>
      ReviewStats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReviewStats.fromJson(Map<String, dynamic> json) => ReviewStats(
        service: json["Service"],
        organization: json["Organization"],
        friendliness: json["Friendliness"],
        areaExpert: json["Area Expert"],
        safety: json["Safety"],
      );

  Map<String, dynamic> toJson() => {
        "Service": service,
        "Organization": organization,
        "Friendliness": friendliness,
        "Area Expert": areaExpert,
        "Safety": safety,
      };
}
