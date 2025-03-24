import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

class CustomIcon1Avaibility extends StatelessWidget {
  final IconData icon;
  final String name;
  const CustomIcon1Avaibility({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
          margin: const EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.amber,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: 16,
            color: AppColors.button2Color,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Center(
          child: Text(
            name,
            style: const TextStyle(
              color: AppColors.tabColor,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
