import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class CustomTextEllipsis extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  const CustomTextEllipsis({
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
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
