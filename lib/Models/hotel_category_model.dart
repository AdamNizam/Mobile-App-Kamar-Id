class HotelCategory {
  final int id;
  final String title;
  final String slug;
  final String content;
  final String imageUrl;
  final String bannerImageUrl;
  final int locationId;
  final String address;
  final double mapLat;
  final double mapLng;
  final int mapZoom;
  final double? price;
  final double? reviewScore;
  final String checkInTime;
  final String checkOutTime;
  final List<ExtraPrice> extraPrices;
  final List<HotelRelated> relatedHotels;
  final List<LocationCategory> locationCategories;
  final BookingData bookingData;

  HotelCategory({
    required this.id,
    required this.title,
    required this.slug,
    required this.content,
    required this.imageUrl,
    required this.bannerImageUrl,
    required this.locationId,
    required this.address,
    required this.mapLat,
    required this.mapLng,
    required this.mapZoom,
    this.price,
    this.reviewScore,
    required this.checkInTime,
    required this.checkOutTime,
    required this.extraPrices,
    required this.relatedHotels,
    required this.locationCategories,
    required this.bookingData,
  });

  factory HotelCategory.fromJson(Map<String, dynamic> json) {
    return HotelCategory(
      id: json['row']['id'],
      title: json['row']['title'],
      slug: json['row']['slug'],
      content: json['row']['content'],
      imageUrl: json['row']['image_id'],
      bannerImageUrl: json['row']['banner_image_id'],
      locationId: json['row']['location_id'],
      address: json['row']['address'],
      mapLat: double.parse(json['row']['map_lat']),
      mapLng: double.parse(json['row']['map_lng']),
      mapZoom: json['row']['map_zoom'],
      price: json['row']['price'] != null
          ? double.parse(json['row']['price'])
          : null,
      reviewScore: json['row']['review_score'] != null
          ? double.parse(json['row']['review_score'])
          : null,
      checkInTime: json['row']['check_in_time'],
      checkOutTime: json['row']['check_out_time'],
      extraPrices: (json['row']['extra_price'] as List)
          .map((e) => ExtraPrice.fromJson(e))
          .toList(),
      relatedHotels: (json['hotel_related'] as List)
          .map((e) => HotelRelated.fromJson(e))
          .toList(),
      locationCategories: (json['location_category'] as List)
          .map((e) => LocationCategory.fromJson(e))
          .toList(),
      bookingData: BookingData.fromJson(json['booking_data']),
    );
  }
}

class ExtraPrice {
  final String name;
  final double price;
  final String type;

  ExtraPrice({required this.name, required this.price, required this.type});

  factory ExtraPrice.fromJson(Map<String, dynamic> json) {
    return ExtraPrice(
      name: json['name'],
      price: double.parse(json['price']),
      type: json['type'],
    );
  }
}

class HotelRelated {
  final int id;
  final String title;
  final String imageUrl;
  final double? price;

  HotelRelated(
      {required this.id,
      required this.title,
      required this.imageUrl,
      this.price});

  factory HotelRelated.fromJson(Map<String, dynamic> json) {
    return HotelRelated(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image_id'],
      price: json['price'] != null ? double.parse(json['price']) : null,
    );
  }
}

class LocationCategory {
  final int id;
  final String name;
  final String iconClass;

  LocationCategory(
      {required this.id, required this.name, required this.iconClass});

  factory LocationCategory.fromJson(Map<String, dynamic> json) {
    return LocationCategory(
      id: json['id'],
      name: json['name'],
      iconClass: json['icon_class'],
    );
  }
}

class BookingData {
  final int id;
  final int maxGuests;

  BookingData({required this.id, required this.maxGuests});

  factory BookingData.fromJson(Map<String, dynamic> json) {
    return BookingData(
      id: json['id'],
      maxGuests: json['max_guests'],
    );
  }
}
