import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

class CustomNavTitle extends StatelessWidget {
  final String title;
  const CustomNavTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          // Tombol kembali
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.white,
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.tabColor,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          // Title berada di tengah
          Expanded(
            child: Center(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
