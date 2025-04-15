import 'dart:convert';

class ChekoutModel {
  final String code;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String customerNotes;
  final String paymentGateway;
  final String termConditions;
  final dynamic couponCode;

  ChekoutModel({
    required this.code,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    required this.customerNotes,
    required this.paymentGateway,
    required this.termConditions,
    required this.couponCode,
  });

  factory ChekoutModel.fromRawJson(String str) =>
      ChekoutModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChekoutModel.fromJson(Map<String, dynamic> json) => ChekoutModel(
        code: json["code"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        addressLine1: json["address_line_1"],
        addressLine2: json["address_line_2"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        country: json["country"],
        customerNotes: json["customer_notes"],
        paymentGateway: json["payment_gateway"],
        termConditions: json["term_conditions"],
        couponCode: json["coupon_code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "address_line_1": addressLine1,
        "address_line_2": addressLine2,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "country": country,
        "customer_notes": customerNotes,
        "payment_gateway": paymentGateway,
        "term_conditions": termConditions,
        "coupon_code": couponCode,
      };
}
