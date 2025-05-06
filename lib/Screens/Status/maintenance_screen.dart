import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTextEllipsis(
              text: 'Maintenance',
              size: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.cadetGray,
            ),
            SvgPicture.asset(
              'images/Maintenance.svg',
              semanticsLabel: 'Acme Logo',
              width: 350,
              height: 300,
              fit: BoxFit.contain,
            ),
            const Text1(
              text1: 'Feature dalam tahap pengembangan.',
              size: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
