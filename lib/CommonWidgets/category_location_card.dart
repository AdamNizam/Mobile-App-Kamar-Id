import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

import '../Widgets/detailstext1.dart';

class CategoryLocationCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryLocationCard(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.buttonColor, // Warna border
              width: 1, // Ketebalan border
            ),
          ),
          child: Icon(
            icon,
            color: AppColors.buttonColor,
            size: 25,
          ),
        ),
        const SizedBox(height: 8.0),
        Center(
          child: Text1(
            text1: title,
            size: 12,
          ),
        ),
      ],
    );
  }
}
