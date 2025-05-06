import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class CustomAppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final int total;

  const CustomAppTopBar({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: const Icon(Icons.arrow_back),
      title: Text1(
        text1: title,
        size: 16,
        fontWeight: FontWeight.bold,
      ),
      actions: [
        IconButton(
          onPressed: () {
            showCustomSnackbar(context, 'Fitur is not available');
          },
          icon: Row(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 22,
              ),
              const SizedBox(width: 2),
              Text1(
                text1: total.toString(),
                color: iconColor,
                size: 14,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(width: 5),
            ],
          ),
        )
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: AppColors.bgColor,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.cadetGray,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
