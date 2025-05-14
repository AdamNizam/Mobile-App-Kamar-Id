import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/Screens/HistoryBookings/paid_bookings.dart';
import 'package:hotelbookingapp/Screens/HistoryBookings/processing_bookings.dart';
import 'package:hotelbookingapp/Screens/Status/maintenance_screen.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

import 'cancelled_bookings.dart';
import 'completed_bookings.dart';

class MyBookingsScreen extends StatelessWidget {
  final VoidCallback? onBack;
  const MyBookingsScreen({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: CustomAppTopBar(
          title: 'History Booking',
          icon: Icons.more_vert,
          onPop: () {
            if (onBack != null) {
              onBack!();
            }
          },
          onTap: () {
            showCustomSnackbar(context, 'fitur is not avaibale');
          },
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
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
                      ProcessingBooking(),
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
