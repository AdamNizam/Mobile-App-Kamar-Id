import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/Blocs/wishlist/post_wishlist/post_wishlist_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCarousel/carousel_card_image.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext2.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_remaining.dart';
import 'package:hotelbookingapp/Models/HotelModel/hotel_all_model.dart';
import 'package:hotelbookingapp/Models/WishlistModel/request_wishlist.dart';
import 'package:hotelbookingapp/Screens/DetailHotel/hotel_details_screen.dart';
import 'package:hotelbookingapp/Shared/custom_contollers.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class HotelsCard2 extends StatefulWidget {
  final HotelAllModel hotel;

  const HotelsCard2({super.key, required this.hotel});

  @override
  State<HotelsCard2> createState() => _HotelsCard2State();
}

class _HotelsCard2State extends State<HotelsCard2> {
  late PageController _pageController;
  late AutoSliderController _autoSliderController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
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
    return Padding(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    CarouselCardImage(
                      pageController: _pageController,
                      imageUrls: _imageUrls,
                      width: 120,
                      height: 113,
                    ),
                    StarRatingHotel(
                      starRate: widget.hotel.starRate?.toInt(),
                      reviewScore: widget.hotel.reviewScore,
                    ),
                    const LabelFeatured()
                  ]),
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
                                text: widget.hotel.title ?? 'No tittle info',
                                size: 13,
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                              )),
                              const SizedBox(width: 8), // beri jarak sedikit
                              BlocConsumer<PostWishlistBloc, PostWishlistState>(
                                listener: (context, state) {
                                  if (state is PostWishlistSuccess) {
                                    context
                                        .read<HotelBloc>()
                                        .add(GetAllHotels());
                                  }
                                },
                                builder: (context, state) {
                                  return IconButton(
                                    icon: Icon(
                                      widget.hotel.hasWishList != null
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                    ),
                                    tooltip: 'Add wishlist',
                                    color: AppColors.redAwesome,
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.topRight,
                                    iconSize: 22,
                                    onPressed: () {
                                      context.read<PostWishlistBloc>().add(
                                            PostData(
                                              RequestWishlist(
                                                objectId: widget.hotel.id!,
                                              ),
                                            ),
                                          );
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_pin,
                                size: 20,
                                color: AppColors.tabColor,
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: CustomTextEllipsis(
                                  text: widget.hotel.address ??
                                      'No location info',
                                  size: 13,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            children: [
                              Text1(
                                text1: widget.hotel.price != null
                                    ? "Rp${widget.hotel.price}"
                                    : '0',
                                size: 14,
                                color: AppColors.tabColor,
                              ),
                              const Text2(
                                text2: '/night',
                                size: 12,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          const TextRemaining(text: '12 Rooms Left')
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
    );
  }
}
