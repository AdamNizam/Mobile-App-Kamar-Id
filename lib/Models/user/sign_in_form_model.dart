class SignInFormModel {
  final String? email;
  final String? password;

  SignInFormModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class LoginResponseResult {
  String? token;

  LoginResponseResult({this.token});

  factory LoginResponseResult.fromJson(Map<String, dynamic> json) {
    return LoginResponseResult(token: json['access_token']);
  }
}
