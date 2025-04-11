import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/CommonWidgets/category_location_card.dart';
import 'package:hotelbookingapp/CommonWidgets/galleryimages_widget.dart';
import 'package:hotelbookingapp/Screens/DetailHotel/chek_avaibility_screen.dart';
import 'package:hotelbookingapp/Screens/GoogleMaps/google_maps_hotel.dart';
import 'package:hotelbookingapp/Screens/Reviews/rating_review_detail.dart';
import 'package:hotelbookingapp/Screens/Reviews/reviews.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:hotelbookingapp/Widgets/detailstext2.dart';
import 'package:hotelbookingapp/Widgets/error_card.dart';
import 'package:hotelbookingapp/Widgets/task_card_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Constants/colors.dart';

class HotelDetailsScreen extends StatefulWidget {
  final String? slug;
  const HotelDetailsScreen({super.key, this.slug = ''});

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  String selectedImage = '';
  String? videoId;
  bool isVideoPlaying = true;
  YoutubePlayerController? _youtubeController;

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
                  String? videoUrl = state.data.row!.video;
                  String? videoId;

                  if (videoUrl != null && videoUrl.isNotEmpty) {
                    videoId = YoutubePlayer.convertUrlToId(videoUrl);
                  }

                  videoId ??= '2DEvbRl9GZU';

                  _youtubeController ??= YoutubePlayerController(
                    initialVideoId: videoId,
                    flags: const YoutubePlayerFlags(
                      autoPlay: true,
                      mute: false,
                    ),
                  );

                  return Column(
                    children: [
                      isVideoPlaying
                          ? YoutubePlayerBuilder(
                              player: YoutubePlayer(
                                controller: _youtubeController!,
                                showVideoProgressIndicator: true,
                                onReady: () {
                                  if (isVideoPlaying) {
                                    _youtubeController!.play();
                                  }
                                },
                              ),
                              builder: (context, player) {
                                return SizedBox(
                                  width: double.infinity,
                                  height: 250,
                                  child: player,
                                );
                              },
                            )
                          : Image.network(
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
                                color: AppColors.beauBlue,
                              ),
                            ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Galeri gambar kecil
                              Center(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      if (state.data.gallery != null)
                                        ...state.data.gallery!.map(
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
                                                  isVideoPlaying = false;
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
                              state.data.row!.isFeatured == 1
                                  ? Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: AppColors.redAwesome,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: const Text(
                                        'Featured',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  : Container(),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text1(
                                    text1: state.data.row!.title.toString(),
                                    size: 17,
                                  ),
                                  const Icon(Icons.favorite_border,
                                      color: AppColors.redAwesome, size: 30),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.location_on,
                                      size: 20, color: AppColors.tabColor),
                                  const SizedBox(width: 8),
                                  Text2(
                                    text2: state.data.row!.location?.name
                                            .toString() ??
                                        'Location not available',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              // Rating dan Harga
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RatingBar.readOnly(
                                    initialRating: state.data.row!.reviewScore
                                            ?.toDouble() ??
                                        3,
                                    filledIcon: Icons.star,
                                    emptyIcon: Icons.star_border,
                                    filledColor: AppColors.amberColor,
                                    size: 27,
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Rp${state.data.row!.price.toString()}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.buttonColor,
                                    ),
                                  ),
                                  const Text(
                                    '/night',
                                    style: TextStyle(
                                      fontSize: 17,
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
                                          "https://randomuser.me/api/portraits/men/1.jpg",
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.data.author!.name
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Text(
                                              "2 days ago ",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: AppColors.cadetGray,
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
                              Text(
                                'Hotel Description',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              (state.data.row!.content != null &&
                                      state.data.row!.content!.isNotEmpty)
                                  ? HtmlWidget(
                                      state.data.row!.content.toString(),
                                      textStyle:
                                          GoogleFonts.poppins(fontSize: 14),
                                    )
                                  : const ErrorCard(
                                      message: 'Description is not available',
                                    ),
                              const SizedBox(
                                height: 10,
                              ),

                              // Location Category Hotel
                              Text(
                                'Location Category',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      if (state.data.locationCategory != null)
                                        ...state.data.locationCategory!.map(
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
                              // Extra Price Hotel
                              Text(
                                'Extra Price',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: state.data.row!.extraPrice != null &&
                                        state.data.row!.extraPrice!.isNotEmpty
                                    ? state.data.row!.extraPrice!.map((extra) {
                                        return TaskCardService(
                                          title: extra.name, // Pastikan ada
                                          clientName:
                                              "Rp${extra.price}", // Pastikan ada
                                          backgroundColor: Colors.white,
                                          statusColor: AppColors.buttonColor,
                                        );
                                      }).toList()
                                    : [
                                        const ErrorCard(
                                            message:
                                                'Extra Price is not available')
                                      ],
                              ),
                              const SizedBox(height: 10),
                              // Service Hotel
                              Text(
                                'Service Fee',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: state.data.row!.serviceFee != null &&
                                        state.data.row!.serviceFee!.isNotEmpty
                                    ? state.data.row!.serviceFee!
                                        .map((service) {
                                        return TaskCardService(
                                          title: service.name,
                                          clientName: service.unit == 'fixed'
                                              ? 'Rp${service.price}'
                                              : '${service.price}%',
                                          backgroundColor: AppColors.white,
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
                              // Offer Hotel
                              const Text1(
                                text1: 'Offers',
                                size: 17,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: state.data.row!.offer != null &&
                                        state.data.row!.offer!.isNotEmpty
                                    ? state.data.row!.offer!.map((offer) {
                                        return Column(
                                          children: [
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.check_circle,
                                                  color: AppColors.buttonColor),
                                              title: Text(offer.cancelPolicy),
                                            ),
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.check_circle,
                                                  color: AppColors.buttonColor),
                                              title: Text(offer.foodPolicy),
                                            ),
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.check_circle,
                                                  color: AppColors.buttonColor),
                                              title: Text(offer.moveDate),
                                            ),
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.check_circle,
                                                  color: AppColors.buttonColor),
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
                              // Google Maps
                              const Center(
                                child: Text1(
                                  text1: 'Maps',
                                  size: 17,
                                ),
                              ),
                              const SizedBox(height: 20),
                              GoogleMapsHotel(
                                initialPosition: LatLng(
                                  double.parse(
                                      state.data.row!.location!.mapLat),
                                  double.parse(
                                      state.data.row!.location!.mapLng),
                                ),
                                title: state.data.row!.title.toString(),
                                snippet:
                                    state.data.row!.location!.name.toString(),
                              ),
                              const SizedBox(height: 10),

                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RatingBar.readOnly(
                                        initialRating: 3,
                                        filledIcon: Icons.star,
                                        emptyIcon: Icons.star_border,
                                        filledColor: AppColors.amberColor,
                                        size: 28,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '5.0',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          '(1,092 Reviews)',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Outstanding: Rated 0 with 0 Reviews.',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.cadetGray,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  RatingReviewDetail(
                                    text: 'Staf',
                                    rate: 0.33,
                                    star: 7.5,
                                    color: AppColors.amberColor,
                                  ),
                                  SizedBox(height: 5),
                                  RatingReviewDetail(
                                    text: 'Kenyamanan',
                                    rate: 0.99,
                                    star: 7.5,
                                    color: AppColors.amberColor,
                                  ),
                                  SizedBox(height: 5),
                                  RatingReviewDetail(
                                    text: 'Free Wi-Fi',
                                    rate: 0.79,
                                    star: 3.5,
                                    color: AppColors.amberColor,
                                  ),
                                  SizedBox(height: 5),
                                  RatingReviewDetail(
                                    text: 'Fasilitas',
                                    rate: 0.70,
                                    star: 0.5,
                                    color: AppColors.amberColor,
                                  ),
                                  SizedBox(height: 5),
                                  RatingReviewDetail(
                                    text: 'Kebersihan',
                                    rate: 0.67,
                                    star: 2.0,
                                    color: AppColors.amberColor,
                                  ),
                                  SizedBox(height: 5),
                                  RatingReviewDetail(
                                    text: 'Lokasi',
                                    rate: 0.40,
                                    star: 7.5,
                                    color: AppColors.amberColor,
                                  ),
                                  SizedBox(height: 20),
                                  ReviewContainer(
                                    image: 'images/c3.png',
                                    text1: 'Michael Johnson',
                                    text2: '3.8',
                                    text3: '2 weeks ago',
                                    reviewText:
                                        'Decent hotel but had some noise issues from the street.',
                                  ),
                                  ReviewContainer(
                                    image: 'images/c4.png',
                                    text1: 'Emily Davis',
                                    text2: '5.0',
                                    text3: '1 month ago',
                                    reviewText:
                                        'Absolutely perfect! The amenities were top-notch and the view was amazing.',
                                  ),
                                  ReviewContainer(
                                    image: 'images/c5.png',
                                    text1: 'William Brown',
                                    text2: '2.5',
                                    text3: '1 month ago',
                                    reviewText:
                                        'Not great. The room did not meet my expectations based on the photos.',
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                      // Tombol booking di bagian bawah
                      Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: CustomButton(
                            text: 'Select Room',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CheckAvailabilityScreen(
                                  hotelId: state.data.row!.id,
                                  hotelName: state.data.row!.title,
                                  imageUrl: state.data.row!.imageId,
                                  location: state.data.row!.location!.name,
                                ),
                              ));
                            },
                          ),
                        ),
                      ),
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
          ],
        ),
      ),
    );
  }
}
