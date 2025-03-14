import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

import 'cancelledbooking.dart';
import 'completed_bookings.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TabBar(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        labelColor: AppColors.tabColor,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.tabColor,
        ), // Ukuran teks aktif
        unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400), // Ukuran teks tidak aktif
        tabs: const [
          Tab(text: 'Completed'),
          Tab(text: 'Cancelled'),
        ],
      ),
    );
  }
}
