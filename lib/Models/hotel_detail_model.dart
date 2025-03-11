class HotelDetailModel {
  final int? id;
  final String? title;
  final String? slug;
  final String? content;
  final String? imageId;
  final String? bannerImageId;
  final int? locationId;
  final String? address;
  final String? mapLat;
  final String? mapLng;
  final int? mapZoom;
  final String? price;
  final double? reviewScore;
  final List<ExtraPrice>? extraPrice;

  HotelDetailModel({
    this.id,
    this.title,
    this.slug,
    this.content,
    this.imageId,
    this.bannerImageId,
    this.locationId,
    this.address,
    this.mapLat,
    this.mapLng,
    this.mapZoom,
    this.price,
    this.reviewScore,
    this.extraPrice,
  });

  factory HotelDetailModel.fromJson(Map<String, dynamic> json) {
    return HotelDetailModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      content: json['content'],
      imageId: json['image_id'],
      bannerImageId: json['banner_image_id'],
      locationId: json['location_id'],
      address: json['address'],
      mapLat: json['map_lat'],
      mapLng: json['map_lng'],
      mapZoom: json['map_zoom'],
      price: json['price'],
      reviewScore: (json['reviewScore'] as num?)?.toDouble(),
      extraPrice: (json['extra_price'] as List<dynamic>?)
              ?.map((e) => ExtraPrice.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'content': content,
      'imageId': imageId,
      'bannerImageId': bannerImageId,
      'locationId': locationId,
      'address': address,
      'mapLat': mapLat,
      'mapLng': mapLng,
      'mapZoom': mapZoom,
      'price': price,
      'reviewScore': reviewScore,
      'extraPrice': extraPrice?.map((e) => e.toJson()).toList(),
    };
  }
}

class ExtraPrice {
  final String name;
  final String price;
  final String type;

  ExtraPrice({required this.name, required this.price, required this.type});

  factory ExtraPrice.fromJson(Map<String, dynamic> json) {
    return ExtraPrice(
      name: json['name'],
      price: json['price'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'type': type,
    };
  }
}
