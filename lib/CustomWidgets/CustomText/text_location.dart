import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class TextLocation1 extends StatelessWidget {
  final String address;
  const TextLocation1({
    super.key,
    required this.address,
  });

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
          child: Text1(
            text1: address,
            size: 13,
          ),
        ),
      ],
    );
  }
}

class TextLocation2 extends StatelessWidget {
  final String address;
  const TextLocation2({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_pin,
          size: 20,
          color: AppColors.tabColor,
        ),
        const SizedBox(width: 4.0),
        Expanded(
          child: CustomTextEllipsis(
            text: address,
            size: 13,
          ),
        ),
      ],
    );
  }
}
