import 'package:flutter/material.dart';

import '../../CustomWidgets/CustomButton/custombtn.dart';
import '../../CustomWidgets/CustomText/detailstext1.dart';
import '../../CustomWidgets/CustomText/detailstext2.dart';
import '../../Themes/colors.dart';

class MessageRegisterSuccess extends StatelessWidget {
  const MessageRegisterSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: AppColors.buttonColor,
                      child:
                          Icon(Icons.check, color: AppColors.white, size: 70),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text1(
                        text1: 'Registration Successful!',
                        size: 25,
                      ),
                    ),
                    Text2(text2: 'Please Verified your email'),
                  ],
                ),
              ),
              Column(
                children: [
                  CustomButton(
                    text: 'Back',
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (route) => false);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
