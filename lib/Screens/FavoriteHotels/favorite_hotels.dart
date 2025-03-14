import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/booking/booking_bloc.dart';
import 'package:hotelbookingapp/Screens/FavoriteHotels/favorite_cards.dart';
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
                    if (state is BookingHistorySuccess) {
                      if (state.bookingHistory.isEmpty) {
                        return ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: state.bookingHistory.length,
                          itemBuilder: (context, index) {
                            return FavoriteCard(
                              imagePath: 'images/Eco-FriendlyHotels.jpg',
                              hotelName: 'Unknown',
                              location: 'Unknown',
                              rating: 0.0,
                              discount: 'No Discount',
                              price: '\$0.00',
                              onTap: () {},
                            );
                          },
                        );
                      }
                    }
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('images/no-data.png'),
                            width: 150, // Sesuaikan ukuran gambar
                            height: 150,
                            fit: BoxFit
                                .cover, // Mengatur cara gambar ditampilkan
                          ),
                          SizedBox(height: 10), // Jarak antara gambar dan teks
                          Text(
                            'Tidak ada data tersedia.',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
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
