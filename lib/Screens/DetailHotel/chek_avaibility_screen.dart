import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/Booking/booking_summary.dart';
import 'package:hotelbookingapp/Screens/DetailHotel/card_avaibility.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';

class CheckAvailabilityScreen extends StatelessWidget {
  const CheckAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView(
                  children: const [
                    CardAvailbility(),
                    CardAvailbility(),
                    CardAvailbility(),
                    CardAvailbility(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomButton(
          text: 'Continue',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ReviewSummary(),
              ),
            );
          },
        ),
      ),
    );
  }
}
