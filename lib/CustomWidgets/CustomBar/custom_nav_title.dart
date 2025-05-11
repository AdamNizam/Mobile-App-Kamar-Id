import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class CustomNavTitle extends StatelessWidget {
  final String title;
  final Color color;
  const CustomNavTitle({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          // Tombol kembali
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.white,
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.tabColor,
                  size: 18,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          // Title berada di tengah
          Expanded(
            child: Center(
              child: CustomTextEllipsis(
                text: title,
                color: color,
                size: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
