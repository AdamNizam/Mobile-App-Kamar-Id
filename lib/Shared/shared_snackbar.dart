import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_overflow.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

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
    duration: const Duration(seconds: 4),
    messageText: Center(
      child: CustomTextOverflow(
        text: message,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        size: 14,
      ),
    ),
  ).show(context);
}

void showExpiredDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 0,
      backgroundColor: AppColors.white,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text1(
                text1: message,
                size: 14,
                color: AppColors.cadetGray,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.buttonColor,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text(
              'OK',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ]),
    ),
  );
}
