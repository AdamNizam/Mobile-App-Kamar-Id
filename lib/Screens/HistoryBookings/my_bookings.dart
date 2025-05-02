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
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            child: Column(
              children: [
                const SizedBox(height: 10),
                _buildTabBar(),
                const SizedBox(height: 5),
                const Expanded(
                  child: TabBarView(
                    children: [
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

  Widget _buildTabBar() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.beauBlue,
        ),
      ),
      child: TabBar(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        labelColor: AppColors.buttonColor,
        labelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.buttonColor,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.cadetGray,
        ),
        tabs: const [
          Tab(text: 'Proces'),
          Tab(text: 'Paid'),
          Tab(text: 'Completed'),
          Tab(text: 'Cancel'),
        ],
      ),
    );
  }
}
