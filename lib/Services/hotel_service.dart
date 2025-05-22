import 'dart:convert';

import 'package:hotelbookingapp/Models/HotelModel/hotel_all_model.dart';
import 'package:hotelbookingapp/Models/HotelModel/hotel_detail_model.dart';
import 'package:hotelbookingapp/Models/HotelModel/request_check_avaibility.dart';
import 'package:hotelbookingapp/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

import '../Models/HotelModel/result_check_avaibility.dart';

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
      print('Response Get All Hotel:  ${res.body}');

      if (res.statusCode == 200) {
        final hotelList = jsonDecode(res.body)['data']['rows']['data'];
        return List<HotelAllModel>.from(
          hotelList.map((hotel) => HotelAllModel.fromJson(hotel)),
        );
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<HotelDetailModel> getDetailHotel(String slug) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/hotel/$slug'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      );

      print('Response Get Detail hotel with slug($slug):  ${res.body}');

      if (res.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(res.body);
        return HotelDetailModel.fromJson(data);
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<ResultCheckAvaibility> checkAvaibilityHotel(
    RequestCheckAvaibility data,
  ) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/hotel/${data.hotelId}/checkAvailability'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data.toJson()),
      );

      print('Result API check Avaibility ${res.body}');

      if (res.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(res.body);
        return ResultCheckAvaibility.fromJson(data);
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
