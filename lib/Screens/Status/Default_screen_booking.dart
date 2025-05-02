import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

class NoDataBooking extends StatelessWidget {
  const NoDataBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            'images/empty_history.svg',
            height: 200,
          ),
          Text(
            "There is not booking info.",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.cadetGray,
            ),
          ),
        ],
      ),
    );
  }
}
