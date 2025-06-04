import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.location_on,
          color: AppColors.white,
          size: 25,
        ),
        SizedBox(
          width: 3,
        ),
        Text1(
          text1: 'Kuta Mandlika ,NTB',
          size: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
      ],
    );
  }
}
