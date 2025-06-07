// lib/CustomWidgets/CardAllHotel/card_all_hotel.dart

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/card_animation.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text2.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_discount.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_overflow.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_price.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_remaining.dart';
import 'package:hotelbookingapp/Models/HotelModel/result_filter_model.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class CardFilter extends StatefulWidget {
  final ResultFilterModel data;

  const CardFilter({super.key, required this.data});

  @override
  State<CardFilter> createState() => _CardFilterState();
}

class _CardFilterState extends State<CardFilter>
    with SingleTickerProviderStateMixin {
  late HotelCardAnimation _animation;

  @override
  void initState() {
    super.initState();
    _animation = HotelCardAnimation.init(vsync: this);
    _animation.controller.forward();
  }

  @override
  void dispose() {
    _animation.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return FadeTransition(
      opacity: _animation.fadeAnimation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: SlideTransition(
          position: _animation.slideAnimation,
          child: GestureDetector(
            onTap: () {
              showCustomSnackbar(context, 'fitur is not available');
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.beauBlue,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Hero(
                            tag: data.id,
                            child: Image.network(
                              data.imageId,
                              fit: BoxFit.cover,
                              width: 120,
                              height: 150,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
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
                                const Icon(
                                  Icons.star,
                                  size: 15,
                                  color: AppColors.white,
                                ),
                                const Text2(
                                  text2: '0.0',
                                  fontWeight: FontWeight.bold,
                                  size: 10,
                                  color: AppColors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextOverflow(
                              text: data.title,
                              color: AppColors.black,
                              size: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    size: 18, color: AppColors.tabColor),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text1(
                                    text1: AppLocalizations.of(context)!
                                        .textNoInfo,
                                    size: 13,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const TextDiscount(initialPrice: '2.000.00'),
                            const SizedBox(height: 5),
                            TextPrice(
                              price: AppLocalizations.of(context)!
                                  .textNight(data.price),
                            ),
                            const SizedBox(height: 5),
                            TextRemaining(
                              text: AppLocalizations.of(context)!
                                  .textRemaining('1'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
