import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/CommonWidgets/hotelscard_widgnet.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';

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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              Container(
                padding: const EdgeInsets.all(2),
                child: const SingleChildScrollView(
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
                        imageUrl: 'images/All-InclusiveHotels.jpg',
                        title: 'InclusiveHotels',
                        location: 'USA 22 Street',
                        date: '3.4',
                        price: '\$30.00',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text1(
                text1: 'All The Hotels',
                size: 18,
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.all(2),
                child: BlocProvider(
                  create: (context) => HotelBloc()..add(GetAllHotels()),
                  child: BlocListener<HotelBloc, HotelState>(
                    listener: (context, state) {
                      if (state is HotelFailed) {
                        showCustomSnackbar(context, state.error);
                      }
                    },
                    child: BlocBuilder<HotelBloc, HotelState>(
                      builder: (context, state) {
                        if (state is HotelSuccess) {
                          return SingleChildScrollView(
                            child: Column(
                              children: state.hotels.map((e) {
                                return HotelsCard(hotel: e);
                              }).toList(),
                            ),
                          );
                        }
                        return Center(
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: CircularProgressIndicator(
                              strokeWidth: 3.0,
                              backgroundColor: Colors.grey[300],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  AppColors.tabColor),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
