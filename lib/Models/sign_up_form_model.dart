class SignUpFormModel {
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final String? password;
  final bool? term;

  const SignUpFormModel({
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.password,
    this.term = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'password': password,
      'term': term,
    };
  }
}
