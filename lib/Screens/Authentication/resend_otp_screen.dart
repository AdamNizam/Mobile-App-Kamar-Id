import 'package:flutter/material.dart';
import '../../Widgets/custombtn.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/detailstext1.dart';
import '../../Widgets/detailstext2.dart';

class ResendOtpScreen extends StatelessWidget {
  const ResendOtpScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),

            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text1(text1: 'Resend OTP'),
                      Text('  🔄')
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Center(
                    child: Text2(
                        text2: 'Please enter your phone number to resend OTP'
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const CustomTextField(
                      icon: Icons.phone,
                      label: 'Phone Number'
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  CustomButton(
                      text: 'Send OTP',
                      onTap: () {
                        // Handle resend OTP logic here
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}