import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext2.dart';
import 'package:hotelbookingapp/CustomWidgets/Shimmers/shimmer_card.dart';
import 'package:hotelbookingapp/CustomWidgets/Shimmers/shimmer_list.dart';
import 'package:hotelbookingapp/Models/hotel_model.dart';
import 'package:hotelbookingapp/Screens/HomeScreen/hotels_card1.dart';
import 'package:hotelbookingapp/Screens/HomeScreen/hotels_card2.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';

import '../../CustomWidgets/CommonWidgets/address_widget.dart';
import '../../CustomWidgets/CommonWidgets/categories_widget.dart';
import '../../CustomWidgets/CommonWidgets/drawer_widget.dart';
import '../../CustomWidgets/CommonWidgets/home_widget.dart';
import '../../CustomWidgets/CommonWidgets/search_widget.dart';
import '../../CustomWidgets/CustomText/detailstext1.dart';
import '../../CustomWidgets/CustomText/text11.dart';
import '../../Themes/colors.dart';
import '../Categories/all_categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int totalNotification = 0;

  final List<HotelModel> products = [
    HotelModel(
        imagePath: 'images/AdventureHotels.jpg',
        name: 'AdventureHotels',
        date: '4.5'),
    HotelModel(
        imagePath: 'images/CapsuleHotels.jpg',
        name: 'CapsuleHotels',
        date: '4.5'),
    HotelModel(
        imagePath: 'images/CapsuleHotels.jpg',
        name: 'CapsuleHotels',
        date: '4.5'),
    HotelModel(
        imagePath: 'images/CapsuleHotels.jpg',
        name: 'CapsuleHotels',
        date: '4.5'),
    HotelModel(
        imagePath: 'images/CapsuleHotels.jpg',
        name: 'CapsuleHotels',
        date: '4.5'),
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
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeWidgte(),
                      SizedBox(height: 6),
                      AddressWidget(),
                      SizedBox(height: 10),
                      SearchWidget(),
                      SizedBox(height: 6),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const AllCategoriesScreen()),
                    );
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
                const SizedBox(height: 16),
                _homeAllHotel()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _resultSearchHotel() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text1(text1: products[index].name),
                                  const Spacer(),
                                  const Icon(Icons.favorite_outline,
                                      color: Colors.red, size: 20),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              const Row(
                                children: [
                                  Icon(Icons.location_pin,
                                      size: 23.0, color: AppColors.tabColor),
                                  SizedBox(width: 4.0),
                                  Text2(text2: 'UK 32 Street'),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          size: 20.0,
                                          color: AppColors.tabColor),
                                      Icon(Icons.star,
                                          size: 20.0,
                                          color: AppColors.tabColor),
                                      Icon(Icons.star,
                                          size: 20.0,
                                          color: AppColors.tabColor),
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
                                          color: AppColors.tabColor),
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
    );
  }

  Widget _homeAllHotel() {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, hotelState) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (hotelState is HotelFailed) {
            showCustomSnackbar(context, hotelState.error);
          }
        });

        if (hotelState is HotelSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text1(
                text1: 'Recomended For You',
                size: 18,
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: hotelState.data.map((hotel) {
                    return HotelsCard1(
                      key: ValueKey(hotel.id),
                      hotel: hotel,
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text1(
                text1: 'All The Hotels',
                size: 18,
              ),
              const SizedBox(height: 10.0),
              Column(
                children: hotelState.data.map((hotel) {
                  return HotelsCard2(
                    key: ValueKey(hotel.id),
                    hotel: hotel,
                  );
                }).toList(),
              ),
            ],
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text1(text1: 'Recomended For You', size: 18),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  3,
                  (_) => const ShimmerCard(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text1(text1: 'All The Hotels', size: 18),
            const SizedBox(height: 10),
            Column(
              children: List.generate(
                4,
                (_) => const ShimmerList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
