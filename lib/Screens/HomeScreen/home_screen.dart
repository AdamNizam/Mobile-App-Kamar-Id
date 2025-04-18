import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/CommonWidgets/eventscard.dart';
import 'package:hotelbookingapp/CommonWidgets/hotelscard.dart';
import 'package:hotelbookingapp/Screens/Notifications/notifications.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../CommonWidgets/address_widget.dart';
import '../../../../CommonWidgets/categories_widget.dart';
import '../../../../CommonWidgets/home_widget.dart';
import '../../../../Constants/colors.dart';
import '../../../../Widgets/detailstext1.dart';
import '../../../../Widgets/text11.dart';
import '../../../Widgets/drawer_widget.dart';
import '../../CommonWidgets/search_widget.dart';
import '../Categories/all_categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                                    SizedBox(
                                      height: 10,
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
                                            const BookingNotifications(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 42,
                                    width: 42,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
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
                                return EventsCard(hotel: hotel);
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
                              return HotelsCard(hotel: hotel);
                            }).toList(),
                          ),
                        ],
                      );
                    }

                    // State selain success: tampilkan shimmer/loading
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text1(text1: 'Recomended For You', size: 18),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(3, (_) => shimmerCard()),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text1(text1: 'All The Hotels', size: 18),
                        const SizedBox(height: 10),
                        Column(
                          children: List.generate(4, (_) => shimmerListTile()),
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

  Widget shimmerCard({double width = 150, double height = 100}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[200]!,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget shimmerListTile() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[200]!,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
