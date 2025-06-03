import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text2.dart';

import '../../Themes/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color color;
  final double height;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.color = AppColors.buttonColor,
      this.height = 42});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        margin: const EdgeInsets.symmetric(
          vertical: 7,
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text2(
            text2: text,
            color: AppColors.buttonTextColor,
            fontWeight: FontWeight.w500,
            size: 16,
          ),
        ),
      ),
    );
  }
}
