import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class CustomAppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final int? total;

  const CustomAppTopBar({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    this.total = 0,
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
            color: AppColors.tabColor,
            size: 24,
          ),
          onPressed: () {
            showCustomSnackbar(context, 'Fitur is not available');
          },
        ),
      ),
      title: Text1(
        text1: title,
        size: 18,
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
              if (total != 0)
                CustomTextEllipsis(
                  text: total.toString(),
                  color: iconColor,
                  size: 13,
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
