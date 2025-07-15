import 'dart:convert';

import 'package:hotelbookingapp/Data/Models/ChatModel/from_send_message.dart';
import 'package:hotelbookingapp/Data/Models/ChatModel/result_get_contacts.dart';
import 'package:hotelbookingapp/Data/Api/Services/auth_service.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:http/http.dart' as http;

class ChatService {
  Future<ResultGetContacts> getContacts() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrlChat/getContacts'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      print('Response getContacts: status code ${res.statusCode} ${res.body}');

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
      rethrow;
    }
  }

  Future<void> sendMessage(FormSendMessage dataRequest) async {
    try {
      final token = await AuthService().getToken();

      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrlChat/sendMessage'),
      );

      request.headers.addAll({
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      });

      // Cek jika file tidak null
      if (dataRequest.file != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'file',
            dataRequest.file!.path,
            filename: dataRequest.file!.name,
          ),
        );
      }

      // Tambahkan field lain
      request.fields['id'] = dataRequest.id.toString();
      request.fields['type'] = dataRequest.type;
      request.fields['message'] = dataRequest.message;
      request.fields['temporaryMsgId'] = dataRequest.temporaryMsgId;

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      print('Response send message: ${response.statusCode}');

      if (response.statusCode != 200) {
        if (response.statusCode == 401) {
          throw Exception('Unauthorized. Please login again.');
        } else if (response.statusCode == 404) {
          throw Exception('Endpoint not found.');
        } else if (response.statusCode == 500) {
          throw Exception('Internal server error. Please try again later.');
        } else {
          throw Exception('Request failed with status ${response.statusCode}');
        }
      }
    } catch (error) {
      rethrow;
    }
  }
}
