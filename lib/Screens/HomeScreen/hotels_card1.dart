import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/wishlist/post_wishlist/post_wishlist_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CommonWidgets/label_featured.dart';
import 'package:hotelbookingapp/CustomWidgets/CommonWidgets/start_rating_hotel.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCarousel/hotel_image_caraousel.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_remaining.dart';
import 'package:hotelbookingapp/Models/HotelModel/hotel_all_model.dart';
import 'package:hotelbookingapp/Models/WishlistModel/request_wishlist.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';

import '../../CustomWidgets/CustomText/detailstext1.dart';
import '../../CustomWidgets/CustomText/detailstext2.dart';
import '../../Themes/colors.dart';
import '../DetailHotel/hotel_details_screen.dart';

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
  int _currentPage = 0;
  Timer? _timer;

  late ValueNotifier<bool> isFavoriteNotifier;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    isFavoriteNotifier = ValueNotifier(widget.hotel.hasWishList != null);

    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_pageController.hasClients && mounted) {
        _currentPage = (_currentPage + 1) % _imageUrls.length;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    isFavoriteNotifier.dispose();
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
        width: 190,
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
                    HotelImageCarousel(
                      pageController: _pageController,
                      imageUrls: _imageUrls,
                      width: 190,
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
                              text: widget.hotel.title ?? 'No information name',
                              size: 13,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          ValueListenableBuilder<bool>(
                            valueListenable: isFavoriteNotifier,
                            builder: (context, isFavorite, _) {
                              return GestureDetector(
                                onTap: () {
                                  if (!isFavorite) {
                                    context.read<PostWishlistBloc>().add(
                                          PostData(
                                            RequestWishlist(
                                              objectId: widget.hotel.id!,
                                            ),
                                          ),
                                        );
                                    isFavoriteNotifier.value = true;
                                    showCustomSnackbar(
                                        context, 'You are added to wishlist');
                                  } else {
                                    showCustomSnackbar(
                                        context, 'You are already in wishlist');
                                  }
                                },
                                child: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: AppColors.redAwesome,
                                  size: 22,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_pin,
                            size: 20,
                            color: AppColors.buttonColor,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: CustomTextEllipsis(
                              text: widget.hotel.address ?? 'no location info',
                              size: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const TextRemaining(text: '12 Rooms Left'),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text1(
                            text1: widget.hotel.price != null
                                ? "Rp${widget.hotel.price}"
                                : '0',
                            size: 14,
                            color: AppColors.buttonColor,
                          ),
                          const Text2(text2: '/night', size: 14),
                        ],
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
