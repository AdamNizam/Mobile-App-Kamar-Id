import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/CustomWidgets/CommonWidgets/wishlist_widget.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/card_animation.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCarousel/carousel_card_image.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_discount.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_location.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_price.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_remaining.dart';
import 'package:hotelbookingapp/Data/Models/HotelModel/hotel_all_model.dart';
import 'package:hotelbookingapp/Screens/DetailHotel/hotel_detail_screen.dart';
import 'package:hotelbookingapp/Shared/shared_contollers.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class CardAllHotel extends StatefulWidget {
  final Datum hotel;

  const CardAllHotel({super.key, required this.hotel});

  @override
  State<CardAllHotel> createState() => _CardAllHotelState();
}

class _CardAllHotelState extends State<CardAllHotel>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late bool isWishlisted;
  late AutoSliderController _autoSliderController;
  late HotelCardAnimation _cardAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    isWishlisted = widget.hotel.hasWishList != null;
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
      if (widget.hotel.imageId != null && widget.hotel.imageId!.isNotEmpty)
        widget.hotel.imageId!,
      if (widget.hotel.bannerImageId != null &&
          widget.hotel.bannerImageId!.isNotEmpty)
        widget.hotel.bannerImageId!,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _cardAnimation.slideAnimation,
      child: FadeTransition(
        opacity: _cardAnimation.fadeAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HotelDetailsScreen(
                    slug: widget.hotel.slug,
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
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
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                              reviewScore: 0.5,
                            ),
                            if (widget.hotel.id != 12) const LabelFeatured()
                          ],
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 6,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: CustomTextEllipsis(
                                        text: '${widget.hotel.title}',
                                        color: AppColors.black,
                                        size: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    (widget.hotel.hasWishList != null)
                                        ? const Icon(
                                            Icons.favorite,
                                            color: AppColors.redAwesome,
                                            size: 22,
                                          )
                                        : WishlistWidget(
                                            idHotel: widget.hotel.id!,
                                            icon: Icons.favorite_border,
                                          )
                                  ],
                                ),
                                const SizedBox(height: 5),
                                TextLocation2(
                                  address: widget.hotel.address ??
                                      AppLocalizations.of(context)!.textNoInfo,
                                ),
                                const SizedBox(height: 5),
                                if (widget.hotel.id != 12)
                                  const TextDiscount(
                                    initialPrice: '4.000.000',
                                  ),
                                const SizedBox(height: 5),
                                TextPrice(
                                  price:
                                      AppLocalizations.of(context)!.textNight(
                                    widget.hotel.price.toString(),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                if (widget.hotel.rooms!.isNotEmpty)
                                  TextRemaining(
                                    text: AppLocalizations.of(context)!
                                        .textRemaining(
                                      widget.hotel.rooms!.length,
                                    ),
                                  ),
                                const SizedBox(height: 3),
                              ],
                            ),
                          ),
                        ),
                      ],
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
