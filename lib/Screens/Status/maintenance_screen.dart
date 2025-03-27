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
            SvgPicture.asset(
              'images/No data-bro.svg',
              semanticsLabel: 'Acme Logo',
              width: 350,
              height: 300,
              fit: BoxFit.contain,
            ),
            Text(
              'features under development',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.cadetGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
