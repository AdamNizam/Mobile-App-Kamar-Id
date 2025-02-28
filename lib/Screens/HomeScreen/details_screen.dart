import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:hotelbookingapp/Widgets/detailstext2.dart';
import '../../Constants/colors.dart';
import '../Booking/book_hotel.dart';

class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel Image
          Stack(
            children: [
              Image.asset(
                'images/LuxuryHotels.jpg',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hotel Name and Favorite Icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text1(
                          text1: 'Luxury Hotel Resort',
                          size: 17,
                        ),
                        Icon(Icons.favorite_border, color: Colors.red, size: 30),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Location
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 20, color: AppColors.tabColor),
                        SizedBox(width: 8),
                        Text2(
                          text2: 'Paris, France',
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Rating Bar and Price per Night
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingBar.readOnly(
                          initialRating: 4.8,
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          filledColor: AppColors.tabColor,
                          size: 28,
                        ),
                        Text(
                          '\$150.00/night',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.buttonColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Description
                    Text1(
                      text1: 'Hotel Description',
                      size: 17,
                    ),
                    SizedBox(height: 10),
                    Text2(
                      text2: 'Enjoy an unforgettable stay at our luxury hotel, located in the heart of Paris. Our resort offers world-class amenities, including a rooftop pool, fine dining, and spacious rooms with stunning city views. Whether traveling for business or leisure, our hotel is the perfect destination.',
                    ),
                    SizedBox(height: 10),

                    // Hotel Amenities
                    Text(
                      'Key Amenities:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '• Rooftop Pool\n'
                          '• Fine Dining Restaurant\n'
                          '• Spa & Wellness Center\n'
                          '• Free Wi-Fi\n'
                          '• 24/7 Room Service',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomButton(
              text: 'Book Now',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BookHotelScreen(),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
