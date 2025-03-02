class UserModel {
  final int id;
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String birthday;
  final String country;
  final String status;
  final String? avatar;
  final String userName;
  final String? otpCode;
  final String? otpExpiresAt;

  UserModel({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.country,
    required this.status,
    this.avatar,
    required this.userName,
    this.otpCode,
    this.otpExpiresAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'] ?? '',
      birthday: json['birthday'] ?? '',
      country: json['country'] ?? '',
      status: json['status'] ?? '',
      avatar: json['avatar'],
      userName: json['user_name'],
      otpCode: json['otp_code'],
      otpExpiresAt: json['otp_expires_at'],
    );
  }
}
