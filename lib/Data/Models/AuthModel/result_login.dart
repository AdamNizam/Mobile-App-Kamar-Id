class LoginResponse {
  String? token;
  int? expiresIn;

  LoginResponse({
    this.token,
    this.expiresIn,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['access_token'],
      expiresIn: json['expires_in'],
    );
  }
}
