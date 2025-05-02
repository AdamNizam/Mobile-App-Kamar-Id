import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

class CustomIcon1Avaibility extends StatelessWidget {
  final IconData icon;
  final String title;
  const CustomIcon1Avaibility({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
          margin: const EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.amberColor,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: 18,
            color: AppColors.button2Color,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Center(
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.tabColor,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
