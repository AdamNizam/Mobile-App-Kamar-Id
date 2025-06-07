// lib/CustomWidgets/CardAllHotel/card_all_hotel.dart

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/card_animation.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCarousel/carousel_card_image.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_discount.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_overflow.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_price.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_remaining.dart';
import 'package:hotelbookingapp/Models/HotelModel/result_filter_model.dart';
import 'package:hotelbookingapp/Shared/shared_contollers.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class CardFilter extends StatefulWidget {
  final ResultFilterModel data;

  const CardFilter({super.key, required this.data});

  @override
  State<CardFilter> createState() => _CardFilterState();
}

class _CardFilterState extends State<CardFilter>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late bool isWishlisted;
  late AutoSliderController _autoSliderController;
  late HotelCardAnimation _cardAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _autoSliderController = AutoSliderController(
      pageController: _pageController,
      itemCount: _imageUrls.length,
    );
    _autoSliderController.start();

    // Inisialisasi animasi
    _cardAnimation = HotelCardAnimation.init(vsync: this);
    _cardAnimation.controller.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoSliderController.dispose();
    _cardAnimation.controller.dispose();
    super.dispose();
  }

  List<String> get _imageUrls {
    return [
      if (widget.data.imageId != null && widget.data.imageId!.isNotEmpty)
        widget.data.imageId!,
      if (widget.data.bannerImageId != null &&
          widget.data.bannerImageId!.isNotEmpty)
        widget.data.bannerImageId!,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return SlideTransition(
      position: _cardAnimation.slideAnimation,
      child: FadeTransition(
        opacity: _cardAnimation.fadeAnimation,
        child: GestureDetector(
          onTap: () {
            showCustomSnackbar(context, 'fitur is not available');
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.beauBlue,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CarouselCardImage(
                        pageController: _pageController,
                        imageUrls: _imageUrls,
                        width: 120,
                        height: 145,
                      ),
                      StarRatingHotel(
                        starRate: widget.data.starRate?.toInt(),
                        reviewScore: 0.5,
                      ),
                      if (widget.data.id != 12) const LabelFeatured()
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextOverflow(
                            text: data.title ?? '',
                            color: AppColors.black,
                            size: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  size: 18, color: AppColors.tabColor),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text1(
                                  text1:
                                      AppLocalizations.of(context)!.textNoInfo,
                                  size: 13,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const TextDiscount(initialPrice: '2.000.00'),
                          const SizedBox(height: 5),
                          TextPrice(
                            price: AppLocalizations.of(context)!
                                .textNight(data.price ?? ''),
                          ),
                          const SizedBox(height: 5),
                          TextRemaining(
                            text: AppLocalizations.of(context)!
                                .textRemaining('1'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
