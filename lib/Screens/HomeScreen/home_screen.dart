import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Models/hotel_model.dart';

import '../../../../CommonWidgets/address_widget.dart';
import '../../../../CommonWidgets/categories_widget.dart';
import '../../../../CommonWidgets/home_widget.dart';
import '../../../../Constants/colors.dart';
import '../../../../Widgets/detailstext1.dart';
import '../../../../Widgets/detailstext2.dart';
import '../../../../Widgets/text11.dart';
import '../../../CommonWidgets/eventscard.dart';
import '../../../Widgets/drawer_widget.dart';
import '../../CommonWidgets/search_widget.dart';
import '../Categories/all_categories.dart';
import '../Notifications/notifications.dart';
import 'details_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HomeWidgte(),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text2(
                                      text2: 'Your Location',
                                      color: Colors.white,
                                    ),
                                    AddressWidget(),
                                  ],
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BookingNotifications()),
                                    );
                                  },
                                  child: Container(
                                    height: 42,
                                    width: 42,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.notification_important_rounded,
                                      color: AppColors.buttonColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const SearchWidget(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllCategoriesScreen()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text1(text1: 'Categories', size: 18),
                      Text11(
                        text2: 'See All',
                        color: AppColors.tabColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 9),
                const CategoriesWidget(),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllCategoriesScreen()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text1(text1: 'Available Services', size: 18),
                      Text11(
                        text2: 'See All',
                        color: AppColors.tabColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      EventsCard(
                        imageUrl: 'images/AdventureHotels.jpg',
                        title: 'AdventureHotels',
                        location: 'USA 22 Street',
                        date: '3.4',
                        price: '\$35.00',
                      ),
                      SizedBox(width: 16.0),
                      EventsCard(
                        imageUrl: 'images/AirportHotels.jpg',
                        title: 'AirportHotels',
                        location: 'USA 22 Street',
                        date: '3.4',
                        price: '\$30.00',
                      ),
                      SizedBox(width: 16.0),
                      EventsCard(
                        imageUrl: 'images/All-InclusiveHotels.jpg',
                        title: 'InclusiveHotels',
                        location: 'USA 22 Street',
                        date: '3.4',
                        price: '\$30.00',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text1(
                  text1: 'Services Available This Month',
                  size: 18,
                ),
                const SizedBox(height: 10.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
