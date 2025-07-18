import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

import '../CustomText/text2.dart';

class CustomAppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onPop;
  final VoidCallback onTap;
  final IconData? icon;

  const CustomAppTopBar({
    super.key,
    required this.title,
    required this.onPop,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.buttonColor,
      foregroundColor: AppColors.white,
      leading: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
            size: 24,
          ),
          onPressed: onPop,
        ),
      ),
      title: Text2(
        text2: title,
        size: 18,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
      actions: [
        IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: AppColors.white,
            size: 22,
          ),
        )
      ],
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
