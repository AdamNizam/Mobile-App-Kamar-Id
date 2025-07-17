import 'dart:convert';

import 'package:hotelbookingapp/Data/Api/auth_service.dart';
import 'package:hotelbookingapp/Data/Models/WishlistModel/request_wishlist.dart';
import 'package:hotelbookingapp/Data/Models/WishlistModel/result_wishlist.dart';
import 'package:hotelbookingapp/Data/Models/WishlistModel/wishlist_model.dart';
import 'package:hotelbookingapp/shared/shared_url.dart';
import 'package:http/http.dart' as http;

class WishlistService {
  Future<ResultWishlist> postWishList(RequestWishlist data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/user/wishlist'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data.toJson()),
      );
      print('response POST wishlist ${res.body}');

      if (res.statusCode == 200) {
        return ResultWishlist.fromJson(jsonDecode(res.body));
      } else if (res.statusCode == 500) {
        throw Exception("Server error :  ${res.statusCode}");
      } else {
        throw Exception(jsonDecode(res.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<GetWishlistModel> getWishList() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/user/wishlist'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      print('Reponse API Get Wishlist: ${res.body}');

      if (res.statusCode == 200) {
        return GetWishlistModel.fromJson(jsonDecode(res.body));
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
