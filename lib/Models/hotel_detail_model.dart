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
  final List<ServiceFee>? serviceFee;
  final List<GalleryItem>? gallery;
  final Location? location;
  final Author? author;

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
    this.serviceFee,
    this.gallery,
    this.location,
    this.author,
  });

  factory HotelDetailModel.fromJson(Map<String, dynamic> json) {
    final row = json['row'] ?? {};
    return HotelDetailModel(
      id: row['id'],
      title: row['title'],
      slug: row['slug'],
      content: row['content'],
      imageId: row['image_id'],
      bannerImageId: row['banner_image_id'],
      locationId: row['location_id'],
      address: row['address'],
      mapLat: row['map_lat'],
      mapLng: row['map_lng'],
      mapZoom: row['map_zoom'],
      price: row['price'],
      reviewScore: (row['review_score'] as num?)?.toDouble(),
      extraPrice: (row['extra_price'] as List<dynamic>?)
              ?.map((e) => ExtraPrice.fromJson(e))
              .toList() ??
          [],
      serviceFee: (row['service_fee'] as List<dynamic>?)
              ?.map((e) => ServiceFee.fromJson(e))
              .toList() ??
          [],
      gallery: (json['gallery'] as List<dynamic>?)
              ?.map((e) => GalleryItem.fromJson(e))
              .toList() ??
          [],
      location:
          row['location'] != null ? Location.fromJson(row['location']) : null,
      author: row['author'] != null ? Author.fromJson(row['author']) : null,
    );
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
}

class ServiceFee {
  final String name;
  final String price;
  final String unit;
  final String type;

  ServiceFee(
      {required this.name,
      required this.price,
      required this.unit,
      required this.type});

  factory ServiceFee.fromJson(Map<String, dynamic> json) {
    return ServiceFee(
      name: json['name'],
      price: json['price'],
      unit: json['unit'],
      type: json['type'],
    );
  }
}

class GalleryItem {
  final String? large;
  final String? thumb;

  GalleryItem({this.large, this.thumb});

  factory GalleryItem.fromJson(Map<String, dynamic> json) {
    return GalleryItem(
      large: json['large'],
      thumb: json['thumb'],
    );
  }
}

class Location {
  final int id;
  final String name;
  final String? mapLat;
  final String? mapLng;
  final int? mapZoom;

  Location(
      {required this.id,
      required this.name,
      this.mapLat,
      this.mapLng,
      this.mapZoom});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      mapLat: json['map_lat'],
      mapLng: json['map_lng'],
      mapZoom: json['map_zoom'],
    );
  }
}

class Author {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? avatar;

  Author(
      {required this.id,
      required this.name,
      required this.email,
      this.phone,
      this.avatar});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
    );
  }
}
