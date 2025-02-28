import 'package:flutter/material.dart';
import '../../../../Constants/colors.dart';
import '../../../../Widgets/detailstext1.dart';
import '../../../../Widgets/detailstext2.dart';
import '../../../Widgets/custombtn.dart';
import '../../../Widgets/text11.dart';
import '../../Widgets/customapp_bar.dart';
import 'booking_successfully.dart';

class ReviewSummary extends StatelessWidget {
  const ReviewSummary({super.key});

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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'images/LuxuryHotels.jpg', // Hotel image placeholder
                          width: 75,
                          height: 75,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 17),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text1(text1: 'Grand Hotel'), // Hotel name
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2, top: 4),
                          child: Text2(text2: 'Luxury Suite'), // Room type
                        ),
                        SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 20,
                              color: AppColors.buttonColor,
                            ),
                            SizedBox(width: 3),
                            Text2(text2: '123 Main St, City Name'), // Hotel location
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
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
                          Text1(text1: 'August 24, 2024 | 3:00 PM'), // Check-in date and time
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text2(text2: 'Check-Out'),
                          Text1(text1: 'August 27, 2024 | 12:00 PM'), // Check-out date and time
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
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.payment, color: AppColors.buttonColor, size: 20),
                  SizedBox(width: 5),
                  Text2(text2: 'Credit Card'),
                  Spacer(),
                  Text11(text2: 'Change', color: AppColors.buttonColor),
                ],
              ),
              const Spacer(),
              CustomButton(
                text: 'Confirm Booking',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BookingSuccessFully()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
