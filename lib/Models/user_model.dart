import 'dart:convert';

// Respone Login
class LoginResponseResult {
  String? token;

  LoginResponseResult({this.token});

  factory LoginResponseResult.fromJson(Map<String, dynamic> json) {
    return LoginResponseResult(token: json['access_token']);
  }
}

// Respone Register
class RegisterResponseResult {
  final int status;
  final Map<String, List<String>> message;

  RegisterResponseResult({required this.status, required this.message});

  factory RegisterResponseResult.fromJson(Map<String, dynamic> json) {
    return RegisterResponseResult(
      status: json['status'],
      message: Map<String, List<String>>.from(
        json['message'].map(
          (key, value) => MapEntry(key, List<String>.from(value)),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }
}

class UserProfileModel {
  final Data data;
  final Map<String, String> country;
  final int status;

  UserProfileModel({
    required this.data,
    required this.country,
    required this.status,
  });

  factory UserProfileModel.fromRawJson(String str) =>
      UserProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        data: Data.fromJson(json["data"]),
        country: Map.from(json["country"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "country":
            Map.from(country).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "status": status,
      };
}

class Data {
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

  Data({
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

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
