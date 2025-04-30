import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/HistoryBookings/my_bookings.dart';

import '../../Constants/colors.dart';
import '../../Widgets/custom_outline_button.dart';
import '../../Widgets/custombtn.dart';
import '../../Widgets/detailstext1.dart';
import '../../Widgets/detailstext2.dart';
import 'hotel_ereceipt.dart';

class BookingSuccessFully extends StatelessWidget {
  const BookingSuccessFully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(''),
              const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: AppColors.buttonColor,
                      child: Icon(Icons.check, color: Colors.white, size: 70),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text1(
                        text1: 'Congratulations!',
                        size: 30,
                      ),
                    ),
                    Text2(text2: 'Your Hotel Booking is Confirmed'),
                    Center(
                        child: Text2(
                            text2:
                                'You can check your booking in the Profile section')),
                  ],
                ),
              ),
              Column(
                children: [
                  CustomButton(
                    text: 'View Receipt',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HotelBookingReceipt()));
                    },
                  ),
                  CustomOutlinedButton(
                    text: 'View My Bookings',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MyBookingsScreen()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
