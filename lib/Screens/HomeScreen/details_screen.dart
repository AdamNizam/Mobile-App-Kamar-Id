import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/CommonWidgets/galleryimages_widget.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:hotelbookingapp/Widgets/detailstext2.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Constants/colors.dart';
import '../Booking/book_hotel.dart';

class HotelDetailsScreen extends StatefulWidget {
  final String? slug;
  const HotelDetailsScreen({
    super.key,
    this.slug = '',
  });

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  String selectedImage = 'images/LuxuryHotels.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            HotelBloc()..add(GetDetailHotel(widget.slug.toString())),
        child: Stack(
          children: [
            Column(
              children: [
                // Gambar utama
                Stack(
                  children: [
                    Image.asset(
                      selectedImage,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 40,
                      left: 16,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: BlocBuilder<HotelBloc, HotelState>(
                    builder: (context, state) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (state is HotelFailed) {
                          showCustomSnackbar(context, state.error);
                        }
                      });
                      if (state is HotelDetailSuccess) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Galeri gambar kecil
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GalleryImage(
                                          imagePath:
                                              'images/WaterfrontHotels.jpg',
                                          isSelected: selectedImage ==
                                              'images/WaterfrontHotels.jpg',
                                          onTap: () {
                                            setState(() {
                                              selectedImage =
                                                  'images/WaterfrontHotels.jpg';
                                            });
                                          }),
                                      GalleryImage(
                                          imagePath:
                                              'images/Eco-FriendlyHotels.jpg',
                                          isSelected: selectedImage ==
                                              'images/Eco-FriendlyHotels.jpg',
                                          onTap: () {
                                            setState(() {
                                              selectedImage =
                                                  'images/Eco-FriendlyHotels.jpg';
                                            });
                                          }),
                                      GalleryImage(
                                          imagePath:
                                              'images/AdventureHotels.jpg',
                                          isSelected: selectedImage ==
                                              'images/AdventureHotels.jpg',
                                          onTap: () {
                                            setState(() {
                                              selectedImage =
                                                  'images/AdventureHotels.jpg';
                                            });
                                          }),
                                    ]),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text1(
                                      text1: state.hotelDetail.title.toString(),
                                      size: 17,
                                    ),
                                    const Icon(Icons.favorite_border,
                                        color: Colors.red, size: 30),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        size: 20, color: AppColors.tabColor),
                                    const SizedBox(width: 8),
                                    Text2(
                                      text2: state.hotelDetail.location?.name
                                              .toString() ??
                                          'Location not available',
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                // Rating dan Harga
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RatingBar.readOnly(
                                      initialRating: state
                                              .hotelDetail.reviewScore
                                              ?.toDouble() ??
                                          0.0,
                                      filledIcon: Icons.star,
                                      emptyIcon: Icons.star_border,
                                      filledColor: AppColors.tabColor,
                                      size: 28,
                                    ),
                                    Text(
                                      '\$${state.hotelDetail.price.toString()}/night',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.buttonColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),

                                // Deskripsi hotel
                                const Text1(
                                  text1: 'Hotel Description',
                                  size: 17,
                                ),
                                const SizedBox(height: 10),
                                (state.hotelDetail.content != null &&
                                        state.hotelDetail.content!.isNotEmpty)
                                    ? HtmlWidget(
                                        state.hotelDetail.content.toString(),
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      )
                                    : const Text(
                                        'Description is not available',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black54,
                                        ),
                                      ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Extra Price',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      state.hotelDetail.extraPrice != null &&
                                              state.hotelDetail.extraPrice!
                                                  .isNotEmpty
                                          ? state.hotelDetail.extraPrice!
                                              .map((extra) {
                                              return Text(
                                                '• ${extra.name} + ${extra.price} ',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              );
                                            }).toList()
                                          : [
                                              const Text(
                                                'Extra Price is not available',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Service Fee',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      state.hotelDetail.serviceFee != null &&
                                              state.hotelDetail.serviceFee!
                                                  .isNotEmpty
                                          ? state.hotelDetail.serviceFee!
                                              .map((extra) {
                                              return Text(
                                                '• ${extra.name} + ${extra.price} + ${extra.desc} + ${extra.unit}',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              );
                                            }).toList()
                                          : [
                                              const Text(
                                                'Service Fee is not available',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Offer',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: state.hotelDetail.offer != null &&
                                          state.hotelDetail.offer!.isNotEmpty
                                      ? state.hotelDetail.offer!.map((offer) {
                                          return Text(
                                            '• ${offer.breakfastType} • ${offer.cancelPolicy}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          );
                                        }).toList()
                                      : [
                                          const Text(
                                            'Buffer is not available',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                ),
                                const SizedBox(height: 10),

                                const SizedBox(height: 20),
                                Container(
                                  height: 350,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                        offset: Offset(2, 4),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 100),
                              ],
                            ),
                          ),
                        );
                      }
                      return Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: AppColors.tabColor,
                          size: 50,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            // Tombol booking di bagian bawah
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: CustomButton(
                text: 'Booking Now',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BookHotelScreen(),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
