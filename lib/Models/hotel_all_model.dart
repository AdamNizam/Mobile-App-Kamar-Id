class HotelAllModel {
  final int? id;
  final String? title;
  final String? slug;
  final String? imageId;
  final String? bannerImageId;
  final String? address;
  final double? starRate;
  final double? price;
  final double? reviewScore;

  HotelAllModel({
    this.id,
    this.title,
    this.slug,
    this.imageId,
    this.bannerImageId,
    this.address,
    this.starRate,
    this.price,
    this.reviewScore,
  });

  factory HotelAllModel.fromJson(Map<String, dynamic> json) {
    return HotelAllModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      imageId: json['image_id'] as String?,
      bannerImageId: json['banner_image_id'] as String?,
      address: json['address'] as String?,
      starRate: json['star_rate'] != null
          ? double.tryParse(json['star_rate'].toString())
          : null,
      price: json['price'] != null
          ? double.tryParse(json['price'].toString())
          : null,
      reviewScore: json['review_score'] != null
          ? double.tryParse(json['review_score'].toString())
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'image_id': imageId,
      'banner_image_id': bannerImageId,
      'address': address,
      'star_rate': starRate,
      'price': price,
      'review_score': reviewScore,
    };
  }

  HotelAllModel copyWith({
    int? id,
    String? title,
    String? slug,
    String? imageId,
    String? bannerImageId,
    String? address,
    double? starRate,
    double? price,
    double? reviewScore,
  }) {
    return HotelAllModel(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      imageId: imageId ?? this.imageId,
      bannerImageId: bannerImageId ?? this.bannerImageId,
      address: address ?? this.address,
      starRate: starRate ?? this.starRate,
      price: price ?? this.price,
      reviewScore: reviewScore ?? this.reviewScore,
    );
  }
}
