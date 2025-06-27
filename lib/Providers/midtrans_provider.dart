import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';

Future<MidtransSDK?> initializeMidtrans() async {
  try {
    final config = MidtransConfig(
      clientKey: clientKeyMidtrans,
      merchantBaseUrl: merchantBaseUrl,
      enableLog: true,
      colorTheme: ColorTheme(
        colorPrimary: AppColors.doggerBlue,
        colorPrimaryDark: AppColors.buttonColor,
        colorSecondary: AppColors.text1Color,
      ),
    );

    final midtrans = await MidtransSDK.init(config: config);
    return midtrans;
  } catch (e, stackTrace) {
    // Kamu bisa log atau tampilkan dialog sesuai kebutuhan
    print('Midtrans initialization error: $e');
    print('Stack trace: $stackTrace');
    return null; // atau lempar ulang jika ingin menghentikan proses
  }
}
