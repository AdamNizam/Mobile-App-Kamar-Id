import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

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
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
            size: 24,
          ),
          onPressed: onPop,
        ),
      ),
      title: Text1(
        text1: title,
        size: 18,
        fontWeight: FontWeight.bold,
      ),
      actions: [
        IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: AppColors.black,
            size: 22,
          ),
        )
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.black,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
