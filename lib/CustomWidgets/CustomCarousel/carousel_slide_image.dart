import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomButton/custom_button_icon.dart';
import 'package:hotelbookingapp/Shared/custom_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSlideImage extends StatelessWidget {
  final PageController pageController;
  final List<String?> imageUrls;

  const CarouselSlideImage({
    super.key,
    required this.pageController,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 260,
          width: double.infinity,
          child: PageView.builder(
            controller: pageController,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              final imageUrl = imageUrls[index];

              return ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: imageUrl != null
                    ? Image.network(
                        imageUrl,
                        height: 260,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 150,
                              color: AppColors.beauBlue,
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Icon(
                          Icons.image,
                          size: 150,
                          color: AppColors.beauBlue,
                        ),
                      ),
              );
            },
          ),
        ),
        Positioned(
          top: 15,
          left: 10,
          child: CustomButtonIcon(
            icon: Icons.arrow_back,
            size: 20,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        Positioned(
          top: 15,
          right: 10,
          child: Row(
            children: [
              CustomButtonIcon(
                icon: Icons.share,
                size: 20,
                onTap: () {
                  showCustomSnackbar(context, 'Fitur belum tersedia!');
                },
              ),
              const SizedBox(width: 5),
              CustomButtonIcon(
                icon: Icons.more_vert,
                size: 20,
                onTap: () {
                  showCustomSnackbar(context, 'Fitur belum tersedia!');
                },
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Center(
            child: SmoothPageIndicator(
              controller: pageController,
              count: imageUrls.length,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: AppColors.white,
                dotColor: AppColors.beauBlue.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
