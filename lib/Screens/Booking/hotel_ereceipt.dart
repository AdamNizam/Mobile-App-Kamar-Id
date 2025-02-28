import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/Booking/get_directtion.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/custombtn.dart';
import '../../../Widgets/detailstext1.dart';
import '../../../Widgets/detailstext2.dart';
import '../../Models/hotel_model.dart';
import '../../Widgets/customapp_bar.dart';
import '../../Widgets/text11.dart';

class HotelBookingReceipt extends StatefulWidget {
  const HotelBookingReceipt({super.key});

  @override
  HotelBookingReceiptState createState() => HotelBookingReceiptState();
}

class HotelBookingReceiptState extends State<HotelBookingReceipt>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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

    // Add more products as needed
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(text: 'Hotel Booking Receipt', text1: ''),
              const SizedBox(height: 20),
              Expanded(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) =>  const ServiceDetailsScreen()));
                            },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                        color:
                                                            AppColors.tabColor,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        size: 20.0,
                                                        color:
                                                            AppColors.tabColor,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        size: 20.0,
                                                        color:
                                                            AppColors.tabColor,
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
                                                        color:
                                                            AppColors.tabColor,
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
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 7),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text2(text2: 'Booking Date'),
                  Text1(text1: 'Sep 18, 2023 | 10:00 AM'),
                ],
              ),
              const SizedBox(height: 7),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text2(text2: 'Promo Code'),
                  Text1(text1: 'HOTEL2023'),
                ],
              ),
              const SizedBox(height: 7),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text2(text2: 'Room Type'),
                  Text1(text1: 'Deluxe Suite'),
                ],
              ),
              const SizedBox(height: 7),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text2(text2: 'Payment Method'),
                  Text1(text1: 'Credit Card'),
                ],
              ),
              const SizedBox(height: 7),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text2(text2: 'Hotel Address'),
                  Text1(text1: '123 Main Street, New York'),
                ],
              ),
              const SizedBox(height: 7),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text2(text2: 'Stay Duration'),
                  Text1(text1: '3 nights'),
                ],
              ),
              const SizedBox(height: 7),
// Additional Rows
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text2(text2: 'Number of Guests'),
                  Text1(text1: '2 Adults'),
                ],
              ),
              const SizedBox(height: 7),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text2(text2: 'Breakfast Included'),
                  Text1(text1: 'Yes'),
                ],
              ),
              const SizedBox(height: 7),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text2(text2: 'Total Cost'),
                  Text1(text1: '\$850.00'),
                ],
              ),
              const SizedBox(height: 7),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text2(text2: 'Cancellation Policy'),
                  Text1(text1: 'Free until Sep 15, 2023'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
        child: CustomButton(
          text: 'View Booking Details',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const GetDirectionScreen()));
          },
        ),
      ),
    );
  }
}
