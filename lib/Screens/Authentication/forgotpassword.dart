import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/Status/maintenance_screen.dart';

import '../../CustomWidgets/CustomButton/custombtn.dart';
import '../../CustomWidgets/CustomText/customtextfield.dart';
import '../../CustomWidgets/CustomText/detailstext1.dart';
import '../../CustomWidgets/CustomText/detailstext2.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13, vertical: 14),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text1(
                          text1: 'Reset Your Password',
                          size: 16,
                        ),
                        Text('  🔑')
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Text2(
                        text2: 'Please enter the email with your account',
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(icon: Icons.email, label: 'Email Address'),
                    SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      height: 400,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: CustomButton(
          text: 'Send',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const MaintenanceScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
