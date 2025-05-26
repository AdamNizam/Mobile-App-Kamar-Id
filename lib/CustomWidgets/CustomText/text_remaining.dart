import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Text1(
        text1: text,
        size: 12,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}
