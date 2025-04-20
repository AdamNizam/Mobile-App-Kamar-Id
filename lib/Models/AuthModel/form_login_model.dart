class FormLoginModel {
  final String? email;
  final String? password;

  FormLoginModel({
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
