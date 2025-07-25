import 'package:flutter/material.dart';

import '../../Themes/colors.dart';
import '../CustomText/text1.dart';

class CustomAppBar extends StatelessWidget {
  final String text, text1;
  final Color backgroundColor;

  const CustomAppBar({
    super.key,
    required this.text,
    required this.text1,
    this.backgroundColor =
        AppColors.bgColor, // Set background color as purpleAccent
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.tabColor,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Back navigation
                },
              ),
            ),
          ),
          Text1(
            text1: text,
            color: Colors.white,
            size: 17,
            fontWeight: FontWeight.bold, // Make the title stand out
          ),
          Text1(
            text1: text1,
            size: 16,
            color: Colors.grey, // Optional smaller text
          ),
        ],
      ),
    );
  }
}
