class SignUpFormModel {
  final String? firstName;
  final String? lastName;
  final String? noHp;
  final String? email;
  final String? password;
  final bool? term;

  const SignUpFormModel({
    this.firstName,
    this.lastName,
    this.noHp,
    this.email,
    this.password,
    this.term,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'no_hp': noHp,
      'email': email,
      'password': password,
      'term': term,
    };
  }
}
