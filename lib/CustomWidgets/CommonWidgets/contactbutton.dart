import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../text11.dart';

class ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const ContactButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.tabColor,
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text11(text2: label),
      ],
    );
  }
}
