import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/Screens/HistoryBookings/paid_bookings.dart';
import 'package:hotelbookingapp/Screens/Status/maintenance_screen.dart';
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
        appBar: CustomAppTopBar(
          title: 'History Booking',
          icon: Icons.history,
          iconColor: AppColors.buttonColor,
          total: 1,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: AppColors.buttonColor,
                  labelPadding: EdgeInsets.symmetric(horizontal: 16),
                  labelColor: AppColors.buttonColor,
                  labelStyle: TextStyle(
                    fontSize: 14,
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
                      MaintenanceScreen(),
                      CompletedBooking(),
                      PaidBooking(),
                      CompletedBooking(),
                      CancelledBooking(),
                      MaintenanceScreen(),
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
