import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/wishlist/post_wishlist/post_wishlist_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext2.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_remaining.dart';
import 'package:hotelbookingapp/Models/HotelModel/hotel_all_model.dart';
import 'package:hotelbookingapp/Models/WishlistModel/request_wishlist.dart';
import 'package:hotelbookingapp/Screens/DetailHotel/hotel_details_screen.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HotelsCard2 extends StatefulWidget {
  final HotelAllModel hotel;

  const HotelsCard2({super.key, required this.hotel});

  @override
  State<HotelsCard2> createState() => _HotelsCard2State();
}

class _HotelsCard2State extends State<HotelsCard2> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Pastikan widget sudah terpasang sebelum menjalankan timer
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
          if (_pageController.hasClients) {
            _currentPage = (_currentPage + 1) % _imageUrls.length;
            _pageController.animateToPage(
              _currentPage,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
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
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          width: 120,
                          height: 113,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount:
                                _imageUrls.isNotEmpty ? _imageUrls.length : 1,
                            itemBuilder: (context, index) {
                              return Image.network(
                                _imageUrls.isNotEmpty
                                    ? _imageUrls[index]
                                    : 'https://via.placeholder.com/190x130',
                                width: 120,
                                height: 113,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: LoadingAnimationWidget
                                        .threeArchedCircle(
                                      color: AppColors.white,
                                      size: 200,
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                  'images/no-image.jpg',
                                  fit: BoxFit.cover,
                                  width: 190,
                                  height: 130.0,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      // if (widget.hotel.isFeatured == 0)
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
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
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 50,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
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
                                  widget.hotel.starRate != null
                                      ? widget.hotel.starRate!.toInt()
                                      : 1,
                                  (index) => const Icon(
                                    Icons.star,
                                    size: 15,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              Text2(
                                text2: widget.hotel.reviewScore?.toString() ??
                                    '0.0',
                                size: 10,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ],
                          ),
                        ),
                      )
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
                                text: widget.hotel.title ?? 'No tittle info',
                                size: 13,
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                              )),
                              const SizedBox(width: 8), // beri jarak sedikit
                              (widget.hotel.hasWishList != null)
                                  ? GestureDetector(
                                      onTap: () {
                                        showCustomSnackbar(
                                            context, 'You are added wislist');
                                      },
                                      child: const Icon(
                                        Icons.favorite,
                                        color: AppColors.redAwesome,
                                        size: 22,
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        context.read<PostWishlistBloc>().add(
                                              PostData(
                                                RequestWishlist(
                                                  objectId: widget.hotel.id!,
                                                ),
                                              ),
                                            );
                                      },
                                      child: const Icon(
                                        Icons.favorite_outline,
                                        color: AppColors.redAwesome,
                                        size: 22,
                                      ),
                                    ),
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
