import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext2.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class StarRatingHotel extends StatelessWidget {
  final int? starRate;
  final double? reviewScore;

  const StarRatingHotel({
    super.key,
    required this.starRate,
    required this.reviewScore,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: 50,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: const BoxDecoration(
          color: AppColors.amberColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Row(
          children: [
            Row(
              children: List.generate(
                starRate != null ? starRate!.toInt() : 1,
                (index) => const Icon(
                  Icons.star,
                  size: 15,
                  color: AppColors.white,
                ),
              ),
            ),
            Text2(
              text2: reviewScore?.toString() ?? '0.0',
              fontWeight: FontWeight.bold,
              size: 10,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
