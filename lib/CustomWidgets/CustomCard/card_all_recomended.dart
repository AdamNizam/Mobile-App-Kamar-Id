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
import 'package:hotelbookingapp/Models/HotelModel/hotel_all_model.dart';
import 'package:hotelbookingapp/Screens/DetailHotel/hotel_detail_screen.dart';
import 'package:hotelbookingapp/Shared/shared_contollers.dart';

import '../../Themes/colors.dart';

class CardAllRecomended extends StatefulWidget {
  final Datum hotel;

  const CardAllRecomended({
    super.key,
    required this.hotel,
  });

  @override
  State<CardAllRecomended> createState() => _CardAllRecomendedState();
}

class _CardAllRecomendedState extends State<CardAllRecomended>
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
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    HotelDetailsScreen(slug: widget.hotel.slug),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.all(4),
            width: 200,
            height: 290,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CarouselCardImage(
                          pageController: _pageController,
                          imageUrls: _imageUrls,
                          width: 210,
                          height: 130,
                        ),
                        const StarRatingHotel(
                          starRate: 1,
                          reviewScore: 0.5,
                        ),
                        const LabelFeatured()
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
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
                              initialPrice: '200.000',
                            ),
                          const SizedBox(height: 5),
                          TextPrice(
                            price: AppLocalizations.of(context)!
                                .textNight('${widget.hotel.price}'),
                          ),
                          const SizedBox(height: 5),
                          if (widget.hotel.rooms!.isNotEmpty)
                            TextRemaining(
                              text: AppLocalizations.of(context)!
                                  .textRemaining(widget.hotel.rooms!.length),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
