import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Screens/HistoryBookings/processing_bookings.dart';

import 'cancelled_bookings.dart';
import 'completed_bookings.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
            child: Column(
              children: [
                const SizedBox(height: 10),
                _buildTabBar(),
                const SizedBox(height: 5),
                const Expanded(
                  child: TabBarView(
                    children: [
                      ProcessingBooking(),
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
        border: Border.all(color: AppColors.beauBlue),
      ),
      child: TabBar(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        labelColor: AppColors.buttonColor,
        labelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: AppColors.buttonColor,
        ), // Ukuran teks aktif
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        tabs: const [
          Tab(text: 'Processing'),
          Tab(text: 'Completed'),
          Tab(text: 'Cancelled'),
        ],
      ),
    );
  }
}
