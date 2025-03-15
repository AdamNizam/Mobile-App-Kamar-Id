import 'dart:convert';

import 'package:hotelbookingapp/Models/wishlist/wishlist_model.dart';
import 'package:hotelbookingapp/services/auth_service.dart';
import 'package:hotelbookingapp/shared/shared_url.dart';
import 'package:http/http.dart' as http;

class WishlistService {
  Future<List<Datum>> getWishList() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/user/wishlist'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        final jsonData = jsonDecode(res.body);

        if (jsonData == null || !jsonData.containsKey('data')) {}

        final List<dynamic> wishlistData = jsonData['data'] ?? [];
        return wishlistData
            .map((wishlist) => Datum.fromJson(wishlist))
            .toList();
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
