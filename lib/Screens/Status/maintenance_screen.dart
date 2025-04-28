import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Maintenance',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.cadetGray,
              ),
            ),
            SvgPicture.asset(
              'images/Maintenance.svg',
              semanticsLabel: 'Acme Logo',
              width: 350,
              height: 300,
              fit: BoxFit.contain,
            ),
            Text(
              'Feature dalam tahap pengembangan \noleh team kami.',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.cadetGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
