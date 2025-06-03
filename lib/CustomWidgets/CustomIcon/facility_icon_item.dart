import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/Shared/shared_methods.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class FacilityIconItem extends StatelessWidget {
  final String icon;
  final Color? color;
  final String title;
  const FacilityIconItem({
    super.key,
    required this.icon,
    this.color = AppColors.buttonColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.beauBlue,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            getIcon(icon),
            color: color,
          ),
          const SizedBox(width: 8),
          Text1(
            text1: title,
            size: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }
}
