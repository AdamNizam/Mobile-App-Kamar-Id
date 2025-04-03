import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Widgets/detailstext1.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryCard({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(9.0),
          decoration: BoxDecoration(
            color: AppColors.tabColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(
            icon,
            color: AppColors.white,
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
