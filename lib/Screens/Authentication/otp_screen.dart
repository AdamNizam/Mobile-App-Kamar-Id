import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hotelbookingapp/Screens/Authentication/resend_otp_screen.dart';
import 'package:hotelbookingapp/Screens/HomeScreen/bottom_navigation.dart';

import '../../CustomWidgets/CustomButton/custombtn.dart';
import '../../CustomWidgets/detailstext1.dart';
import '../../CustomWidgets/detailstext2.dart';
import '../../Themes/colors.dart';
import '../HomeScreen/home_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 8,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text1(text1: 'Verify Your OTP'),
                  Text('  🔒'),
                ],
              ),
              const SizedBox(height: 12),
              const Center(
                child: Text2(
                  text2: 'Enter the OTP sent to your email address',
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: OtpTextField(
                  numberOfFields: 6,
                  borderColor: AppColors.text3Color,
                  cursorColor: Colors.white,
                  textStyle: const TextStyle(color: Colors.black),
                  disabledBorderColor: AppColors.text3Color,
                  enabledBorderColor: Colors.grey,
                  fillColor: Colors.green,
                  focusedBorderColor: AppColors.text3Color,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    // Handle OTP verification here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ResendOtpScreen()),
                    );
                  },
                  child: const Text(
                    'Resend OTP',
                    style: TextStyle(color: Color(0xff0FA217)),
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'Verify OTP',
                onTap: () {
                  // Handle OTP verification here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const BottomNavigationHome()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Next Screen'),
      ),
    );
  }
}
