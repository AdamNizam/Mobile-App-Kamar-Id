import 'package:flutter/material.dart';

import 'categorycard.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // Luxury Hotels category
          CategoryCard(
            icon: Icons.hotel,
            title: 'Luxury',
          ),
          SizedBox(
            width: 5,
          ),

          // Budget Hotels category
          CategoryCard(
            icon: Icons.local_hotel,
            title: 'Budget',
          ),
          SizedBox(
            width: 5,
          ),

          // Resorts category
          CategoryCard(
            icon: Icons.pool,
            title: 'Resorts',
          ),
          SizedBox(
            width: 5,
          ),

          // Vacation Rentals category
          CategoryCard(
            icon: Icons.home,
            title: 'Vacation',
          ),
          SizedBox(
            width: 5,
          ),

          // Business Hotels category
          CategoryCard(
            icon: Icons.business,
            title: 'Business',
          ),
          SizedBox(
            width: 5,
          ),

          // Boutique Hotels category
          CategoryCard(
            icon: Icons.star,
            title: 'Boutique',
          ),
          SizedBox(
            width: 5,
          ),

          // Pet-Friendly category
          CategoryCard(
            icon: Icons.pets,
            title: 'Friendly',
          ),
          SizedBox(
            width: 5,
          ),

          // Family-Friendly category
          CategoryCard(
            icon: Icons.family_restroom,
            title: 'Family',
          ),
          SizedBox(
            width: 5,
          ),

          // Accessible Rooms category
          CategoryCard(
            icon: Icons.accessibility_new,
            title: 'Accessible',
          ),
          SizedBox(
            width: 5,
          ),

          // City Center category
          CategoryCard(
            icon: Icons.location_on,
            title: 'City',
          ),
          SizedBox(
            width: 5,
          ),

          // Beachfront category
          CategoryCard(
            icon: Icons.beach_access,
            title: 'Beachfront',
          ),
          SizedBox(
            width: 5,
          ),

          // Spa & Wellness category
          CategoryCard(
            icon: Icons.spa,
            title: 'Wellness',
          ),
        ],
      ),
    );
  }
}
