import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'images/no-data.svg',
                      semanticsLabel: 'Acme Logo',
                      width: 350,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'Oopss.. Data is not available',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.cadetGray,
                      ),
                    ),
                  ],
                ),
              )),
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
