class RegisterResponse {
  final int status;
  final Map<String, List<String>> message;

  RegisterResponse({required this.status, required this.message});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
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
