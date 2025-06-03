import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class TextLocation extends StatelessWidget {
  final String locationText;
  final double sizeText;
  final bool cutText;
  const TextLocation(
      {super.key,
      required this.locationText,
      this.sizeText = 13,
      this.cutText = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.location_on,
          size: 20,
          color: AppColors.buttonColor,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: cutText
              ? CustomTextEllipsis(
                  text: locationText,
                  size: sizeText,
                )
              : Text1(
                  text1: locationText,
                  size: sizeText,
                ),
        ),
      ],
    );
  }
}
