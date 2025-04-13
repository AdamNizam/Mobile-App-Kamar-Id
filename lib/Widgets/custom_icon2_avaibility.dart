import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Models/ResponseResultModel/result_check_avaibility.dart';
import 'package:hotelbookingapp/Shared/custom_methods.dart';

class CustomIcon2Avaibility extends StatelessWidget {
  final TermFeature data;
  const CustomIcon2Avaibility({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    IconData icon = getIcon(data.icon ?? 'default_icon');

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: AppColors.strokColor,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: AppColors.cadetGray,
            size: 12,
          ),
        ),
      ],
    );
  }
}
