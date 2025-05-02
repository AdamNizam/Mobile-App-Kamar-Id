import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/Shimmers/shimmer_card.dart';
import 'package:hotelbookingapp/CustomWidgets/Shimmers/shimmer_list.dart';
import 'package:hotelbookingapp/Screens/HomeScreen/hotels_card1.dart';
import 'package:hotelbookingapp/Screens/HomeScreen/hotels_card2.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';

import '../../../../Constants/colors.dart';
import '../../CustomWidgets/CommonWidgets/address_widget.dart';
import '../../CustomWidgets/CommonWidgets/categories_widget.dart';
import '../../CustomWidgets/CommonWidgets/home_widget.dart';
import '../../CustomWidgets/CommonWidgets/search_widget.dart';
import '../../CustomWidgets/detailstext1.dart';
import '../../CustomWidgets/drawer_widget.dart';
import '../../CustomWidgets/text11.dart';
import '../Categories/all_categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int totalNotification = 0;

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
                const SizedBox(height: 16),
                BlocConsumer<HotelBloc, HotelState>(
                  listener: (context, state) {
                    if (state is HotelFailed) {
                      showCustomSnackbar(context, state.error);
                    }
                  },
                  builder: (context, state) {
                    if (state is HotelSuccess) {
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
                              children: state.data.map((hotel) {
                                return HotelsCard1(hotel: hotel);
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
                            children: state.data.map((hotel) {
                              return HotelsCard2(hotel: hotel);
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
