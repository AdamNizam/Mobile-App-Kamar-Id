import 'dart:convert';

class HotelDetailModel {
  final Row row;
  final List<Gallery> gallery;
  final Author author;
  final Translation translation;
  final List<dynamic> hotelRelated;
  final List<LocationCategory> locationCategory;
  final BookingData bookingData;
  final ReviewList reviewList;
  final SeoMeta seoMeta;
  final String bodyClass;

  HotelDetailModel({
    required this.row,
    required this.gallery,
    required this.author,
    required this.translation,
    required this.hotelRelated,
    required this.locationCategory,
    required this.bookingData,
    required this.reviewList,
    required this.seoMeta,
    required this.bodyClass,
  });

  factory HotelDetailModel.fromRawJson(String str) =>
      HotelDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HotelDetailModel.fromJson(Map<String, dynamic> json) =>
      HotelDetailModel(
        row: Row.fromJson(json["row"]),
        gallery:
            List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
        author: Author.fromJson(json["author"]),
        translation: Translation.fromJson(json["translation"]),
        hotelRelated: List<dynamic>.from(json["hotel_related"].map((x) => x)),
        locationCategory: List<LocationCategory>.from(
            json["location_category"].map((x) => LocationCategory.fromJson(x))),
        bookingData: BookingData.fromJson(json["booking_data"]),
        reviewList: ReviewList.fromJson(json["review_list"]),
        seoMeta: SeoMeta.fromJson(json["seo_meta"]),
        bodyClass: json["body_class"],
      );

  Map<String, dynamic> toJson() => {
        "row": row.toJson(),
        "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
        "author": author.toJson(),
        "translation": translation.toJson(),
        "hotel_related": List<dynamic>.from(hotelRelated.map((x) => x)),
        "location_category":
            List<dynamic>.from(locationCategory.map((x) => x.toJson())),
        "booking_data": bookingData.toJson(),
        "review_list": reviewList.toJson(),
        "seo_meta": seoMeta.toJson(),
        "body_class": bodyClass,
      };
}

class Author {
  final int id;
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime emailVerifiedAt;
  final dynamic twoFactorSecret;
  final dynamic twoFactorRecoveryCodes;
  final dynamic address;
  final dynamic address2;
  final String phone;
  final DateTime birthday;
  final dynamic city;
  final dynamic state;
  final String country;
  final dynamic zipCode;
  final dynamic lastLoginAt;
  final dynamic avatarId;
  final String bio;
  final String status;
  final dynamic createUser;
  final dynamic updateUser;
  final dynamic vendorCommissionAmount;
  final dynamic vendorCommissionType;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic paymentGateway;
  final dynamic totalGuests;
  final dynamic locale;
  final String businessName;
  final dynamic verifySubmitStatus;
  final dynamic isVerified;
  final int activeStatus;
  final int darkMode;
  final String messengerColor;
  final dynamic stripeCustomerId;
  final dynamic totalBeforeFees;
  final String userName;
  final String otpCode;
  final DateTime otpExpiresAt;
  final String avatar;

  Author({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerifiedAt,
    required this.twoFactorSecret,
    required this.twoFactorRecoveryCodes,
    required this.address,
    required this.address2,
    required this.phone,
    required this.birthday,
    required this.city,
    required this.state,
    required this.country,
    required this.zipCode,
    required this.lastLoginAt,
    required this.avatarId,
    required this.bio,
    required this.status,
    required this.createUser,
    required this.updateUser,
    required this.vendorCommissionAmount,
    required this.vendorCommissionType,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.paymentGateway,
    required this.totalGuests,
    required this.locale,
    required this.businessName,
    required this.verifySubmitStatus,
    required this.isVerified,
    required this.activeStatus,
    required this.darkMode,
    required this.messengerColor,
    required this.stripeCustomerId,
    required this.totalBeforeFees,
    required this.userName,
    required this.otpCode,
    required this.otpExpiresAt,
    required this.avatar,
  });

  factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        address: json["address"],
        address2: json["address2"],
        phone: json["phone"],
        birthday: DateTime.parse(json["birthday"]),
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipCode: json["zip_code"],
        lastLoginAt: json["last_login_at"],
        avatarId: json["avatar_id"],
        bio: json["bio"],
        status: json["status"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        vendorCommissionAmount: json["vendor_commission_amount"],
        vendorCommissionType: json["vendor_commission_type"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        paymentGateway: json["payment_gateway"],
        totalGuests: json["total_guests"],
        locale: json["locale"],
        businessName: json["business_name"],
        verifySubmitStatus: json["verify_submit_status"],
        isVerified: json["is_verified"],
        activeStatus: json["active_status"],
        darkMode: json["dark_mode"],
        messengerColor: json["messenger_color"],
        stripeCustomerId: json["stripe_customer_id"],
        totalBeforeFees: json["total_before_fees"],
        userName: json["user_name"],
        otpCode: json["otp_code"],
        otpExpiresAt: DateTime.parse(json["otp_expires_at"]),
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "address": address,
        "address2": address2,
        "phone": phone,
        "birthday":
            "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "city": city,
        "state": state,
        "country": country,
        "zip_code": zipCode,
        "last_login_at": lastLoginAt,
        "avatar_id": avatarId,
        "bio": bio,
        "status": status,
        "create_user": createUser,
        "update_user": updateUser,
        "vendor_commission_amount": vendorCommissionAmount,
        "vendor_commission_type": vendorCommissionType,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "payment_gateway": paymentGateway,
        "total_guests": totalGuests,
        "locale": locale,
        "business_name": businessName,
        "verify_submit_status": verifySubmitStatus,
        "is_verified": isVerified,
        "active_status": activeStatus,
        "dark_mode": darkMode,
        "messenger_color": messengerColor,
        "stripe_customer_id": stripeCustomerId,
        "total_before_fees": totalBeforeFees,
        "user_name": userName,
        "otp_code": otpCode,
        "otp_expires_at": otpExpiresAt.toIso8601String(),
        "avatar": avatar,
      };
}

class BookingData {
  final int id;
  final List<dynamic> personTypes;
  final int max;
  final List<dynamic> openHours;
  final List<BookingDataExtraPrice> extraPrice;
  final String minDate;
  final int maxGuests;
  final List<Map<String, String?>> buyerFees;
  final I18N i18N;
  final String startDate;
  final String startDateHtml;
  final String endDate;
  final bool deposit;
  final String depositType;
  final String depositAmount;
  final String depositFomular;
  final bool isFormEnquiryAndBook;
  final String enquiryType;

  BookingData({
    required this.id,
    required this.personTypes,
    required this.max,
    required this.openHours,
    required this.extraPrice,
    required this.minDate,
    required this.maxGuests,
    required this.buyerFees,
    required this.i18N,
    required this.startDate,
    required this.startDateHtml,
    required this.endDate,
    required this.deposit,
    required this.depositType,
    required this.depositAmount,
    required this.depositFomular,
    required this.isFormEnquiryAndBook,
    required this.enquiryType,
  });

  factory BookingData.fromRawJson(String str) =>
      BookingData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
        id: json["id"],
        personTypes: List<dynamic>.from(json["person_types"].map((x) => x)),
        max: json["max"],
        openHours: List<dynamic>.from(json["open_hours"].map((x) => x)),
        extraPrice: List<BookingDataExtraPrice>.from(
            json["extra_price"].map((x) => BookingDataExtraPrice.fromJson(x))),
        minDate: json["minDate"],
        maxGuests: json["max_guests"],
        buyerFees: List<Map<String, String?>>.from(json["buyer_fees"].map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
        i18N: I18N.fromJson(json["i18n"]),
        startDate: json["start_date"],
        startDateHtml: json["start_date_html"],
        endDate: json["end_date"],
        deposit: json["deposit"],
        depositType: json["deposit_type"],
        depositAmount: json["deposit_amount"],
        depositFomular: json["deposit_fomular"],
        isFormEnquiryAndBook: json["is_form_enquiry_and_book"],
        enquiryType: json["enquiry_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "person_types": List<dynamic>.from(personTypes.map((x) => x)),
        "max": max,
        "open_hours": List<dynamic>.from(openHours.map((x) => x)),
        "extra_price": List<dynamic>.from(extraPrice.map((x) => x.toJson())),
        "minDate": minDate,
        "max_guests": maxGuests,
        "buyer_fees": List<dynamic>.from(buyerFees.map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "i18n": i18N.toJson(),
        "start_date": startDate,
        "start_date_html": startDateHtml,
        "end_date": endDate,
        "deposit": deposit,
        "deposit_type": depositType,
        "deposit_amount": depositAmount,
        "deposit_fomular": depositFomular,
        "is_form_enquiry_and_book": isFormEnquiryAndBook,
        "enquiry_type": enquiryType,
      };
}

class BookingDataExtraPrice {
  final String name;
  final dynamic nameEn;
  final String price;
  final String type;
  final String perPerson;
  final int number;
  final int enable;
  final String priceHtml;
  final String priceType;

  BookingDataExtraPrice({
    required this.name,
    required this.nameEn,
    required this.price,
    required this.type,
    required this.perPerson,
    required this.number,
    required this.enable,
    required this.priceHtml,
    required this.priceType,
  });

  factory BookingDataExtraPrice.fromRawJson(String str) =>
      BookingDataExtraPrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingDataExtraPrice.fromJson(Map<String, dynamic> json) =>
      BookingDataExtraPrice(
        name: json["name"],
        nameEn: json["name_en"],
        price: json["price"],
        type: json["type"],
        perPerson: json["per_person"],
        number: json["number"],
        enable: json["enable"],
        priceHtml: json["price_html"],
        priceType: json["price_type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "name_en": nameEn,
        "price": price,
        "type": type,
        "per_person": perPerson,
        "number": number,
        "enable": enable,
        "price_html": priceHtml,
        "price_type": priceType,
      };
}

class I18N {
  final String dateRequired;
  final String rooms;
  final String room;

  I18N({
    required this.dateRequired,
    required this.rooms,
    required this.room,
  });

  factory I18N.fromRawJson(String str) => I18N.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory I18N.fromJson(Map<String, dynamic> json) => I18N(
        dateRequired: json["date_required"],
        rooms: json["rooms"],
        room: json["room"],
      );

  Map<String, dynamic> toJson() => {
        "date_required": dateRequired,
        "rooms": rooms,
        "room": room,
      };
}

class Gallery {
  final dynamic large;
  final dynamic thumb;

  Gallery({
    required this.large,
    required this.thumb,
  });

  factory Gallery.fromRawJson(String str) => Gallery.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        large: json["large"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "thumb": thumb,
      };
}

class LocationCategory {
  final int id;
  final String name;
  final String iconClass;
  final dynamic content;
  final dynamic slug;
  final String status;
  final int lft;
  final int rgt;
  final dynamic parentId;
  final dynamic createUser;
  final dynamic updateUser;
  final dynamic deletedAt;
  final dynamic originId;
  final dynamic lang;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic locationCategoryTranslations;

  LocationCategory({
    required this.id,
    required this.name,
    required this.iconClass,
    required this.content,
    required this.slug,
    required this.status,
    required this.lft,
    required this.rgt,
    required this.parentId,
    required this.createUser,
    required this.updateUser,
    required this.deletedAt,
    required this.originId,
    required this.lang,
    required this.createdAt,
    required this.updatedAt,
    required this.locationCategoryTranslations,
  });

  factory LocationCategory.fromRawJson(String str) =>
      LocationCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationCategory.fromJson(Map<String, dynamic> json) =>
      LocationCategory(
        id: json["id"],
        name: json["name"],
        iconClass: json["icon_class"],
        content: json["content"],
        slug: json["slug"],
        status: json["status"],
        lft: json["_lft"],
        rgt: json["_rgt"],
        parentId: json["parent_id"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        deletedAt: json["deleted_at"],
        originId: json["origin_id"],
        lang: json["lang"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        locationCategoryTranslations: json["location_category_translations"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon_class": iconClass,
        "content": content,
        "slug": slug,
        "status": status,
        "_lft": lft,
        "_rgt": rgt,
        "parent_id": parentId,
        "create_user": createUser,
        "update_user": updateUser,
        "deleted_at": deletedAt,
        "origin_id": originId,
        "lang": lang,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "location_category_translations": locationCategoryTranslations,
      };
}

class ReviewList {
  final int currentPage;
  final List<dynamic> data;
  final String firstPageUrl;
  final dynamic from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final dynamic nextPageUrl;
  final String path;
  final String perPage;
  final dynamic prevPageUrl;
  final dynamic to;
  final int total;

  ReviewList({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory ReviewList.fromRawJson(String str) =>
      ReviewList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReviewList.fromJson(Map<String, dynamic> json) => ReviewList(
        currentPage: json["current_page"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x)),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Link {
  final String? url;
  final String label;
  final bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromRawJson(String str) => Link.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class Row {
  final int id;
  final String title;
  final String slug;
  final dynamic content;
  final String imageId;
  final String bannerImageId;
  final int locationId;
  final dynamic address;
  final dynamic mapLat;
  final dynamic mapLng;
  final int mapZoom;
  final int isFeatured;
  final String gallery;
  final dynamic video;
  final dynamic policy;
  final dynamic starRate;
  final String price;
  final dynamic checkInTime;
  final dynamic checkOutTime;
  final dynamic allowFullDay;
  final dynamic salePrice;
  final String status;
  final int createUser;
  final int updateUser;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic reviewScore;
  final dynamic icalImportUrl;
  final int enableExtraPrice;
  final List<RowExtraPrice> extraPrice;
  final dynamic minDayBeforeBooking;
  final dynamic minDayStays;
  final int enableServiceFee;
  final List<ServiceFee> serviceFee;
  final dynamic surrounding;
  final List<Offer> offer;
  final Location location;
  final List<dynamic> translations;
  final dynamic hasWishList;
  final Author author;

  Row({
    required this.id,
    required this.title,
    required this.slug,
    required this.content,
    required this.imageId,
    required this.bannerImageId,
    required this.locationId,
    required this.address,
    required this.mapLat,
    required this.mapLng,
    required this.mapZoom,
    required this.isFeatured,
    required this.gallery,
    required this.video,
    required this.policy,
    required this.starRate,
    required this.price,
    required this.checkInTime,
    required this.checkOutTime,
    required this.allowFullDay,
    required this.salePrice,
    required this.status,
    required this.createUser,
    required this.updateUser,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.reviewScore,
    required this.icalImportUrl,
    required this.enableExtraPrice,
    required this.extraPrice,
    required this.minDayBeforeBooking,
    required this.minDayStays,
    required this.enableServiceFee,
    required this.serviceFee,
    required this.surrounding,
    required this.offer,
    required this.location,
    required this.translations,
    required this.hasWishList,
    required this.author,
  });

  factory Row.fromRawJson(String str) => Row.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Row.fromJson(Map<String, dynamic> json) => Row(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        content: json["content"],
        imageId: json["image_id"],
        bannerImageId: json["banner_image_id"],
        locationId: json["location_id"],
        address: json["address"],
        mapLat: json["map_lat"],
        mapLng: json["map_lng"],
        mapZoom: json["map_zoom"],
        isFeatured: json["is_featured"],
        gallery: json["gallery"],
        video: json["video"],
        policy: json["policy"],
        starRate: json["star_rate"],
        price: json["price"],
        checkInTime: json["check_in_time"],
        checkOutTime: json["check_out_time"],
        allowFullDay: json["allow_full_day"],
        salePrice: json["sale_price"],
        status: json["status"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        reviewScore: json["review_score"],
        icalImportUrl: json["ical_import_url"],
        enableExtraPrice: json["enable_extra_price"],
        extraPrice: List<RowExtraPrice>.from(
            json["extra_price"].map((x) => RowExtraPrice.fromJson(x))),
        minDayBeforeBooking: json["min_day_before_booking"],
        minDayStays: json["min_day_stays"],
        enableServiceFee: json["enable_service_fee"],
        serviceFee: List<ServiceFee>.from(
            json["service_fee"].map((x) => ServiceFee.fromJson(x))),
        surrounding: json["surrounding"],
        offer: List<Offer>.from(json["offer"].map((x) => Offer.fromJson(x))),
        location: Location.fromJson(json["location"]),
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
        hasWishList: json["has_wish_list"],
        author: Author.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "content": content,
        "image_id": imageId,
        "banner_image_id": bannerImageId,
        "location_id": locationId,
        "address": address,
        "map_lat": mapLat,
        "map_lng": mapLng,
        "map_zoom": mapZoom,
        "is_featured": isFeatured,
        "gallery": gallery,
        "video": video,
        "policy": policy,
        "star_rate": starRate,
        "price": price,
        "check_in_time": checkInTime,
        "check_out_time": checkOutTime,
        "allow_full_day": allowFullDay,
        "sale_price": salePrice,
        "status": status,
        "create_user": createUser,
        "update_user": updateUser,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "review_score": reviewScore,
        "ical_import_url": icalImportUrl,
        "enable_extra_price": enableExtraPrice,
        "extra_price": List<dynamic>.from(extraPrice.map((x) => x.toJson())),
        "min_day_before_booking": minDayBeforeBooking,
        "min_day_stays": minDayStays,
        "enable_service_fee": enableServiceFee,
        "service_fee": List<dynamic>.from(serviceFee.map((x) => x.toJson())),
        "surrounding": surrounding,
        "offer": List<dynamic>.from(offer.map((x) => x.toJson())),
        "location": location.toJson(),
        "translations": List<dynamic>.from(translations.map((x) => x)),
        "has_wish_list": hasWishList,
        "author": author.toJson(),
      };
}

class RowExtraPrice {
  final String name;
  final dynamic nameEn;
  final String price;
  final String type;
  final String perPerson;

  RowExtraPrice({
    required this.name,
    required this.nameEn,
    required this.price,
    required this.type,
    required this.perPerson,
  });

  factory RowExtraPrice.fromRawJson(String str) =>
      RowExtraPrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RowExtraPrice.fromJson(Map<String, dynamic> json) => RowExtraPrice(
        name: json["name"],
        nameEn: json["name_en"],
        price: json["price"],
        type: json["type"],
        perPerson: json["per_person"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "name_en": nameEn,
        "price": price,
        "type": type,
        "per_person": perPerson,
      };
}

class Location {
  final int id;
  final String name;
  final dynamic content;
  final String slug;
  final int imageId;
  final String mapLat;
  final String mapLng;
  final int mapZoom;
  final String status;
  final int lft;
  final int rgt;
  final int parentId;
  final int createUser;
  final int updateUser;
  final dynamic deletedAt;
  final dynamic originId;
  final String lang;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic bannerImageId;
  final dynamic tripIdeas;
  final List<dynamic> translations;

  Location({
    required this.id,
    required this.name,
    required this.content,
    required this.slug,
    required this.imageId,
    required this.mapLat,
    required this.mapLng,
    required this.mapZoom,
    required this.status,
    required this.lft,
    required this.rgt,
    required this.parentId,
    required this.createUser,
    required this.updateUser,
    required this.deletedAt,
    required this.originId,
    required this.lang,
    required this.createdAt,
    required this.updatedAt,
    required this.bannerImageId,
    required this.tripIdeas,
    required this.translations,
  });

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        content: json["content"],
        slug: json["slug"],
        imageId: json["image_id"],
        mapLat: json["map_lat"],
        mapLng: json["map_lng"],
        mapZoom: json["map_zoom"],
        status: json["status"],
        lft: json["_lft"],
        rgt: json["_rgt"],
        parentId: json["parent_id"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        deletedAt: json["deleted_at"],
        originId: json["origin_id"],
        lang: json["lang"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        bannerImageId: json["banner_image_id"],
        tripIdeas: json["trip_ideas"],
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "content": content,
        "slug": slug,
        "image_id": imageId,
        "map_lat": mapLat,
        "map_lng": mapLng,
        "map_zoom": mapZoom,
        "status": status,
        "_lft": lft,
        "_rgt": rgt,
        "parent_id": parentId,
        "create_user": createUser,
        "update_user": updateUser,
        "deleted_at": deletedAt,
        "origin_id": originId,
        "lang": lang,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "banner_image_id": bannerImageId,
        "trip_ideas": tripIdeas,
        "translations": List<dynamic>.from(translations.map((x) => x)),
      };
}

class Offer {
  final String cancelPolicy;
  final String foodPolicy;
  final String moveDate;
  final String breakfastType;

  Offer({
    required this.cancelPolicy,
    required this.foodPolicy,
    required this.moveDate,
    required this.breakfastType,
  });

  factory Offer.fromRawJson(String str) => Offer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        cancelPolicy: json["cancel_policy"],
        foodPolicy: json["food_policy"],
        moveDate: json["move_date"],
        breakfastType: json["breakfast_type"],
      );

  Map<String, dynamic> toJson() => {
        "cancel_policy": cancelPolicy,
        "food_policy": foodPolicy,
        "move_date": moveDate,
        "breakfast_type": breakfastType,
      };
}

class ServiceFee {
  final String name;
  final dynamic desc;
  final dynamic nameEn;
  final dynamic descEn;
  final String price;
  final String unit;
  final String type;

  ServiceFee({
    required this.name,
    required this.desc,
    required this.nameEn,
    required this.descEn,
    required this.price,
    required this.unit,
    required this.type,
  });

  factory ServiceFee.fromRawJson(String str) =>
      ServiceFee.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceFee.fromJson(Map<String, dynamic> json) => ServiceFee(
        name: json["name"],
        desc: json["desc"],
        nameEn: json["name_en"],
        descEn: json["desc_en"],
        price: json["price"],
        unit: json["unit"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "desc": desc,
        "name_en": nameEn,
        "desc_en": descEn,
        "price": price,
        "unit": unit,
        "type": type,
      };
}

class SeoMeta {
  final int id;
  final int objectId;
  final String objectModel;
  final int seoIndex;
  final dynamic seoTitle;
  final dynamic seoDesc;
  final dynamic seoImage;
  final SeoShare seoShare;
  final int createUser;
  final int updateUser;
  final dynamic originId;
  final dynamic lang;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String slug;
  final String fullUrl;
  final String serviceTitle;
  final dynamic serviceDesc;
  final String serviceImage;

  SeoMeta({
    required this.id,
    required this.objectId,
    required this.objectModel,
    required this.seoIndex,
    required this.seoTitle,
    required this.seoDesc,
    required this.seoImage,
    required this.seoShare,
    required this.createUser,
    required this.updateUser,
    required this.originId,
    required this.lang,
    required this.createdAt,
    required this.updatedAt,
    required this.slug,
    required this.fullUrl,
    required this.serviceTitle,
    required this.serviceDesc,
    required this.serviceImage,
  });

  factory SeoMeta.fromRawJson(String str) => SeoMeta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SeoMeta.fromJson(Map<String, dynamic> json) => SeoMeta(
        id: json["id"],
        objectId: json["object_id"],
        objectModel: json["object_model"],
        seoIndex: json["seo_index"],
        seoTitle: json["seo_title"],
        seoDesc: json["seo_desc"],
        seoImage: json["seo_image"],
        seoShare: SeoShare.fromJson(json["seo_share"]),
        createUser: json["create_user"],
        updateUser: json["update_user"],
        originId: json["origin_id"],
        lang: json["lang"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        slug: json["slug"],
        fullUrl: json["full_url"],
        serviceTitle: json["service_title"],
        serviceDesc: json["service_desc"],
        serviceImage: json["service_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object_id": objectId,
        "object_model": objectModel,
        "seo_index": seoIndex,
        "seo_title": seoTitle,
        "seo_desc": seoDesc,
        "seo_image": seoImage,
        "seo_share": seoShare.toJson(),
        "create_user": createUser,
        "update_user": updateUser,
        "origin_id": originId,
        "lang": lang,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "slug": slug,
        "full_url": fullUrl,
        "service_title": serviceTitle,
        "service_desc": serviceDesc,
        "service_image": serviceImage,
      };
}

class SeoShare {
  final Facebook facebook;
  final Facebook twitter;

  SeoShare({
    required this.facebook,
    required this.twitter,
  });

  factory SeoShare.fromRawJson(String str) =>
      SeoShare.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SeoShare.fromJson(Map<String, dynamic> json) => SeoShare(
        facebook: Facebook.fromJson(json["facebook"]),
        twitter: Facebook.fromJson(json["twitter"]),
      );

  Map<String, dynamic> toJson() => {
        "facebook": facebook.toJson(),
        "twitter": twitter.toJson(),
      };
}

class Facebook {
  final dynamic title;
  final dynamic desc;
  final dynamic image;

  Facebook({
    required this.title,
    required this.desc,
    required this.image,
  });

  factory Facebook.fromRawJson(String str) =>
      Facebook.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Facebook.fromJson(Map<String, dynamic> json) => Facebook(
        title: json["title"],
        desc: json["desc"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "desc": desc,
        "image": image,
      };
}

class Translation {
  final String locale;
  final int originId;
  final String title;
  final dynamic content;
  final dynamic address;
  final dynamic policy;
  final dynamic surrounding;
  final dynamic deletedAt;

  Translation({
    required this.locale,
    required this.originId,
    required this.title,
    required this.content,
    required this.address,
    required this.policy,
    required this.surrounding,
    required this.deletedAt,
  });

  factory Translation.fromRawJson(String str) =>
      Translation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        locale: json["locale"],
        originId: json["origin_id"],
        title: json["title"],
        content: json["content"],
        address: json["address"],
        policy: json["policy"],
        surrounding: json["surrounding"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "locale": locale,
        "origin_id": originId,
        "title": title,
        "content": content,
        "address": address,
        "policy": policy,
        "surrounding": surrounding,
        "deleted_at": deletedAt,
      };
}
