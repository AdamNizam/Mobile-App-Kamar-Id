import 'dart:convert';

import 'package:hotelbookingapp/Models/hotel/hotel_all_model.dart';
import 'package:hotelbookingapp/Models/hotel/hotel_detail_model.dart';
import 'package:hotelbookingapp/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

import '../Models/hotel/result_check_avaibility_model.dart';

class HotelService {
  Future<List<HotelAllModel>> gethAllHotels() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/hotel'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        return List<HotelAllModel>.from(
          jsonDecode(res.body)['data']
              .map((hotel) => HotelAllModel.fromJson(hotel)),
        );
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Row> getDetailHotel(String slug) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/hotel/$slug'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      );
      if (res.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(res.body);
        return Row.fromJson(data['row']);
      }

      throw jsonDecode(res.body)['message'] ?? 'Terjadi kesalahan';
    } catch (e) {
      rethrow;
    }
  }

  Future<HotelDetailModel> getAllDetailHotel(String slug) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/hotel/$slug'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(res.body);
        return HotelDetailModel.fromJson(data);
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<ResultChekAvaibilityModel> checkAvaibility(int id) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/hotel/$id/checkAvailability'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      );
      print('Url $res');

      print('Response Body: ${res.body}');

      if (res.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(res.body);
        return ResultChekAvaibilityModel.fromJson(data);
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
