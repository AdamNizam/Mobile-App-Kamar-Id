import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../Widgets/custombtn.dart';
import '../../Widgets/detailstext1.dart';
import '../../Widgets/detailstext2.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(''),
              const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: AppColors.buttonColor,
                      child: Icon(Icons.check, color: Colors.white, size: 70),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text1(
                        text1: 'Congratulations!',
                        size: 30,
                      ),
                    ),
                    Text2(text2: 'message'),
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
