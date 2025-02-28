import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/custombtn.dart';
import '../../../Widgets/detailstext1.dart';
import '../../../Widgets/detailstext2.dart';

class YouHaveArrived extends StatelessWidget {
  const YouHaveArrived({super.key});

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
              const SizedBox(height: 30),
              const Center(
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.buttonColor,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    ),                    SizedBox(height: 10),
                    Text1(text1: 'You Have Arrived!', size: 24),
                    SizedBox(height: 5),
                    Text2(text2: 'You have arrived at the Hotel Location.'),
                  ],
                ),
              ),
              CustomButton(
                text: 'OK',
                onTap: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
