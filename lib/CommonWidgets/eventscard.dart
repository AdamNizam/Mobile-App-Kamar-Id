import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Models/hotel/hotel_all_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Constants/colors.dart';
import '../Screens/DetailHotel/details_screen.dart';
import '../Widgets/detailstext1.dart';
import '../Widgets/detailstext2.dart';
import '../Widgets/text11.dart';

class EventsCard extends StatefulWidget {
  final HotelAllModel hotel;

  const EventsCard({
    super.key,
    required this.hotel,
  });

  @override
  State<EventsCard> createState() => _EventsCardState();
}

class _EventsCardState extends State<EventsCard> {
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HotelDetailsScreen(slug: widget.hotel.slug),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 190,
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: 190,
                    height: 130,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _imageUrls.isNotEmpty ? _imageUrls.length : 1,
                      itemBuilder: (context, index) {
                        return Image.network(
                          _imageUrls.isNotEmpty
                              ? _imageUrls[index]
                              : 'https://via.placeholder.com/190x130',
                          width: 190,
                          height: 130.0,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: LoadingAnimationWidget.threeArchedCircle(
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text1(
                            text1: widget.hotel.title ?? 'No Title',
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 20,
                          )
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
                              ? Expanded(
                                  child: Text2(
                                    text2: widget.hotel.address!,
                                  ),
                                )
                              : const Text2(text2: 'No-data'),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text1(
                                text1: widget.hotel.price != null
                                    ? "Rp${widget.hotel.price}"
                                    : '0',
                                size: 18,
                                color: AppColors.tabColor,
                              ),
                              const Text2(text2: '/night'),
                            ],
                          ),
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
                                color: index < (widget.hotel.reviewScore ?? 0)
                                    ? AppColors.amberColor
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          Text2(
                            text2:
                                widget.hotel.reviewScore?.toString() ?? '0.0',
                          ),
                          const Spacer(),
                          const Text11(
                            text2: '10% Off',
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                ),
              ],
            ),
            if (widget.hotel.isFeatured == 1)
              Positioned(
                top: 5,
                left: 5,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.redAwesome,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Featured',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
