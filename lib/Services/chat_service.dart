import 'dart:convert';

import 'package:hotelbookingapp/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

import '../Models/ChatModel/result_get_contacts.dart';

class ChatService {
  Future<ResultGetContacts> getContacts() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrlChat/getContacts'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      print('Response getContacts: ${res.body}');

      if (res.statusCode == 200) {
        final responseBody = jsonDecode(res.body);

        if (responseBody['status'] == 0) {
          throw Exception(responseBody['message']);
        }

        return ResultGetContacts.fromJson(responseBody);
      } else {
        throw Exception(
            'Failed to load contacts: ${jsonDecode(res.body)['message']}');
      }
    } catch (error) {
      print('Error in getContacts: $error');
      rethrow;
    }
  }
}
