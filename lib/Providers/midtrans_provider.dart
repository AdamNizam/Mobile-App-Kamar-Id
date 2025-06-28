import 'package:flutter/material.dart'; // Dibutuhkan untuk Theme.of(context) jika digunakan
import 'package:hotelbookingapp/Shared/shared_snackbar.dart'; // Pastikan path ini benar
import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';

late MidtransSDK _midtrans;

Future<void> initializeMidtrans({required BuildContext context}) async {
  try {
    const String clientKey = clientKeyMidtrans;
    const String merchantBaseUrl = midtransUrlMidtrans;

    final config = MidtransConfig(
      clientKey: clientKey,
      merchantBaseUrl: merchantBaseUrl,
      colorTheme: ColorTheme(
        // Menggunakan tema dari context yang diberikan
        colorPrimary: Theme.of(context).colorScheme.primary,
        colorPrimaryDark: Theme.of(context).colorScheme.primary,
        colorSecondary: Theme.of(context).colorScheme.secondary,
      ),
    );

    final midtrans = await MidtransSDK.init(config: config);
    _midtrans = midtrans;

    // Menyiapkan callback listener untuk transaksi
    _midtrans.setTransactionFinishedCallback((result) {
      debugPrint("Midtrans Transaction Finished: ${result.toJson()}");
      String message = "";
      switch (result.transactionStatus) {
        case TransactionResultStatus.settlement:
          message = "Pembayaran berhasil (settlement)";
          // Lakukan sesuatu jika sukses
          break;
        case TransactionResultStatus.pending:
          message = "Pembayaran pending";
          // Beri tahu pengguna pembayaran menunggu konfirmasi
          break;
        case TransactionResultStatus.deny:
          message = "Pembayaran ditolak";
          break;
        case TransactionResultStatus.expire:
          message = "Pembayaran kadaluarsa";
          break;
        case TransactionResultStatus.cancel:
          message = "Pembayaran dibatalkan";
          break;
        default:
          message = "Status transaksi tidak diketahui.";
          break;
      }
      if (context.mounted) {
        showCustomSnackbar(context, message);
      }
    });

    debugPrint("✅ Midtrans SDK berhasil diinisialisasi");
  } catch (error) {
    debugPrint("❌ Gagal inisialisasi Midtrans SDK: $error");
    if (context.mounted) {
      showCustomSnackbar(context, 'Gagal inisialisasi Midtrans SDK: $error');
    }
    // Jika gagal inisialisasi, pastikan _midtrans tidak tetap menjadi late tanpa nilai
    // atau Anda bisa melempar error kembali jika ingin menanganinya di level yang lebih tinggi
    rethrow; // Melemparkan error kembali agar bisa ditangkap di tempat pemanggil
  }
}

MidtransSDK get midtransSdkInstance {
  return _midtrans;
}
