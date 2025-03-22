import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

import '../Widgets/detailstext1.dart';

class CategoryLocationCard extends StatelessWidget {
  final String icon;
  final String title;

  const CategoryLocationCard({
    super.key,
    required this.icon,
    required this.title,
  });

  IconData getIcon(String iconClass) {
    switch (iconClass) {
      case 'fa fa-hospital-o':
        return FontAwesomeIcons.hospital;
      case 'fa fa-subway':
        return FontAwesomeIcons.subway;
      case 'icofont-education':
        return FontAwesomeIcons.book; // ganti dengan icon yang mirip
      default:
        return Icons.error; // icon default kalau ga cocok
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.lightBlue,
              width: 1,
            ),
          ),
          child: FaIcon(
            getIcon(icon), // Pakai fungsi konversi
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
