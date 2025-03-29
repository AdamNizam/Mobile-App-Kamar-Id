import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/CommonWidgets/card_confirm_booking.dart';
import 'package:hotelbookingapp/CommonWidgets/card_list_booking.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Screens/Booking/booking_successfully.dart';

import '../../../Widgets/custombtn.dart';

class ConfirmBookingScreen extends StatefulWidget {
  const ConfirmBookingScreen({super.key});

  @override
  State<ConfirmBookingScreen> createState() => _ConfirmBookingScreenState();
}

class _ConfirmBookingScreenState extends State<ConfirmBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
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
                  const SizedBox(width: 50),
                  Text(
                    'Confirmation Hotel',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ), // Make the title stand out
                  ),
                ],
              ),
              const SizedBox(height: 23),
              const CardConfirmaBooking(),
              const SizedBox(height: 16),
              const CardListBooking(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(14),
        child: CustomButton(
          text: 'Pay Now',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BookingSuccessFully()));
          },
        ),
      ),
    );
  }
}
