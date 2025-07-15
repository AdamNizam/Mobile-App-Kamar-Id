import 'dart:convert';

class RequestUserUpdate {
  final String businessName;
  final String userName;
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final String birthday;
  final String bio;
  final String avatarId;
  final String address;
  final String address2;
  final String city;
  final String state;
  final String country;
  final String zipCode;

  RequestUserUpdate({
    required this.businessName,
    required this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.birthday,
    required this.bio,
    required this.avatarId,
    required this.address,
    required this.address2,
    required this.city,
    required this.state,
    required this.country,
    required this.zipCode,
  });

  factory RequestUserUpdate.fromRawJson(String str) =>
      RequestUserUpdate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RequestUserUpdate.fromJson(Map<String, dynamic> json) =>
      RequestUserUpdate(
        businessName: json["business_name"],
        userName: json["user_name"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        birthday: json["birthday"],
        bio: json["bio"],
        avatarId: json["avatar_id"],
        address: json["address"],
        address2: json["address2"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipCode: json["zip_code"],
      );

  Map<String, dynamic> toJson() => {
        "business_name": businessName,
        "user_name": userName,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "birthday": birthday,
        "bio": bio,
        "avatar_id": avatarId,
        "address": address,
        "address2": address2,
        "city": city,
        "state": state,
        "country": country,
        "zip_code": zipCode,
      };
}
