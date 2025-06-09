import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/card_animation.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCarousel/carousel_card_image.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_discount.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_location.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_name_hotel.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_price.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_remaining.dart';
import 'package:hotelbookingapp/Models/WishlistModel/wishlist_model.dart';
import 'package:hotelbookingapp/Shared/shared_contollers.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class FavoriteCard extends StatefulWidget {
  final ServiceWishlist data;

  const FavoriteCard({super.key, required this.data});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard>
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
      if (widget.data.image != null && widget.data.image!.isNotEmpty)
        widget.data.image!,
      if (widget.data.image != null && widget.data.image!.isNotEmpty)
        widget.data.image!,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return SlideTransition(
      position: _cardAnimation.slideAnimation,
      child: FadeTransition(
        opacity: _cardAnimation.fadeAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
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
                        const StarRatingHotel(
                          starRate: 1,
                          reviewScore: 0,
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
                            TextNameHotel(idHotel: data.id, title: data.title),
                            const SizedBox(height: 5),
                            TextLocation2(
                              address: AppLocalizations.of(context)!.textNoInfo,
                            ),
                            const SizedBox(height: 5),
                            const TextDiscount(initialPrice: '2.000.00'),
                            const SizedBox(height: 5),
                            TextPrice(
                              price: AppLocalizations.of(context)!
                                  .textNight(data.price),
                            ),
                            const SizedBox(height: 5),
                            TextRemaining(
                              text: AppLocalizations.of(context)!
                                  .textRemaining('1'),
                            ),
                            const SizedBox(width: 5),
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
      ),
    );
  }
}
