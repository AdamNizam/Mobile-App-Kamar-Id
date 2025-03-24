import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelbookingapp/Blocs/booking/booking_bloc.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../Constants/colors.dart'; // Import bloc yang sesuai

class FavoriteHotels extends StatefulWidget {
  const FavoriteHotels({super.key});

  @override
  FavoriteHotelsState createState() => FavoriteHotelsState();
}

class FavoriteHotelsState extends State<FavoriteHotels>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String selectedCategory = 'All';

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
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Expanded(
                child: BlocBuilder<BookingBloc, BookingState>(
                  builder: (context, state) {
                    if (state is BookingHistoryLoading) {
                      return Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: AppColors.tabColor,
                          size: 30,
                        ),
                      );
                    }
                    if (state is BookingHistoryFailed) {
                      showCustomSnackbar(context, state.error);
                    }
                    if (state is BookingHistorySuccess) {}
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'images/No data-bro.svg',
                            semanticsLabel: 'Acme Logo',
                            width: 350,
                            height: 300,
                            fit: BoxFit.contain,
                          ),
                          const Text(
                            'Oopss.. Data is not available',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
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
