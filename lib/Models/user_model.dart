class LoginResponseResult {
  String? token;

  LoginResponseResult({
    this.token,
  });

  factory LoginResponseResult.fromJson(Map<String, dynamic> json) {
    return LoginResponseResult(token: json['access_token']);
  }
}
