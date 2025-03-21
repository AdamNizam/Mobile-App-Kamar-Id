import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Models/hotel/hotel_all_model.dart';
import 'package:hotelbookingapp/Screens/DetailHotel/details_screen.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:hotelbookingapp/Widgets/detailstext2.dart';
import 'package:hotelbookingapp/Widgets/text11.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HotelsCard extends StatefulWidget {
  final HotelAllModel hotel;

  const HotelsCard({super.key, required this.hotel});

  @override
  State<HotelsCard> createState() => _HotelsCardState();
}

class _HotelsCardState extends State<HotelsCard> {
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
            color: Colors.white,
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
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          width: 100,
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
                                width: 100,
                                height: 113,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: LoadingAnimationWidget
                                        .threeArchedCircle(
                                      color: Colors.white,
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
                      if (widget.hotel.isFeatured == 1)
                        Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.redAwesome,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Featured',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 12, top: 4, bottom: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text1(text1: widget.hotel.title.toString()),
                              const Spacer(),
                              const Icon(
                                Icons.favorite_border,
                                color: AppColors.redAwesome,
                                size: 20,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_pin,
                                size: 23.0,
                                color: AppColors.tabColor,
                              ),
                              const SizedBox(width: 4.0),
                              widget.hotel.address != null
                                  ? Text2(
                                      text2: widget.hotel.address.toString())
                                  : const Text2(
                                      text2: 'No-data',
                                    ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            children: [
                              Row(
                                children: List.generate(
                                  widget.hotel.starRate != null
                                      ? widget.hotel.starRate!.toInt()
                                      : 1,
                                  (index) => Icon(
                                    Icons.star,
                                    size: 20.0,
                                    color: index <
                                            double.tryParse(widget
                                                    .hotel.reviewScore
                                                    ?.toString() ??
                                                '0.0')!
                                        ? AppColors.tabColor
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                              widget.hotel.reviewScore != null
                                  ? Text2(
                                      text2:
                                          widget.hotel.reviewScore.toString())
                                  : const Text('0.0'),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            children: [
                              const Text11(
                                text2: '10% Off',
                                color: AppColors.tabColor,
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  widget.hotel.price != null
                                      ? Text1(
                                          text1:
                                              "\$${widget.hotel.price.toString()}",
                                          size: 18,
                                          color: AppColors.tabColor,
                                        )
                                      : const Text1(
                                          text1: '0',
                                          size: 18,
                                          color: AppColors.tabColor,
                                        ),
                                  const Text2(text2: '/night'),
                                ],
                              ),
                            ],
                          )
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
