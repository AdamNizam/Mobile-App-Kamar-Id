import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CommonWidgets/card_confirm_booking.dart';
import 'package:hotelbookingapp/CommonWidgets/card_list_booking.dart';
import 'package:hotelbookingapp/Screens/Booking/booking_successfully.dart';

import '../../../Widgets/custombtn.dart';
import '../../Widgets/customapp_bar.dart';

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
              const CustomAppBar(text: 'Booking Summary', text1: ''),
              const SizedBox(height: 23),
              const CardConfirmaBooking(),
              const SizedBox(height: 16),
              const CardListBooking(),
              const SizedBox(height: 10),
              CustomButton(
                text: 'Confirm Booking',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BookingSuccessFully()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
