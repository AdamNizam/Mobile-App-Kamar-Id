import 'package:flutter/material.dart';

import '../../../CustomWidgets/CustomText/text1.dart';
import '../../../CustomWidgets/CustomText/text11.dart';
import '../../../CustomWidgets/CustomText/text2.dart';
import '../../../Models/hotel_model.dart';
import '../../../Themes/colors.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final List<HotelModel> products = [
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text1(text1: '1,240 Events found', size: 18),
              const SizedBox(height: 10),
              // Gunakan Expanded agar ListView bisa mengambil sisa tinggi layar dan bisa di-scroll
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
                                              const Icon(Icons.favorite_outline,
                                                  color: Colors.red, size: 20),
                                            ],
                                          ),
                                          const SizedBox(height: 5.0),
                                          const Row(
                                            children: [
                                              Icon(Icons.location_pin,
                                                  size: 23.0,
                                                  color: AppColors.tabColor),
                                              SizedBox(width: 4.0),
                                              Text2(text2: 'UK 32 Street'),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  Icon(Icons.star,
                                                      size: 20.0,
                                                      color:
                                                          AppColors.tabColor),
                                                  Icon(Icons.star,
                                                      size: 20.0,
                                                      color:
                                                          AppColors.tabColor),
                                                  Icon(Icons.star,
                                                      size: 20.0,
                                                      color:
                                                          AppColors.tabColor),
                                                ],
                                              ),
                                              SizedBox(width: 4.0),
                                              Text2(text2: '4.5'),
                                            ],
                                          ),
                                          const SizedBox(height: 5.0),
                                          const Row(
                                            children: [
                                              Text11(
                                                  text2: '10% Off',
                                                  color: AppColors.tabColor),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  Text1(
                                                      text1: '\$12.00',
                                                      size: 18,
                                                      color:
                                                          AppColors.tabColor),
                                                  Text2(text2: '/night'),
                                                ],
                                              ),
                                            ],
                                          ),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
