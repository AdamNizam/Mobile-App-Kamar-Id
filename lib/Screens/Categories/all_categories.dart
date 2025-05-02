import 'package:flutter/material.dart';

import '../../Constants/colors.dart'; // Ensure AppColors has the new color scheme for your hotel booking app
import '../../CustomWidgets/detailstext1.dart'; // Assuming this is your custom Text widget

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  final List<CategoryProduct> categories = [
    CategoryProduct(icon: Icons.hotel, name: 'Luxury Hotels'),
    CategoryProduct(icon: Icons.local_hotel, name: 'Budget Hotels'),
    CategoryProduct(icon: Icons.pool, name: 'Resorts'),
    CategoryProduct(icon: Icons.home, name: 'Vacation Rentals'),
    CategoryProduct(icon: Icons.business, name: 'Business Hotels'),
    CategoryProduct(icon: Icons.star, name: 'Boutique Hotels'),
    CategoryProduct(icon: Icons.pets, name: 'Pet-Friendly'),
    CategoryProduct(icon: Icons.family_restroom, name: 'Family-Friendly'),
    CategoryProduct(icon: Icons.accessibility_new, name: 'Accessible Rooms'),
    CategoryProduct(icon: Icons.location_on, name: 'City Center'),
    CategoryProduct(icon: Icons.nature_people, name: 'Countryside'),
    CategoryProduct(icon: Icons.beach_access, name: 'Beachfront'),
    CategoryProduct(icon: Icons.shopping_bag, name: 'Shopping District'),
    CategoryProduct(icon: Icons.restaurant, name: 'Gourmet Dining'),
    CategoryProduct(icon: Icons.explore, name: 'Adventure & Activities'),
    CategoryProduct(icon: Icons.business_center, name: 'Executive Suites'),
    CategoryProduct(icon: Icons.local_florist, name: 'Spa & Wellness'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor, // Set the background color
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: AppColors.text1Color, size: 17),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Spacer(),
                  const Text1(
                      text1: 'Hotel Categories',
                      color:
                          AppColors.text1Color), // Updated to use theme color
                  const Spacer(),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    // Define action on tap
                  },
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 2,
                      childAspectRatio: 1,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(category: categories[index]);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final CategoryProduct category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors
              .textFormFieldBorderColor, // Updated to match form field border color
          child: Icon(
            category.icon,
            size: 30,
            color:
                AppColors.buttonColor, // Use button color for icon consistency
          ),
        ),
        const SizedBox(height: 8),
        Flexible(
          child: Text1(
            text1: category.name,
            color: AppColors
                .text1Color, // Use primary text color for category names
          ),
        ),
      ],
    );
  }
}

class CategoryProduct {
  final IconData icon;
  final String name;

  CategoryProduct({required this.icon, required this.name});
}
