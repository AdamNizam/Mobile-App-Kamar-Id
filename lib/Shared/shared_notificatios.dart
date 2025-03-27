import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

void showCustomSnackbar(BuildContext context, String message) {
  Flushbar(
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(16),
    borderRadius: BorderRadius.circular(10),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundGradient: const LinearGradient(
      colors: [AppColors.redAwesome, AppColors.deepPink],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    boxShadows: [
      BoxShadow(
        color: AppColors.cadetGray.withOpacity(0.2),
        blurRadius: 8,
        spreadRadius: 2,
        offset: const Offset(2, 2),
      ),
    ],
    duration: const Duration(seconds: 2),
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ],
    ),
  ).show(context);
}
