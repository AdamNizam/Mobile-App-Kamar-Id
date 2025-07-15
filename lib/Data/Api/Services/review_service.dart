import 'dart:convert';

import 'package:hotelbookingapp/Data/Models/ReviewModel/form_review.dart';
import 'package:hotelbookingapp/Data/Models/ReviewModel/result_review.dart';
import 'package:hotelbookingapp/Data/Api/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class ReviewService {
  Future<ResultReview> sendReview(FormReview data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/review'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data.toJson()),
      );

      print('Response API review:  ${res.body}');

      if (res.statusCode == 200) {
        return ResultReview.fromJson(jsonDecode(res.body));
      } else if (res.statusCode == 500) {
        throw Exception("Server error:  ${res.statusCode}");
      } else {
        throw Exception(jsonDecode(res.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
