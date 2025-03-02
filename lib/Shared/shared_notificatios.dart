import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

void showCustomSnackbar(BuildContext context, String message) {
  Flushbar(
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 8),
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ],
    ),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: AppColors.redDark,
    duration: const Duration(seconds: 2),
  ).show(context);
}
