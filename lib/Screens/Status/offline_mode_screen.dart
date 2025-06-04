import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class OfflineModeScreen extends StatelessWidget {
  const OfflineModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off, size: 100, color: AppColors.buttonColor),
            SizedBox(height: 20),
            Text1(
              text1: "You're Offline",
              size: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.cadetGray,
            ),
          ],
        ),
      ),
    );
  }
}
