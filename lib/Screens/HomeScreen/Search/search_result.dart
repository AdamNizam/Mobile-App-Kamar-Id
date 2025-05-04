import 'package:flutter/material.dart';

import '../../../CustomWidgets/customapp_bar.dart';
import '../../../CustomWidgets/customtextfield.dart';
import '../../../CustomWidgets/CustomText/detailstext1.dart';
import '../../../CustomWidgets/CustomText/detailstext2.dart';
import '../../../CustomWidgets/text11.dart';
import '../../../Models/hotel_model.dart';
import '../../../Themes/colors.dart';
import '../../DetailHotel/hotel_details_screen.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(text: 'Search Results', text1: ''),
                const SizedBox(height: 10),
                const CustomTextField(
                  label: 'Search for Events',
                  icon: Icons.search,
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    FilterTab(text: 'Filter', image: 'images/filter.png'),
                    FilterTab(text: 'Price', image: 'images/arrow.png'),
                    FilterTab(text: 'Category', image: 'images/arrow.png'),
                  ],
                ),
                const SizedBox(height: 10),
                const Text1(text1: '1,240 Events found', size: 18),
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HotelDetailsScreen(),
                            ));
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
                                                    Icons.favorite_outline,
                                                    color: Colors.red,
                                                    size: 20),
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
      ),
    );
  }
}

class FilterTab extends StatelessWidget {
  final String text;
  final String image;
  const FilterTab({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add your onTap action here
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Text(text),
            const SizedBox(width: 5),
            Image.asset(image),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String price;
  final String name;
  final String category;
  final bool isFeatured;

  const ProductCard({
    super.key,
    required this.image,
    required this.price,
    required this.name,
    required this.category,
    this.isFeatured = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  height: 140,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              if (isFeatured)
                Positioned(
                  top: 7,
                  left: 7,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    child: const Text1(
                      text1: 'Featured',
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text2(text2: category),
                      const Spacer(),
                      const Icon(
                        Icons.favorite_border,
                        size: 20,
                        color: AppColors.buttonColor,
                      ),
                    ],
                  ),
                  Text1(
                    text1: price,
                    color: AppColors.buttonColor,
                    size: 18,
                  ),
                  Text1(text1: name),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 19,
                        color: AppColors.buttonColor,
                      ),
                      Icon(
                        Icons.star,
                        size: 19,
                        color: AppColors.buttonColor,
                      ),
                      Icon(
                        Icons.star,
                        size: 19,
                        color: AppColors.buttonColor,
                      ),
                      Icon(
                        Icons.star,
                        size: 19,
                        color: AppColors.buttonColor,
                      ),
                      Icon(
                        Icons.star_border,
                        size: 19,
                        color: AppColors.buttonColor,
                      ),
                      SizedBox(width: 4.0),
                      Text2(text2: '4.5'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
