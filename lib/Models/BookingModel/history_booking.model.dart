import 'dart:convert';

class HistoryBookingModel {
  final List<Datum> data;

  HistoryBookingModel({
    required this.data,
  });

  factory HistoryBookingModel.fromRawJson(String str) =>
      HistoryBookingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryBookingModel.fromJson(Map<String, dynamic> json) =>
      HistoryBookingModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int id;
  final String code;
  final int vendorId;
  final int customerId;
  final int paymentId;
  final String gateway;
  final int objectId;
  final String objectModel;
  final DateTime startDate;
  final DateTime endDate;
  final String total;
  final int totalGuests;
  final String status;
  final int commission;
  final CommissionType commissionType;
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final String address;
  final String address2;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final int createUser;
  final int updateUser;
  final List<BuyerFee> buyerFees;
  final String totalBeforeFees;
  final String payNow;
  final int walletCreditUsed;
  final int walletTotalUsed;
  final String vendorServiceFeeAmount;
  final String totalBeforeDiscount;
  final String couponAmount;
  final Service service;
  final BookingMeta bookingMeta;
  final String serviceIcon;

  Datum({
    required this.id,
    required this.code,
    required this.vendorId,
    required this.customerId,
    required this.paymentId,
    required this.gateway,
    required this.objectId,
    required this.objectModel,
    required this.startDate,
    required this.endDate,
    required this.total,
    required this.totalGuests,
    required this.status,
    required this.commission,
    required this.commissionType,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
    required this.address2,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    required this.createUser,
    required this.updateUser,
    required this.buyerFees,
    required this.totalBeforeFees,
    required this.payNow,
    required this.walletCreditUsed,
    required this.walletTotalUsed,
    required this.vendorServiceFeeAmount,
    required this.totalBeforeDiscount,
    required this.couponAmount,
    required this.service,
    required this.bookingMeta,
    required this.serviceIcon,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        code: json["code"],
        vendorId: json["vendor_id"],
        customerId: json["customer_id"],
        paymentId: json["payment_id"],
        gateway: json["gateway"],
        objectId: json["object_id"],
        objectModel: json["object_model"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        total: json["total"],
        totalGuests: json["total_guests"],
        status: json["status"],
        commission: json["commission"],
        commissionType: CommissionType.fromJson(json["commission_type"]),
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        address: json["address"],
        address2: json["address2"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        country: json["country"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        buyerFees: List<BuyerFee>.from(
            json["buyer_fees"].map((x) => BuyerFee.fromJson(x))),
        totalBeforeFees: json["total_before_fees"],
        payNow: json["pay_now"],
        walletCreditUsed: json["wallet_credit_used"],
        walletTotalUsed: json["wallet_total_used"],
        vendorServiceFeeAmount: json["vendor_service_fee_amount"],
        totalBeforeDiscount: json["total_before_discount"],
        couponAmount: json["coupon_amount"],
        service: Service.fromJson(json["service"]),
        bookingMeta: BookingMeta.fromJson(json["booking_meta"]),
        serviceIcon: json["service_icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "vendor_id": vendorId,
        "customer_id": customerId,
        "payment_id": paymentId,
        "gateway": gateway,
        "object_id": objectId,
        "object_model": objectModel,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "total": total,
        "total_guests": totalGuests,
        "status": status,
        "commission": commission,
        "commission_type": commissionType.toJson(),
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "address": address,
        "address2": address2,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "country": country,
        "create_user": createUser,
        "update_user": updateUser,
        "buyer_fees": List<dynamic>.from(buyerFees.map((x) => x.toJson())),
        "total_before_fees": totalBeforeFees,
        "pay_now": payNow,
        "wallet_credit_used": walletCreditUsed,
        "wallet_total_used": walletTotalUsed,
        "vendor_service_fee_amount": vendorServiceFeeAmount,
        "total_before_discount": totalBeforeDiscount,
        "coupon_amount": couponAmount,
        "service": service.toJson(),
        "booking_meta": bookingMeta.toJson(),
        "service_icon": serviceIcon,
      };
}

class BookingMeta {
  final dynamic duration;
  final int basePrice;
  final dynamic salePrice;
  final int guests;
  final int adults;
  final String children;
  final List<ExtraPrice> extraPrice;
  final String locale;
  final String howToPay;

  BookingMeta({
    required this.duration,
    required this.basePrice,
    required this.salePrice,
    required this.guests,
    required this.adults,
    required this.children,
    required this.extraPrice,
    required this.locale,
    required this.howToPay,
  });

  factory BookingMeta.fromRawJson(String str) =>
      BookingMeta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingMeta.fromJson(Map<String, dynamic> json) => BookingMeta(
        duration: json["duration"],
        basePrice: json["base_price"],
        salePrice: json["sale_price"],
        guests: json["guests"],
        adults: json["adults"],
        children: json["children"],
        extraPrice: List<ExtraPrice>.from(
            json["extra_price"].map((x) => ExtraPrice.fromJson(x))),
        locale: json["locale"],
        howToPay: json["how_to_pay"],
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "base_price": basePrice,
        "sale_price": salePrice,
        "guests": guests,
        "adults": adults,
        "children": children,
        "extra_price": List<dynamic>.from(extraPrice.map((x) => x.toJson())),
        "locale": locale,
        "how_to_pay": howToPay,
      };
}

class ExtraPrice {
  final String name;
  final dynamic nameEn;
  final String price;
  final String type;
  final String total;

  ExtraPrice({
    required this.name,
    required this.nameEn,
    required this.price,
    required this.type,
    required this.total,
  });

  factory ExtraPrice.fromRawJson(String str) =>
      ExtraPrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExtraPrice.fromJson(Map<String, dynamic> json) => ExtraPrice(
        name: json["name"],
        nameEn: json["name_en"],
        price: json["price"],
        type: json["type"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "name_en": nameEn,
        "price": price,
        "type": type,
        "total": total,
      };
}

class BuyerFee {
  final String name;
  final String desc;
  final String nameEn;
  final String descEn;
  final String price;
  final String unit;
  final String type;

  BuyerFee({
    required this.name,
    required this.desc,
    required this.nameEn,
    required this.descEn,
    required this.price,
    required this.unit,
    required this.type,
  });

  factory BuyerFee.fromRawJson(String str) =>
      BuyerFee.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BuyerFee.fromJson(Map<String, dynamic> json) => BuyerFee(
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

class CommissionType {
  final String amount;
  final String type;

  CommissionType({
    required this.amount,
    required this.type,
  });

  factory CommissionType.fromRawJson(String str) =>
      CommissionType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommissionType.fromJson(Map<String, dynamic> json) => CommissionType(
        amount: json["amount"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "type": type,
      };
}

class Service {
  final String title;

  Service({
    required this.title,
  });

  factory Service.fromRawJson(String str) => Service.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
      };
}
