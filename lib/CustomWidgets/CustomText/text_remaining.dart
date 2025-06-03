import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class TextRemaining extends StatelessWidget {
  final String text;
  final Color color;

  const TextRemaining({
    super.key,
    required this.text,
    this.color = AppColors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.hourglass_top,
          size: 16,
          color: color,
        ),
        const SizedBox(width: 4),
        Text1(
          text1: text,
          size: 13,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ],
    );
  }
}
