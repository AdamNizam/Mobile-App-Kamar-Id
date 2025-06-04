import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class CustomTextOverflow extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  const CustomTextOverflow({
    super.key,
    required this.text,
    this.color = AppColors.cadetGray,
    this.size = 16,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
      softWrap: true,
      maxLines: null,
    );
  }
}
