import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/user/user_bloc.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../Constants/colors.dart';
import '../../Models/hotel_model.dart';

class FavoriteHotels extends StatefulWidget {
  const FavoriteHotels({super.key});

  @override
  FavoriteHotelsState createState() => FavoriteHotelsState();
}

class FavoriteHotelsState extends State<FavoriteHotels>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String selectedCategory = 'Music Night';

  final List<HotelModel> products = [
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
              Container(
                padding: const EdgeInsets.all(2),
                child: BlocListener<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is UserFailed) {
                      showCustomSnackbar(context, state.error);
                    }
                  },
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserSuccess) {
                        return const SingleChildScrollView(
                          child: Column(children: [Text('data berhasil')]),
                        );
                      }
                      return Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: AppColors.tabColor,
                          size: 30,
                        ),
                      );
                    },
                  ),
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
