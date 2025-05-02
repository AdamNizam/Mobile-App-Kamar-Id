import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Themes/colors.dart';

class Text1 extends StatelessWidget {
  final String text1;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  const Text1({
    super.key,
    required this.text1,
    this.color = AppColors.text1Color,
    this.size = 14,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text1,
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          color: color,
          fontWeight: fontWeight, // Adjustable font weight
          fontSize: size,
        ),
      ),
    );
  }
}
