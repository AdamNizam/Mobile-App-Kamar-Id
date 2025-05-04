import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Screens/HistoryBookings/paid_bookings.dart';
import 'package:hotelbookingapp/Screens/HistoryBookings/processing_bookings.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

import 'cancelled_bookings.dart';
import 'completed_bookings.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 14),
            child: Column(
              children: [
                const SizedBox(height: 10),
                TabBar(
                  padding: EdgeInsets.zero,
                  indicatorColor: AppColors.buttonColor,
                  indicatorPadding: EdgeInsets.zero,
                  labelColor: AppColors.buttonColor,
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.buttonColor,
                  ),
                  unselectedLabelStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.cadetGray,
                  ),
                  tabs: const [
                    Tab(text: 'all'),
                    Tab(text: 'proses'),
                    Tab(text: 'paid'),
                    Tab(text: 'done'),
                    Tab(text: 'cancel'),
                  ],
                ),
                const SizedBox(height: 5),
                const Expanded(
                  child: TabBarView(
                    children: [
                      ProcessingBooking(),
                      ProcessingBooking(),
                      PaidBooking(),
                      CompletedBooking(),
                      CancelledBooking(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
