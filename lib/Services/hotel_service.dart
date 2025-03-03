import 'dart:convert';

import 'package:hotelbookingapp/Models/hotel_all_model.dart';
import 'package:hotelbookingapp/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class HotelService {
  Future<List<HotelAllModel>> gethAllHotels() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/hotel'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      );
      print("Response dari API: ${res.body}");

      if (res.statusCode == 200) {
        return List<HotelAllModel>.from(
          jsonDecode(res.body)['data']
              .map((hotel) => HotelAllModel.fromJson(hotel)),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
