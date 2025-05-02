import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class Text2 extends StatelessWidget {
  final String text2;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  const Text2({
    super.key,
    required this.text2,
    this.color = AppColors.text2Color,
    this.size = 16, // Default size
    this.fontWeight = FontWeight.w400, // Default weight
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text2,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight, // Adjustable font weight
        color: color,
      ),
    );
  }
}
