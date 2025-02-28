import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/Booking/book_hotel.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/custom_outline_button.dart';
import '../../../Widgets/detailstext1.dart';
import '../../../Widgets/detailstext2.dart';
import '../../Models/hotel_model.dart';
import '../../Widgets/text11.dart';

class CancelledBooking extends StatefulWidget {
  const CancelledBooking({super.key});

  @override
  State<CancelledBooking> createState() => _CancelledBookingState();
}

class _CancelledBookingState extends State<CancelledBooking> {
  final List<HotelModel> products = [
    HotelModel(
        imagePath: 'images/AdventureHotels.jpg',
        name: 'AdventureHotels',
        date: '4.5'),

    HotelModel(
        imagePath: 'images/AirportHotels.jpg',
        name: 'AirportHotels',
        date: '4.5'),
    HotelModel(
        imagePath: 'images/All-InclusiveHotels.jpg',
        name: 'InclusiveHotels',
        date: '4.5'),
    HotelModel(
        imagePath: 'images/BoutiqueHotels.jpg',
        name: 'BoutiqueHotels',
        date: '4.5'),
    HotelModel(
        imagePath: 'images/WaterfrontHotels.jpg',
        name: 'WaterfrontHotels',
        date: '4.5'),
    HotelModel(
        imagePath: 'images/BudgetHotels.jpg',
        name: 'BudgetHotels',
        date: '4.5'),
    HotelModel(
        imagePath: 'images/BusinessHotels.jpg',
        name: 'BusinessHotels',
        date: '4.5'),
    HotelModel(
        imagePath: 'images/CapsuleHotels.jpg',
        name: 'CapsuleHotels',
        date: '4.5'),
    HotelModel(
        imagePath: 'images/Eco-FriendlyHotels.jpg',
        name: 'FriendlyHotels',
        date: '4.5'),
    HotelModel(
        imagePath: 'images/HeritageHotels.jpg',
        name: 'HeritageHotels',
        date: '4.5'),
    HotelModel(
        imagePath: 'images/Historic Hotels.jpg',
        name: 'Historic Hotels',
        date: '4.5'),
    HotelModel(
        imagePath: 'images/LuxuryHotels.jpg',
        name: 'LuxuryHotels',
        date: '4.5'),

    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  products[index].imagePath,
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 90,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 12, top: 4, bottom: 4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text1(
                                            text1: products[index].name,
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.favorite_border,
                                            color: Colors.red,
                                            size: 20,
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.location_pin,
                                            size: 23.0,
                                            color: AppColors.tabColor,
                                          ),
                                          SizedBox(width: 4.0),
                                          Text2(
                                            text2: 'UK 32 Street',
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 20.0,
                                                color: AppColors.tabColor,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 20.0,
                                                color: AppColors.tabColor,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 20.0,
                                                color: AppColors.tabColor,
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 4.0),
                                          Text2(
                                            text2: '4.5',
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      const Row(
                                        children: [
                                          Text11(
                                            text2: '10% Off',
                                            color: AppColors.tabColor,
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              Text1(
                                                text1: '\$12.00',
                                                size: 18,
                                                color: AppColors.tabColor,
                                              ),
                                              Text2(text2: '/night')
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: CustomOutlinedButton(
                                text: 'Re-Book',
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const BookHotelScreen()));
                                },
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReusColumn extends StatelessWidget {
  final String text1, text2;
  const ReusColumn({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text2(text2: text1),
        const SizedBox(
          height: 2,
        ),
        Text1(
          text1: text2,
        )
      ],
    );
  }
}
