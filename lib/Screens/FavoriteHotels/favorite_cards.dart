import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:hotelbookingapp/Widgets/detailstext2.dart';
import 'package:hotelbookingapp/Widgets/text11.dart';

class FavoriteCard extends StatelessWidget {
  final String imagePath;
  final String hotelName;
  final String location;
  final double rating;
  final String discount;
  final String price;
  final VoidCallback onTap;

  const FavoriteCard({
    super.key,
    required this.imagePath,
    required this.hotelName,
    required this.location,
    required this.rating,
    required this.discount,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: onTap,
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
                      imagePath,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 110,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 12, top: 4, bottom: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(hotelName,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const Spacer(),
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 20,
                              )
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_pin,
                                size: 23.0,
                                color: AppColors.tabColor,
                              ),
                              const SizedBox(width: 4.0),
                              Text(location),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            children: [
                              Row(
                                children: List.generate(
                                    3,
                                    (index) => const Icon(
                                          Icons.star,
                                          size: 20.0,
                                          color: AppColors.tabColor,
                                        )),
                              ),
                              const SizedBox(width: 4.0),
                              Text(rating.toString()),
                            ],
                          ),
                          const Row(
                            children: [
                              Text11(
                                text2: '10% Off',
                                color: AppColors.tabColor,
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Text1(
                                    text1: '\$12.00',
                                    size: 18,
                                    color: AppColors.tabColor,
                                  ),
                                  Text2(text2: '/night')
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: CustomButton(
                    text: 'Booking Now',
                    onTap: () {},
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

// Widg

