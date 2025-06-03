// file: hotel_image_carousel.dart

import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext2.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Themes/colors.dart'; // sesuaikan path

class CarouselCardImage extends StatelessWidget {
  final PageController pageController;
  final List<String> imageUrls;
  final double width;
  final double height;

  const CarouselCardImage({
    super.key,
    required this.pageController,
    required this.imageUrls,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: width,
        height: height,
        child: PageView.builder(
          controller: pageController,
          itemCount: imageUrls.isNotEmpty ? imageUrls.length : 1,
          itemBuilder: (context, index) {
            return Image.network(
              imageUrls.isNotEmpty
                  ? imageUrls[index]
                  : 'https://via.placeholder.com/190x130',
              width: 190,
              height: 130,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: LoadingAnimationWidget.threeArchedCircle(
                    color: AppColors.white,
                    size: 200,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'images/no-image.jpg',
                fit: BoxFit.cover,
                width: 190,
                height: 130.0,
              ),
            );
          },
        ),
      ),
    );
  }
}

class LabelFeatured extends StatelessWidget {
  const LabelFeatured({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: const BoxDecoration(
          color: AppColors.redAwesome,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: const Text1(
          text1: 'Featured',
          color: AppColors.white,
          size: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

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
