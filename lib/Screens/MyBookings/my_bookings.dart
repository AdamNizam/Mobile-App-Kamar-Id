import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/MyBookings/upcoming.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/detailstext1.dart';
import 'cancelledbooking.dart';
import 'completed_bookings.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TabBar(
                controller: _tabController,
                indicator: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.bgColor,
                      width: 2.0,
                    ),
                  ),
                ),
                tabs: [
                  Tab(
                    child: Container(
                      height: 40,
                      width: 170,
                      decoration: BoxDecoration(
                        color: _tabController.index == 0
                            ? AppColors.tabColor
                            : const Color(0xff8C8C8C),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: const Center(
                        child: Text1(
                          text1: 'Upcoming',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 40,
                      width: 170,
                      decoration: BoxDecoration(
                        color: _tabController.index == 1
                            ? AppColors.tabColor
                            : const Color(0xff8C8C8C),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Center(
                        child: Text1(
                          text1: 'Completed',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 40,
                      width: 170,
                      decoration: BoxDecoration(
                        color: _tabController.index == 2
                            ? AppColors.tabColor
                            : const Color(0xff8C8C8C),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Center(
                        child: Text1(
                          text1: 'Cancelled',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    UpcomingBooking(),
                    CompletedBooking(),
                    CancelledBooking(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
