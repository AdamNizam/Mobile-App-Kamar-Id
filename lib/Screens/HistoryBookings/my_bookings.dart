import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/HistoryBookings/paid_bookings.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

import 'cancelled_bookings.dart';
import 'completed_bookings.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 6,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              children: [
                SizedBox(height: 20),
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: AppColors.buttonColor,
                  labelPadding: EdgeInsets.symmetric(horizontal: 16),
                  labelColor: AppColors.buttonColor,
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.buttonColor,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.cadetGray,
                  ),
                  tabs: [
                    Tab(text: 'All booking'),
                    Tab(text: 'Proses'),
                    Tab(text: 'Paid'),
                    Tab(text: 'Completed'),
                    Tab(text: 'Cancel'),
                    Tab(text: 'Refund'),
                  ],
                ),
                SizedBox(height: 5),
                Expanded(
                  child: TabBarView(
                    children: [
                      CompletedBooking(),
                      CompletedBooking(),
                      PaidBooking(),
                      CompletedBooking(),
                      CancelledBooking(),
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
