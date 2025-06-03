import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/Blocs/wishlist/post_wishlist/post_wishlist_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCarousel/carousel_card_image.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_discount.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_location.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_price.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_remaining.dart';
import 'package:hotelbookingapp/Models/HotelModel/hotel_all_model.dart';
import 'package:hotelbookingapp/Models/WishlistModel/request_wishlist.dart';
import 'package:hotelbookingapp/Shared/shared_contollers.dart';

import '../../Themes/colors.dart';
import '../DetailHotel/hotel_detail_screen.dart';

class HotelsCard1 extends StatefulWidget {
  final HotelAllModel hotel;

  const HotelsCard1({
    super.key,
    required this.hotel,
  });

  @override
  State<HotelsCard1> createState() => _HotelsCard1State();
}

class _HotelsCard1State extends State<HotelsCard1> {
  late PageController _pageController;
  late bool isWishlisted;
  late AutoSliderController _autoSliderController;

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
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoSliderController.dispose();
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HotelDetailsScreen(slug: widget.hotel.slug),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        width: 210,
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
                    StarRatingHotel(
                      starRate: widget.hotel.starRate?.toInt(),
                      reviewScore: widget.hotel.reviewScore,
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
                        children: [
                          Expanded(
                            child: CustomTextEllipsis(
                              text: widget.hotel.title ??
                                  AppLocalizations.of(context)!.textNoInfo,
                              size: 13,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          BlocConsumer<PostWishlistBloc, PostWishlistState>(
                            listener: (context, state) {
                              if (state is PostWishlistSuccess) {
                                context.read<HotelBloc>().add(GetAllHotels());
                              }
                              if (state is PostWishlistLoading) {
                                print('OK Loading');
                              }
                            },
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: () {
                                  context.read<PostWishlistBloc>().add(
                                        PostData(
                                          RequestWishlist(
                                            objectId: widget.hotel.id!,
                                          ),
                                        ),
                                      );
                                },
                                child: Icon(
                                  isWishlisted
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: AppColors.redAwesome,
                                  size: 22,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      TextLocation(
                        locationText: widget.hotel.address ??
                            AppLocalizations.of(context)!.textNoInfo,
                        cutText: true,
                      ),
                      const SizedBox(height: 5),
                      const TextDiscount(initialPrice: 'Rp2.000.00'),
                      const SizedBox(height: 5),
                      TextPrice(
                        price: AppLocalizations.of(context)!.textNight(
                          widget.hotel.price.toString(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      (widget.hotel.rooms!.isNotEmpty)
                          ? TextRemaining(
                              text: AppLocalizations.of(context)!
                                  .textRemaining(widget.hotel.rooms!.length),
                            )
                          : const TextRemaining(
                              text: 'soldout',
                              color: AppColors.redAwesome,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
