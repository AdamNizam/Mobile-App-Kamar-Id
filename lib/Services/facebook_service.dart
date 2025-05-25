import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookService {
  AccessToken? tokenAccess;
  Map<String, dynamic>? dataUser;

  AccessToken? get accessToken => tokenAccess;
  Map<String, dynamic>? get userData => dataUser;

  Future<Map<String, dynamic>?> login() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        tokenAccess = result.accessToken;
        dataUser = await FacebookAuth.instance.getUserData();

        debugPrint('Access Token: ${tokenAccess!.token}');
        debugPrint('User Data: $dataUser');

        return dataUser;
      }
    } catch (error) {
      debugPrint('Facebook Sign-In Error: $error');
      rethrow;
    }
    return null;
  }

  Future<void> logout() async {
    await FacebookAuth.instance.logOut();
    tokenAccess = null;
    dataUser = null;
  }
}
