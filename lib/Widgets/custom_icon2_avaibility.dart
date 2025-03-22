import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

class CustomIcon2Avaibility extends StatelessWidget {
  final IconData icon;
  const CustomIcon2Avaibility({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: AppColors.strokColor,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: 16,
            color: AppColors.lightBlue,
          ),
        ),
      ],
    );
  }
}
