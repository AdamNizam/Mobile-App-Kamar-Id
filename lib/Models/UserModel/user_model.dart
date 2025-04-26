class UserModel {
  final int id;
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime? emailVerifiedAt;
  final String? twoFactorSecret;
  final String? twoFactorRecoveryCodes;
  final String? address;
  final String? address2;
  final String phone;
  final DateTime? birthday;
  final String? city;
  final String? state;
  final String? country;
  final int? zipCode;
  final String? lastLoginAt;
  final String? bio;
  final String status;
  final String? paymentGateway;
  final String? totalGuests;
  final String? locale;
  final String? businessName;
  final String? verifySubmitStatus;
  final String? isVerified;
  final int activeStatus;
  final int darkMode;
  final String? messengerColor;
  final String? stripeCustomerId;
  final String? totalBeforeFees;
  final String? userName;
  final dynamic otpCode;
  final DateTime? otpExpiresAt;
  final String avatar;

  UserModel({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.address,
    this.address2,
    required this.phone,
    this.birthday,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    this.lastLoginAt,
    this.bio,
    required this.status,
    this.paymentGateway,
    this.totalGuests,
    this.locale,
    this.businessName,
    this.verifySubmitStatus,
    this.isVerified,
    required this.activeStatus,
    required this.darkMode,
    required this.messengerColor,
    this.stripeCustomerId,
    this.totalBeforeFees,
    this.userName,
    this.otpCode,
    this.otpExpiresAt,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"] ?? "",
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        email: json["email"] ?? "",
        emailVerifiedAt: json["email_verified_at"] != null
            ? DateTime.tryParse(json["email_verified_at"])
            : null,
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        address: json["address"],
        address2: json["address2"],
        phone: json["phone"] ?? "",
        birthday: json["birthday"] != null
            ? DateTime.tryParse(json["birthday"])
            : null,
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipCode: json["zip_code"] != null ? json["zip_code"] as int? : null,
        lastLoginAt: json["last_login_at"],
        bio: json["bio"],
        status: json["status"] ?? "unknown",
        paymentGateway: json["payment_gateway"],
        totalGuests: json["total_guests"],
        locale: json["locale"],
        businessName: json["business_name"],
        verifySubmitStatus: json["verify_submit_status"],
        isVerified: json["is_verified"],
        activeStatus: json["active_status"] ?? 0,
        darkMode: json["dark_mode"] ?? 0,
        messengerColor: json["messenger_color"] ?? "#000000",
        stripeCustomerId: json["stripe_customer_id"],
        totalBeforeFees: json["total_before_fees"],
        userName: json["user_name"],
        otpCode: json["otp_code"],
        otpExpiresAt: json["otp_expires_at"] != null
            ? DateTime.tryParse(json["otp_expires_at"])
            : null,
        avatar: json["avatar"] ?? "default.png",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "address": address,
        "address2": address2,
        "phone": phone,
        "birthday": birthday?.toIso8601String(),
        "city": city,
        "state": state,
        "country": country,
        "zip_code": zipCode,
        "last_login_at": lastLoginAt,
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
        "otp_expires_at": otpExpiresAt?.toIso8601String(),
        "avatar": avatar,
      };
}
