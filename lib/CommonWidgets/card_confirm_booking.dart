import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Widgets/detailstext2.dart';

class CardConfirmaBooking extends StatelessWidget {
  const CardConfirmaBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 2,
          color: AppColors.beauBlue,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'images/LuxuryHotels.jpg', // Hotel image placeholder
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 17),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                  'Grand Hotel',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 2, top: 4),
                child: Text2(text2: 'Luxury Suite'), // Room type
              ),
              const SizedBox(height: 4),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 20,
                    color: AppColors.buttonColor,
                  ),
                  SizedBox(width: 3),
                  Text2(text2: '123 Main St, City Name'), // Hotel location
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
