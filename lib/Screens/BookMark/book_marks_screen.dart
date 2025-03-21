import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/detailstext1.dart';
import '../../../Widgets/detailstext2.dart';
import '../../Models/hotel_model.dart';
import '../../Widgets/customapp_bar.dart';
import '../../Widgets/text11.dart';
import '../DetailHotel/details_screen.dart';

class BookMarkHotel extends StatefulWidget {
  const BookMarkHotel({super.key});

  @override
  BookMarkHotelState createState() => BookMarkHotelState();
}

class BookMarkHotelState extends State<BookMarkHotel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String selectedCategory = 'Music Night';

  final List<HotelModel> products = [
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
    HotelModel(
        imagePath: 'images/AdventureHotels.jpg',
        name: 'AdventureHotels',
        date: '4.5'),

    HotelModel(
        imagePath: 'images/CapsuleHotels.jpg',
        name: 'CapsuleHotels',
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
              const CustomAppBar(text: 'Bookmar', text1: ''),
              const SizedBox(height: 4),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 1.0, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCategoryChip('All'),
                    _buildCategoryChip('Recommended'),
                    _buildCategoryChip('Popular Luxuary'),
                  ],
                ),
              ),
              const SizedBox(height: 8),
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const HotelDetailsScreen()));
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
                                                    Icons.bookmark,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    final bool isSelected = selectedCategory == category;
    return ChoiceChip(
      label: Text(category),
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
      selectedColor: AppColors.tabColor,
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          selectedCategory = category;
        });
      },
    );
  }
}
