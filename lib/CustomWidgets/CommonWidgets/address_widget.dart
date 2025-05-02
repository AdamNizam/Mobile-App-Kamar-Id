import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: AppColors.white,
          size: 25,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          'Kuta Mandlika ,NTB',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
