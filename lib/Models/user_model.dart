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

class UserProfileModel {}
