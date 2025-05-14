import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/Blocs/wishlist/wishlist_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CommonWidgets/category_location_card.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomButton/custom_button_icon.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomButton/custombtn.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_covert_html.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/CustomWidgets/task_card_service.dart';
import 'package:hotelbookingapp/Models/WishlistModel/request_wishlist.dart';
import 'package:hotelbookingapp/Screens/DetailRoom/check_avaibility_screen.dart';
import 'package:hotelbookingapp/Screens/GoogleMaps/google_maps_hotel.dart';
import 'package:hotelbookingapp/Screens/Messages/no_messages.dart';
import 'package:hotelbookingapp/Screens/Reviews/rating_review_detail.dart';
import 'package:hotelbookingapp/Screens/Reviews/reviews.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Themes/colors.dart';

class HotelDetailsScreen extends StatefulWidget {
  final String? slug;
  const HotelDetailsScreen({super.key, this.slug = ''});

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  final PageController _pageController = PageController();
  String selectedImage = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelBloc()
        ..add(
          GetDetailHotel(widget.slug!),
        ),
      child: BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          if (state is HotelFailed) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showCustomSnackbar(context, state.error);
            });
          }
          if (state is GetAllHotelDetailSuccess) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: 260,
                                  width: double.infinity,
                                  child: PageView.builder(
                                    controller: _pageController,
                                    itemCount: state.data.gallery?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      final large =
                                          state.data.gallery?[index].large;

                                      final imageUrl =
                                          large is String ? large : null;

                                      return ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                        ),
                                        child: imageUrl != null
                                            ? Image.network(
                                                imageUrl,
                                                height: 260,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return const Center(
                                                    child: Icon(
                                                      Icons.broken_image,
                                                      size: 150,
                                                      color: AppColors.beauBlue,
                                                    ),
                                                  );
                                                },
                                              )
                                            : const Center(
                                                child: Icon(
                                                  Icons.image_not_supported,
                                                  size: 150,
                                                  color: AppColors.beauBlue,
                                                ),
                                              ),
                                      );
                                    },
                                  ),
                                ),
                                Positioned(
                                  top: 15,
                                  left: 10,
                                  child: CustomButtonIcon(
                                    icon: Icons.arrow_back,
                                    size: 20,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                Positioned(
                                  top: 15,
                                  right: 10,
                                  child: Row(
                                    children: [
                                      CustomButtonIcon(
                                        icon: Icons.share,
                                        size: 20,
                                        onTap: () {
                                          showCustomSnackbar(context,
                                              'fiture is not availabe');
                                        },
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      CustomButtonIcon(
                                        icon: Icons.more_vert,
                                        size: 20,
                                        onTap: () {
                                          showCustomSnackbar(context,
                                              'fiture is not availabe');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 16,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: SmoothPageIndicator(
                                      controller: _pageController,
                                      count: state.data.gallery!.length,
                                      effect: ExpandingDotsEffect(
                                        dotHeight: 8,
                                        dotWidth: 8,
                                        activeDotColor: AppColors.white,
                                        dotColor:
                                            AppColors.beauBlue.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomTextEllipsis(
                                        text: state.data.rowData!.title
                                            .toString(),
                                        size: 15,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const Spacer(),
                                      BlocBuilder<WishlistBloc, WishlistState>(
                                        builder: (context, stateWishlist) {
                                          if (stateWishlist
                                              is WishlistLoading) {
                                            return LoadingAnimationWidget.beat(
                                              color: AppColors.buttonColor,
                                              size: 27,
                                            );
                                          }
                                          if (stateWishlist
                                              is PostWishlistSuccess) {
                                            return const Icon(
                                              Icons.favorite,
                                              color: AppColors.redAwesome,
                                              size: 30,
                                            );
                                          }

                                          return GestureDetector(
                                            onTap: () {
                                              context.read<WishlistBloc>().add(
                                                    PostWishlistEvent(
                                                      RequestWishlist(
                                                        objectId: state
                                                            .data.rowData!.id!,
                                                      ),
                                                    ),
                                                  );
                                            },
                                            child: const Icon(
                                              Icons.favorite_outline,
                                              color: AppColors.redAwesome,
                                              size: 26,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 20,
                                        color: AppColors.buttonColor,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text1(
                                          text1: state.data.rowData?.address ??
                                              'No location info',
                                          size: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      RatingBar.readOnly(
                                        initialRating: state
                                                .data.rowData!.reviewScore
                                                ?.toDouble() ??
                                            3,
                                        filledIcon: Icons.star,
                                        emptyIcon: Icons.star_border,
                                        filledColor: AppColors.amberColor,
                                        size: 24,
                                      ),
                                      const Spacer(),
                                      Text1(
                                        text1:
                                            'Rp${state.data.rowData!.price.toString()}',
                                        size: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.buttonColor,
                                      ),
                                      const Text1(
                                        text1: '/night',
                                        size: 14,
                                        color: AppColors.cadetGray,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 18,
                                            backgroundImage: NetworkImage(
                                              state.data.author?.avatar ??
                                                  'https://via.placeholder.com/150',
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomTextEllipsis(
                                                  text:
                                                      state.data.author!.name ??
                                                          'Unknown Author',
                                                  size: 13,
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                const Text1(
                                                  text1: "Author Hotel",
                                                  size: 11,
                                                  color: AppColors.cadetGray,
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
                                  const CustomTextEllipsis(
                                    text: 'Hotel Description',
                                    size: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                  const SizedBox(height: 10),
                                  if (state.data.rowData!.content != null)
                                    TextConvertHTML(
                                      text: state.data.rowData!.content ??
                                          'No Description info',
                                    ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // Location Category Hotel
                                  const CustomTextEllipsis(
                                    text: 'Location Category',
                                    size: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                  const SizedBox(height: 20),
                                  if (state.data.locationCategory!.isNotEmpty)
                                    Center(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            if (state.data.locationCategory !=
                                                null)
                                              ...state.data.locationCategory!
                                                  .map(
                                                (category) {
                                                  return CategoryLocationCard(
                                                    icon: category.iconClass ??
                                                        '',
                                                    title: category.name
                                                        .toString(),
                                                  );
                                                },
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  const SizedBox(height: 20),
                                  if (state
                                      .data.rowData!.extraPrice!.isNotEmpty)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const CustomTextEllipsis(
                                          text: 'Extra Price',
                                          size: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black,
                                        ),
                                        const SizedBox(height: 10),
                                        Column(
                                          children: state
                                              .data.rowData!.extraPrice!
                                              .map((extra) {
                                            return TaskCardService(
                                              title: extra.name,
                                              clientName: "Rp${extra.price}",
                                              backgroundColor: AppColors.white,
                                              statusColor:
                                                  AppColors.buttonColor,
                                            );
                                          }).toList(),
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),

                                  // Service Hotel
                                  if (state
                                      .data.rowData!.serviceFee!.isNotEmpty)
                                    Column(
                                      children: [
                                        const CustomTextEllipsis(
                                          text: 'Serive Fee',
                                          size: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black,
                                        ),
                                        const SizedBox(height: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: state
                                              .data.rowData!.serviceFee!
                                              .map((service) {
                                            return TaskCardService(
                                              title: service.name,
                                              clientName:
                                                  service.unit == 'fixed'
                                                      ? 'Rp${service.price}'
                                                      : '${service.price}%',
                                              backgroundColor: AppColors.white,
                                              statusColor:
                                                  AppColors.buttonColor,
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),

                                  const SizedBox(height: 10),
                                  // Offer Hotel
                                  const CustomTextEllipsis(
                                    text: 'Rules Hotel',
                                    size: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: state.data.rowData!.offer!
                                          .map((offer) {
                                        return Column(
                                          children: [
                                            if (offer.cancelPolicy != null)
                                              ListTile(
                                                leading: const Icon(
                                                    Icons.check_circle,
                                                    color:
                                                        AppColors.buttonColor),
                                                title: Text(
                                                    offer.cancelPolicy ?? ''),
                                              ),
                                            if (offer.foodPolicy != null)
                                              ListTile(
                                                leading: const Icon(
                                                    Icons.check_circle,
                                                    color:
                                                        AppColors.buttonColor),
                                                title: Text(
                                                    offer.foodPolicy ?? ''),
                                              ),
                                            if (offer.moveDate != null)
                                              ListTile(
                                                leading: const Icon(
                                                    Icons.check_circle,
                                                    color:
                                                        AppColors.buttonColor),
                                                title:
                                                    Text(offer.moveDate ?? ''),
                                              ),
                                            if (offer.breakfastType != null)
                                              ListTile(
                                                leading: const Icon(
                                                    Icons.check_circle,
                                                    color:
                                                        AppColors.buttonColor),
                                                title: Text(
                                                    offer.breakfastType ?? ''),
                                              ),
                                          ],
                                        );
                                      }).toList()),

                                  const SizedBox(height: 10),

                                  if (state.data.rowData!.location != null)
                                    Column(
                                      children: [
                                        // Google Maps
                                        const Center(
                                          child: CustomTextEllipsis(
                                            text: 'Location Hotel',
                                            size: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        GoogleMapsHotel(
                                          initialPosition: LatLng(
                                            double.parse(state
                                                .data.rowData!.location!.mapLat
                                                .toString()),
                                            double.parse(state
                                                .data.rowData!.location!.mapLng
                                                .toString()),
                                          ),
                                          title: state.data.rowData!.title
                                              .toString(),
                                          snippet: state
                                              .data.rowData!.location!.name
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                  const SizedBox(height: 10),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButton: SizedBox(
                width: 48,
                height: 48,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NoMessages(),
                      ),
                    );
                  },
                  backgroundColor: AppColors.buttonColor,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(
                        Icons.message,
                        color: AppColors.white,
                        size: 26,
                      ),
                      Positioned(
                        right: -3,
                        top: -8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppColors.redAwesome,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '1',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: CustomButton(
                  text: 'Select Room',
                  onTap: () {
                    if (state.data.rowData == null) {
                      showCustomSnackbar(context, 'Hotel not available');
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CheckAvailabilityScreen(
                            dataHotel: state.data.rowData!,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: LoadingAnimationWidget.hexagonDots(
                color: AppColors.tabColor,
                size: 50,
              ),
            ),
          );
        },
      ),
    );
  }
}
