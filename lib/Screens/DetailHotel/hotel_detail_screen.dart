import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CommonWidgets/category_location_card.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomButton/custombtn.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCarousel/carousel_slide_image.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_covert_html.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_discount.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_location.dart';
import 'package:hotelbookingapp/CustomWidgets/task_card_service.dart';
import 'package:hotelbookingapp/Screens/DetailRoom/check_avaibility_screen.dart';
import 'package:hotelbookingapp/Screens/GoogleMaps/google_maps_hotel.dart';
import 'package:hotelbookingapp/Screens/Messages/no_messages.dart';
import 'package:hotelbookingapp/Screens/Reviews/rating_review_detail.dart';
import 'package:hotelbookingapp/Screens/Reviews/reviews.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            CarouselSlideImage(
                              pageController: _pageController,
                              imageUrls: state.data.gallery
                                      ?.map((e) => e.large is String
                                          ? e.large as String?
                                          : null)
                                      .toList() ??
                                  [],
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 4),
                                    decoration: const BoxDecoration(
                                      color: AppColors.redAwesome,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                    ),
                                    child: const Text1(
                                      text1: 'Featured',
                                      color: AppColors.white,
                                      size: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomTextEllipsis(
                                    text: state.data.rowData!.title ??
                                        AppLocalizations.of(context)!
                                            .textNoInfo,
                                    size: 15,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const SizedBox(height: 10),
                                  TextLocation(
                                    locationText: state.data.rowData?.address ??
                                        AppLocalizations.of(context)!
                                            .textNoInfo,
                                  ),
                                  const SizedBox(height: 10),
                                  const TextDiscount(
                                    initialPrice: '2.000.000',
                                    size: 14,
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text1(
                                        text1: AppLocalizations.of(context)!
                                            .textNight(state.data.rowData!.price
                                                .toString()),
                                        size: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.buttonColor,
                                      ),
                                      const Spacer(),
                                      RatingBar.readOnly(
                                        initialRating: state
                                                .data.rowData!.starRate
                                                ?.toDouble() ??
                                            0,
                                        filledIcon: Icons.star,
                                        emptyIcon: Icons.star_border,
                                        filledColor: AppColors.amberColor,
                                        size: 24,
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
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .textNoAuthor,
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
                                  CustomTextEllipsis(
                                    text: AppLocalizations.of(context)!
                                        .textDescription,
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
                                  CustomTextEllipsis(
                                    text: AppLocalizations.of(context)!
                                        .textLocCategory,
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
                                        CustomTextEllipsis(
                                          text: AppLocalizations.of(context)!
                                              .textExtraPrice,
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
                                        CustomTextEllipsis(
                                          text: AppLocalizations.of(context)!
                                              .textServiceFee,
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

                                  if (state.data.rowData?.mapLat != null &&
                                      state.data.rowData?.mapLng != null)
                                    Column(
                                      children: [
                                        // Google Maps
                                        Center(
                                          child: CustomTextEllipsis(
                                            text: AppLocalizations.of(context)!
                                                .textLocHotel,
                                            size: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        GoogleMapsHotel(
                                          initialPosition: LatLng(
                                            double.parse(state
                                                .data.rowData!.mapLat
                                                .toString()),
                                            double.parse(state
                                                .data.rowData!.mapLng
                                                .toString()),
                                          ),
                                          title:
                                              state.data.rowData?.title ?? '',
                                          snippet:
                                              state.data.rowData?.address ?? '',
                                          zoom: state.data.rowData!.mapZoom
                                              ?.toDouble(),
                                        ),
                                      ],
                                    ),
                                  const SizedBox(height: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RatingBar.readOnly(
                                            initialRating:
                                                state.data.rowData!.starRate ??
                                                    0.0,
                                            filledIcon: Icons.star,
                                            emptyIcon: Icons.star_border,
                                            filledColor: AppColors.amberColor,
                                            size: 28,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text1(
                                            text1:
                                                '${state.data.rowData!.reviewScore ?? 0}',
                                            size: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Center(
                                        child: Column(
                                          children: [
                                            Text1(
                                              text1: '(0 Reviews)',
                                              size: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(height: 4),
                                            Text1(
                                              text1:
                                                  'Outstanding: Rated 0 with 0 Reviews.',
                                              size: 14,
                                              color: AppColors.cadetGray,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 25),
                                      RatingReviewDetail(
                                        text: AppLocalizations.of(context)!
                                            .textStaff,
                                        rate: 0.33,
                                        star: 7.5,
                                        color: AppColors.amberColor,
                                      ),
                                      const SizedBox(height: 5),
                                      RatingReviewDetail(
                                        text: AppLocalizations.of(context)!
                                            .textFreeWifi,
                                        rate: 0.99,
                                        star: 7.5,
                                        color: AppColors.amberColor,
                                      ),
                                      const SizedBox(height: 5),
                                      RatingReviewDetail(
                                        text: AppLocalizations.of(context)!
                                            .textService,
                                        rate: 0.79,
                                        star: 3.5,
                                        color: AppColors.amberColor,
                                      ),
                                      const SizedBox(height: 5),
                                      RatingReviewDetail(
                                        text: AppLocalizations.of(context)!
                                            .textCleanliness,
                                        rate: 0.70,
                                        star: 0.5,
                                        color: AppColors.amberColor,
                                      ),
                                      const SizedBox(height: 5),
                                      RatingReviewDetail(
                                        text: AppLocalizations.of(context)!
                                            .textLuxury,
                                        rate: 0.67,
                                        star: 2.0,
                                        color: AppColors.amberColor,
                                      ),
                                      const SizedBox(height: 20),
                                      const ReviewContainer(
                                        image: 'images/c3.png',
                                        text1: 'Michael Johnson',
                                        text2: '3.8',
                                        text3: '2 weeks ago',
                                        reviewText:
                                            'Decent hotel but had some noise issues from the street.',
                                      ),
                                      const ReviewContainer(
                                        image: 'images/c4.png',
                                        text1: 'Emily Davis',
                                        text2: '5.0',
                                        text3: '1 month ago',
                                        reviewText:
                                            'Absolutely perfect! The amenities were top-notch and the view was amazing.',
                                      ),
                                      const ReviewContainer(
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
                  child: const Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Icons.message,
                        color: AppColors.white,
                        size: 26,
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
                  text: AppLocalizations.of(context)!.textSelecRoom,
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
