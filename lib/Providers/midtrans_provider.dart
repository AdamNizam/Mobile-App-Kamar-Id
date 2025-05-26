import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';

class MidtransProvider {
  static Future<void> initializeMidtrans({
    required BuildContext context,
    required String merchantBaseUrl,
  }) async {
    try {
      final midtransConfig = MidtransConfig(
        clientKey: serverKey,
        merchantBaseUrl: merchantBaseUrl,
        enableLog: true,
        colorTheme: ColorTheme(
          colorPrimary: const Color(0xff5C5CFF),
          colorPrimaryDark: const Color(0xff000080),
          colorSecondary: const Color(0xffFFC107),
        ),
      );

      await MidtransSDK.init(config: midtransConfig);

      debugPrint("✅ Midtrans SDK berhasil diinisialisasi");
    } catch (e, stackTrace) {
      debugPrint("❌ Gagal menginisialisasi Midtrans SDK: $e");
      debugPrint("Stack trace: $stackTrace");
    }
  }
}
