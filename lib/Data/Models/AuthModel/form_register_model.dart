class FormRegisterModel {
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final String? password;
  final int? term;

  const FormRegisterModel({
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.password,
    this.term = 1,
  });

  factory FormRegisterModel.fromJson(Map<String, dynamic> json) {
    return FormRegisterModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      term: (json['term'] == true) ? 1 : 0,
    );
  }

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
