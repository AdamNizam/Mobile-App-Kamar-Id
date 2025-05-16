// file: hotel_image_carousel.dart

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Themes/colors.dart'; // sesuaikan path

class HotelImageCarousel extends StatelessWidget {
  final PageController pageController;
  final List<String> imageUrls;
  final double width;
  final double height;

  const HotelImageCarousel({
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
