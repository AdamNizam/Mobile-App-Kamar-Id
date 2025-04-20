import 'dart:convert';

class HistoryBookingModel {
  final List<DataHistory> dataHistory;

  HistoryBookingModel({
    required this.dataHistory,
  });

  factory HistoryBookingModel.fromRawJson(String str) =>
      HistoryBookingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryBookingModel.fromJson(Map<String, dynamic> json) =>
      HistoryBookingModel(
        dataHistory: (json["data"] as List?)
                ?.map((x) => DataHistory.fromJson(x))
                .whereType<DataHistory>()
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(dataHistory.map((x) => x.toJson())),
      };
}

class DataHistory {
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
  final String serviceIcon;

  DataHistory({
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
    required this.serviceIcon,
  });

  factory DataHistory.fromJson(Map<String, dynamic> json) => DataHistory(
        id: json["id"] ?? 0,
        code: json["code"] ?? "",
        vendorId: json["vendor_id"] ?? 0,
        customerId: json["customer_id"] ?? 0,
        paymentId: json["payment_id"] ?? 0,
        gateway: json["gateway"] ?? "",
        objectId: json["object_id"] ?? 0,
        objectModel: json["object_model"] ?? "",
        startDate:
            DateTime.tryParse(json["start_date"] ?? "") ?? DateTime.now(),
        endDate: DateTime.tryParse(json["end_date"] ?? "") ?? DateTime.now(),
        total: json["total"] ?? "0",
        totalGuests: json["total_guests"] ?? 0,
        status: json["status"] ?? "",
        commission: json["commission"] ?? 0,
        commissionType: CommissionType.fromJson(json["commission_type"] ?? {}),
        email: json["email"] ?? "",
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        phone: json["phone"] ?? "",
        address: json["address"] ?? "",
        address2: json["address2"] ?? "",
        city: json["city"] ?? "",
        state: json["state"] ?? "",
        zipCode: json["zip_code"] ?? "",
        country: json["country"] ?? "",
        createUser: json["create_user"] ?? 0,
        updateUser: json["update_user"] ?? 0,
        buyerFees: (json["buyer_fees"] as List?)
                ?.map((x) {
                  try {
                    return BuyerFee.fromJson(x);
                  } catch (_) {
                    return null;
                  }
                })
                .whereType<BuyerFee>()
                .toList() ??
            [],
        totalBeforeFees: json["total_before_fees"] ?? "0",
        payNow: json["pay_now"] ?? "0",
        walletCreditUsed: json["wallet_credit_used"] ?? 0,
        walletTotalUsed: json["wallet_total_used"] ?? 0,
        vendorServiceFeeAmount: json["vendor_service_fee_amount"] ?? "0",
        totalBeforeDiscount: json["total_before_discount"] ?? "0",
        couponAmount: json["coupon_amount"] ?? "0",
        service: Service.fromJson(json["service"] ?? {}),
        serviceIcon: json["service_icon"] ?? "",
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
        "buyer_fees": buyerFees.map((x) => x.toJson()).toList(),
        "total_before_fees": totalBeforeFees,
        "pay_now": payNow,
        "wallet_credit_used": walletCreditUsed,
        "wallet_total_used": walletTotalUsed,
        "vendor_service_fee_amount": vendorServiceFeeAmount,
        "total_before_discount": totalBeforeDiscount,
        "coupon_amount": couponAmount,
        "service": service.toJson(),
        "service_icon": serviceIcon,
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
