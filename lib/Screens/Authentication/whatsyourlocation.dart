import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../Widgets/custom_outline_button.dart';
import '../../Widgets/custombtn.dart';
import 'enablelocationaccess.dart';
import 'enter_locations.dart';


class WhatsYourLocationScreen extends StatelessWidget {
  const WhatsYourLocationScreen({super.key});

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
                  Icons.location_pin,
                  color: AppColors.tabColor,
                  size: 60,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'What is Your Location?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'We need to know your location in order to suggest nearby services.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              CustomButton(text: 'Allow Location Access', onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) =>   const EnAbleLocationAccessScreen()),
                );
              }),
              const SizedBox(height: 10),
              CustomOutlinedButton(text: 'Enter Location Manually', onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) =>   const EnterLocationScreen()),
                );
              }),

            ],
          ),
        ),
      ),
    );
  }
}
