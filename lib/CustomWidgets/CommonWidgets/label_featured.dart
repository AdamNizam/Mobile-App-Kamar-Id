import 'package:flutter/widgets.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class LabelFeatured extends StatelessWidget {
  const LabelFeatured({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: const BoxDecoration(
          color: AppColors.redAwesome,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: const Text1(
          text1: 'Featured',
          color: AppColors.white,
          size: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
