import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class StatusPayment extends StatelessWidget {
  final String status;

  const StatusPayment({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final lowerStatus = status.toLowerCase();

    Color statusColor;
    IconData statusIcon;

    switch (lowerStatus) {
      case 'success':
      case 'settlement':
        statusColor = AppColors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'expire':
      case 'failure':
      case 'cancel':
        statusColor = AppColors.redAwesome;
        statusIcon = Icons.cancel;
        break;
      case 'pending':
      default:
        statusColor = AppColors.cadetGray;
        statusIcon = Icons.pending;
    }

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cadetGray.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.cadetGray.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(statusIcon, color: statusColor, size: 20),
          const SizedBox(width: 8),
          Text(
            lowerStatus[0].toUpperCase() + lowerStatus.substring(1),
            style: GoogleFonts.poppins(
              color: statusColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
