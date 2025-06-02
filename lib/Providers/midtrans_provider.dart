import 'package:hotelbookingapp/Shared/shared_url.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';

Future<MidtransSDK> initializeMidtrans() async {
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
  await MidtransSDK.init(config: config);
  return MidtransSDK();
}
