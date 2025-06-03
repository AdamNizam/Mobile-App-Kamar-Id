import 'package:flutter/widgets.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class TextPrice extends StatelessWidget {
  final String price;
  const TextPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.lightBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text1(
        text1: price,
        size: 13,
        color: AppColors.lightBlue,
      ),
    );
  }
}
