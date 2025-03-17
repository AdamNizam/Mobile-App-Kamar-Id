import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/CommonWidgets/category_location_card.dart';
import 'package:hotelbookingapp/CommonWidgets/galleryimages_widget.dart';
import 'package:hotelbookingapp/Screens/HomeScreen/error_card.dart';
import 'package:hotelbookingapp/Screens/HomeScreen/task_card_service.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:hotelbookingapp/Widgets/detailstext2.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:video_player/video_player.dart';

import '../../Constants/colors.dart';
import '../Booking/book_hotel.dart';

class HotelDetailsScreen extends StatefulWidget {
  final String? slug;
  const HotelDetailsScreen({super.key, this.slug = ''});

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  String selectedImage = 'images/LuxuryHotels.jpg';
  VideoPlayerController? _videoController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HotelBloc()
          ..add(
            GetDetailHotel(
              widget.slug.toString(),
            ),
          ),
        child: Stack(
          children: [
            BlocBuilder<HotelBloc, HotelState>(
              builder: (context, state) {
                if (state is HotelFailed) {
                  showCustomSnackbar(context, state.error);
                }

                if (state is GetAllHotelDetailSuccess) {
                  return Column(
                    children: [
                      selectedImage.startsWith('http')
                          ? Image.network(
                              selectedImage,
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                    .expectedTotalBytes ??
                                                1)
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                Icons.broken_image,
                                size: 100,
                                color: Colors.grey,
                              ),
                            )
                          : Image.asset(
                              selectedImage,
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Galeri gambar kecil
                              Center(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      if (state.allDetailHotel.gallery != null)
                                        ...state.allDetailHotel.gallery!.map(
                                          (urlGambar) {
                                            if (urlGambar.thumb is bool ||
                                                urlGambar.large is bool) {
                                              return const SizedBox();
                                            }
                                            return GalleryImage(
                                              imagePath: urlGambar.large,
                                              isSelected: selectedImage ==
                                                  urlGambar.large,
                                              onTap: () {
                                                setState(() {
                                                  selectedImage =
                                                      urlGambar.large;
                                                });
                                              },
                                            );
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text1(
                                    text1: state.allDetailHotel.row!.title
                                        .toString(),
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
                                    text2: state
                                            .allDetailHotel.row!.location?.name
                                            .toString() ??
                                        'Location not available',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              // Rating dan Harga
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RatingBar.readOnly(
                                    initialRating: state
                                            .allDetailHotel.row!.reviewScore
                                            ?.toDouble() ??
                                        0.0,
                                    filledIcon: Icons.star,
                                    emptyIcon: Icons.star_border,
                                    filledColor: AppColors.tabColor,
                                    size: 28,
                                  ),
                                  Text(
                                    '\$${state.allDetailHotel.row!.price.toString()}/night',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.buttonColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const CircleAvatar(
                                        radius: 18,
                                        backgroundImage: NetworkImage(
                                            "https://randomuser.me/api/portraits/women/1.jpg"),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.allDetailHotel.author!.name
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "2 days ago ",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey.shade600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
                              (state.allDetailHotel.row!.content != null &&
                                      state.allDetailHotel.row!.content!
                                          .isNotEmpty)
                                  ? HtmlWidget(
                                      state.allDetailHotel.row!.content
                                          .toString(),
                                      textStyle: const TextStyle(
                                          fontSize: 16, color: Colors.black87),
                                    )
                                  : const ErrorCard(
                                      message: 'Description is not available'),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text1(
                                text1: 'Location Category',
                                size: 17,
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      if (state.allDetailHotel
                                              .locationCategory !=
                                          null)
                                        ...state
                                            .allDetailHotel.locationCategory!
                                            .map(
                                          (category) {
                                            return CategoryLocationCard(
                                              icon: category.iconClass ?? '',
                                              title: category.name.toString(),
                                            );
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              const Text1(
                                text1: 'Extra Price',
                                size: 17,
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    state.allDetailHotel.row!.extraPrice !=
                                                null &&
                                            state.allDetailHotel.row!
                                                .extraPrice!.isNotEmpty
                                        ? state.allDetailHotel.row!.extraPrice!
                                            .map((extra) {
                                            return TaskCardService(
                                              title: extra.name, // Pastikan ada
                                              clientName:
                                                  "\$${extra.price}", // Pastikan ada
                                              backgroundColor: Colors.white,
                                              statusColor:
                                                  AppColors.buttonColor,
                                            );
                                          }).toList()
                                        : [
                                            const ErrorCard(
                                                message:
                                                    'Extra Price is not available')
                                          ],
                              ),
                              const SizedBox(height: 10),

                              const Text1(
                                text1: 'Service Fee',
                                size: 17,
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: state.allDetailHotel.row!
                                                .serviceFee !=
                                            null &&
                                        state.allDetailHotel.row!.serviceFee!
                                            .isNotEmpty
                                    ? state.allDetailHotel.row!.serviceFee!
                                        .map((service) {
                                        return TaskCardService(
                                          title: service.name,
                                          clientName: service.unit == 'fixed'
                                              ? '\$${service.price}'
                                              : '${service.price}%',
                                          backgroundColor: Colors.white,
                                          statusColor: AppColors.buttonColor,
                                        );
                                      }).toList()
                                    : [
                                        const ErrorCard(
                                          message:
                                              'Service Fee is not available',
                                        )
                                      ],
                              ),
                              const SizedBox(height: 10),

                              const Text1(
                                text1: 'Offers',
                                size: 17,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: state.allDetailHotel.row!.offer !=
                                            null &&
                                        state.allDetailHotel.row!.offer!
                                            .isNotEmpty
                                    ? state.allDetailHotel.row!.offer!
                                        .map((offer) {
                                        return Column(
                                          children: [
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.check_circle,
                                                  color: Colors.green),
                                              title: Text(offer.cancelPolicy),
                                            ),
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.check_circle,
                                                  color: Colors.green),
                                              title: Text(offer.foodPolicy),
                                            ),
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.check_circle,
                                                  color: Colors.green),
                                              title: Text(offer.moveDate),
                                            ),
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.check_circle,
                                                  color: Colors.green),
                                              title: Text(offer.breakfastType),
                                            ),
                                          ],
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
                      )),
                    ],
                  );
                }
                return Center(
                    child: LoadingAnimationWidget.hexagonDots(
                  color: AppColors.tabColor,
                  size: 50,
                ));
              },
            ),
            // Tombol booking di bagian bawah
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: CustomButton(
                text: 'Continue',
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
