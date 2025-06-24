import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Shared/shared_methods.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

import '../CustomText/text1.dart';

class CategoryLocationCard extends StatelessWidget {
  final String? icon;
  final String title;

  const CategoryLocationCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (icon != null)
          Container(
            padding: const EdgeInsets.all(15.0),
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.beauBlue,
                width: 2,
              ),
            ),
            child: Icon(
              getIcon(icon!),
              color: AppColors.buttonColor,
              size: 25,
            ),
          ),
        const SizedBox(height: 8.0),
        Center(
          child: Text1(
            text1: title,
            size: 12,
          ),
        ),
      ],
    );
  }
}
