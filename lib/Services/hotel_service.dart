import 'dart:convert';

import 'package:hotelbookingapp/Models/HotelModel/hotel_all_model.dart';
import 'package:hotelbookingapp/Models/HotelModel/hotel_detail_model.dart';
import 'package:hotelbookingapp/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../Models/ResponseResultModel/result_check_avaibility.dart';

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

  Future<ResultCheckAvaibility> checkAvaibility({
    required int hotelId,
    required DateTime startDate,
    required DateTime endDate,
    required int adults,
    bool firstLoad = false,
    int? children,
  }) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/hotel/$hotelId/checkAvailability'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "hotel_id": hotelId,
          "start_date": DateFormat('yyyy-MM-dd').format(startDate),
          "end_date": DateFormat('yyyy-MM-dd').format(endDate),
          "firstLoad": firstLoad,
          "adults": adults,
          "children": children ?? "",
        }),
      );

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
