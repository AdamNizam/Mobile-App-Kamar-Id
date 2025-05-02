import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../CustomWidgets/custom_outline_button.dart';
import '../../CustomWidgets/custombtn.dart';
import '../HomeScreen/home_screen.dart';

class EnAbleLocationAccessScreen extends StatelessWidget {
  const EnAbleLocationAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: const Icon(
                  Icons.notification_important_rounded,
                  color: AppColors.tabColor,
                  size: 60,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Enable Notifications Access?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Enable notifications to receive real  \n update on your Order  .',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              CustomButton(
                  text: 'Allow Notifications',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HomePage()));
                  }),
              const SizedBox(height: 10),
              CustomOutlinedButton(text: 'Maybe Later', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
