import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class BookingDetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const BookingDetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: AppColors.black,
          ),
          const SizedBox(width: 8),
          Text1(
            text1: '$label:',
            size: 14,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text1(
              text1: value,
              size: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.cadetGray,
            ),
          ),
        ],
      ),
    );
  }
}
