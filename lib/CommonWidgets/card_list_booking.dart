import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:hotelbookingapp/Widgets/detailstext2.dart';

class CardListBooking extends StatelessWidget {
  const CardListBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 2,
          color: AppColors.beauBlue,
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text2(text2: 'Check-In'),
                Text1(
                    text1:
                        'August 24, 2024 | 3:00 PM'), // Check-in date and time
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text2(text2: 'Check-Out'),
                Text1(
                    text1:
                        'August 27, 2024 | 12:00 PM'), // Check-out date and time
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text2(text2: 'Room Type'),
                Text1(text1: 'Luxury Suite'), // Room type
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text2(text2: 'Guests'),
                Text1(text1: '2 Adults'), // Number of guests
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text2(text2: 'Price per Night'),
                Text1(text1: '\$150.00'), // Price per night
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text2(text2: 'Total Amount'),
                Text1(text1: '\$450.00'), // Total amount (for 3 nights)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
