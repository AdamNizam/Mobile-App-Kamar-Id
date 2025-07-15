import 'dart:convert';

import 'package:hotelbookingapp/Data/Models/HotelModel/hotel_all_model.dart';
import 'package:hotelbookingapp/Data/Models/HotelModel/hotel_detail_model.dart';
import 'package:hotelbookingapp/Data/Models/HotelModel/request_check_avaibility.dart';
import 'package:hotelbookingapp/Data/Models/HotelModel/request_filter_model.dart';
import 'package:hotelbookingapp/Data/Models/HotelModel/result_filter_model.dart';
import 'package:hotelbookingapp/Data/Api/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

import '../../Models/HotelModel/result_check_avaibility.dart';

class HotelService {
  Future<HotelAllModel> gethAllHotels() async {
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
        return HotelAllModel.fromJson(jsonDecode(res.body));
      } else if (res.statusCode == 500) {
        throw Exception("Server error :  ${res.statusCode}");
      } else {
        throw Exception(jsonDecode(res.body)['message']);
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

      print(
          '${res.statusCode} Response API Get Detail hotel slug: ($slug) :  ${res.body}');

      if (res.statusCode == 200) {
        return HotelDetailModel.fromJson(jsonDecode(res.body));
      } else if (res.statusCode == 500) {
        throw Exception("Server error :  ${res.statusCode}");
      } else {
        throw Exception(jsonDecode(res.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResultCheckAvaibility> checkAvaibility(
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

      print('${res.statusCode} Result API check Avaibility ${res.body}');

      if (res.statusCode == 200) {
        return ResultCheckAvaibility.fromJson(jsonDecode(res.body));
      } else if (res.statusCode == 500) {
        throw Exception("Server error :  ${res.statusCode}");
      } else {
        throw Exception(jsonDecode(res.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ResultFilterModel>> filterHotel(
    RequestFilterModel data,
  ) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
          Uri.parse('https://develop.tripordare.com/public/api/hotel'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: data.toFormData());

      print('${res.statusCode} = Result API Filter Hotel: ${res.body}');

      if (res.statusCode == 200) {
        final hotelList = jsonDecode(res.body)['data']['rows']['data'];
        return List<ResultFilterModel>.from(
          hotelList.map((hotel) => ResultFilterModel.fromJson(hotel)),
        );
      } else if (res.statusCode == 500) {
        throw Exception("Server error :  ${res.statusCode}");
      } else {
        throw Exception(jsonDecode(res.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
