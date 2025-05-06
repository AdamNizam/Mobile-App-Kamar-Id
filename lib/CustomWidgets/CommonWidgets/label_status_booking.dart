import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';

class LabelStatusBooking extends StatelessWidget {
  final IconData icon;
  final String status;
  final Color color;
  const LabelStatusBooking({
    super.key,
    required this.icon,
    required this.status,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 18,
          ),
          const SizedBox(width: 6),
          Text1(
            text1: status,
            color: color,
            size: 14,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
