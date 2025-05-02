import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
