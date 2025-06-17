import 'dart:convert';

import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/handler_animation.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/tooltip/tooltip_box.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/Blocs/filter/filter_hotel_bloc.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomButton/custombtn.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text2.dart';
import 'package:hotelbookingapp/Models/HotelModel/hotel_all_model.dart';
import 'package:hotelbookingapp/Models/HotelModel/request_filter_model.dart';
import 'package:hotelbookingapp/Shared/shared_methods.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

void showFilterSelectionModal(BuildContext context) {
  DateTime? checkInDate;
  DateTime? checkOutDate;

  double minVal = 200000;
  double maxVal = 500000;
  int? expandedIndex;

  int? selectedLocationId;

  List<int> selectedTerms = [];
  List<int> selectedStarRate = [];
  List<int> selectedReviewScore = [];

  Future<void> selectDate(BuildContext context, bool isCheckIn,
      Function(DateTime) onDatePicked) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(
              primary: AppColors.buttonColor,
              onPrimary: AppColors.white,
              onSurface: AppColors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.buttonColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      onDatePicked(picked);
    }
  }

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.bgColor,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(24),
      ),
    ),
    builder: (context) {
      List<ListLocation>? locationParent = [];
      List<Attribute>? attributesCategory = [];

      dynamic selectedLocation;

      return StatefulBuilder(
        builder: (context, setState) {
          final hotelState = context.watch<HotelBloc>().state;
          if (hotelState is HotelSuccess) {
            locationParent = hotelState.data.data?.listLocation;
            attributesCategory = hotelState.data.data?.attributes;
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 5,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: AppColors.cadetGray,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedLocation != null
                              ? AppColors.buttonColor
                              : AppColors.blueGrey,
                          width: 1,
                        ),
                      ),
                      child: DropdownButton<dynamic>(
                        isExpanded: true,
                        underline: const SizedBox(),
                        value: selectedLocation,
                        hint: const Row(
                          children: [
                            Icon(
                              Icons.place,
                              color: AppColors.cadetGray,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text2(
                              text2: 'Cari lokasi anda saat ini',
                              fontWeight: FontWeight.w500,
                              size: 14,
                              color: AppColors.cadetGray,
                            ),
                          ],
                        ),
                        items: locationParent!.expand((location) {
                          final List<DropdownMenuItem<dynamic>> items = [];

                          items.add(
                            DropdownMenuItem<dynamic>(
                              value: location,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.place,
                                    color: AppColors.cadetGray,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text2(
                                    text2: '${location.name}',
                                    color: AppColors.black,
                                    size: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          );

                          // Child items
                          if (location.children != null &&
                              location.children!.isNotEmpty) {
                            for (var child in location.children!) {
                              items.add(
                                DropdownMenuItem<dynamic>(
                                  value: child,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.subdirectory_arrow_right,
                                          color: AppColors.button2Color,
                                        ),
                                        const SizedBox(width: 8),
                                        Text2(
                                          text2: child.name ?? '',
                                          color: AppColors.black,
                                          size: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          }

                          return items;
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedLocation = value;

                            print('Tipe value: ${value.runtimeType}');

                            if (value is ListLocation) {
                              print('Parent dipilih: ${value.name}');
                            }
                            if (value is Term) {
                              selectedLocationId = value.id!;
                              showCustomSnackbar(context,
                                  'Lokasi yang dipilih: ${value.name}');
                            }
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              selectDate(context, false, (picked) {
                                setState(() => checkInDate = picked);
                              });
                            },
                            child: _buildDateCard(
                              icon: Icons.login,
                              label: 'Check-in',
                              date: checkInDate,
                              context: context,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              selectDate(context, true, (picked) {
                                setState(() => checkOutDate = picked);
                              });
                            },
                            child: _buildDateCard(
                              icon: Icons.logout,
                              label: 'Check-out',
                              date: checkOutDate,
                              context: context,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: const BoxDecoration(color: AppColors.bgColor),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text1(
                            text1: 'Rentan harga :',
                            fontWeight: FontWeight.w500,
                            color: AppColors.cadetGray,
                            size: 13,
                          ),
                          FlutterSlider(
                            values: [minVal, maxVal],
                            rangeSlider: true,
                            max: 2000000,
                            min: 0,
                            trackBar: const FlutterSliderTrackBar(
                              activeTrackBarHeight: 4,
                              inactiveTrackBarHeight: 4,
                              activeTrackBar:
                                  BoxDecoration(color: AppColors.buttonColor),
                              inactiveTrackBar:
                                  BoxDecoration(color: AppColors.beauBlue),
                            ),
                            handlerHeight: 24,
                            handlerWidth: 24,
                            handler: FlutterSliderHandler(
                              decoration:
                                  const BoxDecoration(), // remove shadow
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.buttonColor.withOpacity(0.8),
                                  border: Border.all(
                                      color: AppColors.white, width: 2),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColors.doggerBlue,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            rightHandler: FlutterSliderHandler(
                              decoration: const BoxDecoration(),
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.buttonColor.withOpacity(0.8),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColors.doggerBlue,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            tooltip: FlutterSliderTooltip(
                              // format: (String value) => 'Rp${int.parse(value)}',
                              textStyle: const TextStyle(fontSize: 12),
                              boxStyle: FlutterSliderTooltipBox(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            handlerAnimation:
                                const FlutterSliderHandlerAnimation(
                              curve: Curves.elasticOut,
                              reverseCurve: Curves.bounceIn,
                              duration: Duration(milliseconds: 500),
                              scale: 1.5,
                            ),
                            onDragging: (handlerIndex, lowerValue, upperValue) {
                              setState(() {
                                minVal = lowerValue;
                                maxVal = upperValue;
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text1(
                                text1: 'Min Rp${formatToRp(minVal.toInt())}',
                                fontWeight: FontWeight.w400,
                                color: AppColors.cadetGray,
                                size: 12,
                              ),
                              Text1(
                                text1: 'Max Rp${formatToRp(maxVal.toInt())}',
                                fontWeight: FontWeight.w400,
                                color: AppColors.cadetGray,
                                size: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text1(
                          text1:
                              'Rating hotel (${selectedStarRate.isNotEmpty ? 1 : 0})',
                          fontWeight: FontWeight.w500,
                          size: 14,
                          color: AppColors.cadetGray,
                        ),
                        const SizedBox(width: 8),
                        AnimatedRatingStars(
                          initialRating: selectedStarRate.isNotEmpty
                              ? selectedStarRate.first.toDouble()
                              : 0.0,
                          minRating: 0.0,
                          maxRating: 5.0,
                          filledColor: AppColors.amberColor,
                          emptyColor: AppColors.cadetGray,
                          filledIcon: Icons.star,
                          halfFilledIcon: Icons.star_half,
                          emptyIcon: Icons.star_border,
                          customFilledIcon: Icons.star,
                          customHalfFilledIcon: Icons.star_half,
                          customEmptyIcon: Icons.star_border,
                          displayRatingValue: false,
                          interactiveTooltips: true,
                          starSize: 20.0,
                          animationDuration: const Duration(milliseconds: 300),
                          animationCurve: Curves.easeInOut,
                          readOnly: false,
                          onChanged: (double rating) {
                            setState(() {
                              final selected = rating.round();
                              if (selectedStarRate.contains(selected)) {
                                selectedStarRate.remove(selected);
                              } else {
                                selectedStarRate.clear();
                                selectedStarRate.add(selected);
                              }
                            });
                            print('Rating: $rating');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text1(
                          text1: 'Review Score :',
                          fontWeight: FontWeight.w500,
                          size: 14,
                          color: AppColors.cadetGray,
                        ),
                        const SizedBox(height: 10),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final double itemWidth =
                                (constraints.maxWidth - 40) / 5;
                            return Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: List.generate(5, (index) {
                                int score = index + 1;
                                bool isSelected =
                                    selectedReviewScore.contains(score);
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isSelected) {
                                        selectedReviewScore.remove(score);
                                      } else {
                                        selectedReviewScore.add(score);
                                      }
                                    });
                                  },
                                  child: SizedBox(
                                    width: itemWidth,
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? AppColors.button2Color
                                                .withOpacity(0.1)
                                            : Colors.transparent,
                                        border: Border.all(
                                          color: isSelected
                                              ? AppColors.buttonColor
                                              : AppColors.cadetGray,
                                        ),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text1(
                                            text1: "$score.0",
                                            color: AppColors.cadetGray,
                                            fontWeight: FontWeight.w500,
                                            size: 12,
                                          ),
                                          const SizedBox(width: 2),
                                          Icon(
                                            Icons.star,
                                            size: 14,
                                            color: isSelected
                                                ? AppColors.buttonColor
                                                : AppColors.cadetGray,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          attributesCategory!.asMap().entries.map((entry) {
                        int index = entry.key;
                        var atr = entry.value;
                        bool isExpanded = expandedIndex == index;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  expandedIndex = isExpanded ? null : index;
                                });
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text1(
                                        text1: '${atr.name}',
                                        fontWeight: FontWeight.w500,
                                        size: 14,
                                        color: AppColors.cadetGray,
                                      ),
                                    ),
                                    Icon(
                                      isExpanded
                                          ? Icons.expand_less
                                          : Icons.expand_more,
                                      size: 20,
                                      color: AppColors.cadetGray,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (isExpanded)
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: atr.terms!.map((subAttr) {
                                    bool isSelected =
                                        selectedTerms.contains(subAttr.id);
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (isSelected) {
                                            selectedTerms.remove(subAttr.id!);
                                          } else {
                                            selectedTerms.add(subAttr.id!);
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? AppColors.buttonColor
                                                  .withOpacity(0.1)
                                              : Colors.transparent,
                                          border: Border.all(
                                            color: isSelected
                                                ? AppColors.buttonColor
                                                : AppColors.cadetGray,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              isSelected
                                                  ? Icons.check
                                                  : Icons.add,
                                              size: 16,
                                              color: isSelected
                                                  ? AppColors.buttonColor
                                                  : AppColors.cadetGray,
                                            ),
                                            const SizedBox(width: 4),
                                            Text1(
                                              text1: '${subAttr.name}',
                                              size: 12,
                                              fontWeight: FontWeight.w400,
                                              color: isSelected
                                                  ? AppColors.buttonColor
                                                  : AppColors.cadetGray,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                          ],
                        );
                      }).toList(),
                    ),
                    CustomButton(
                      text: AppLocalizations.of(context)!.textSave,
                      onTap: () {
                        if (checkInDate != null && checkOutDate != null) {
                          Navigator.of(context).pop();

                          final dataRequest = RequestFilterModel(
                            locationId: selectedLocationId,
                            start: formatDateToSlash(checkInDate!),
                            end: formatDateToSlash(checkOutDate!),
                            date:
                                '${formatDateToSlash(checkInDate!)} - ${formatDateToSlash(checkOutDate!)}',
                            priceRange: '${minVal.toInt()};${maxVal.toInt()}',
                            starRate: selectedStarRate,
                            terms: selectedTerms,
                            reviewScore: selectedReviewScore,
                          );
                          print(
                            'Data Request FILTER HOTEL: ${jsonEncode(dataRequest.toFormData())}',
                          );

                          context
                              .read<FilterHotelBloc>()
                              .add(PostFilterHotel(dataRequest));
                        } else {
                          showCustomSnackbar(context,
                              AppLocalizations.of(context)!.messageNoDate);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _buildDateCard({
  required IconData icon,
  required String label,
  required DateTime? date,
  required BuildContext context,
}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border.all(
        color: date != null ? AppColors.buttonColor : AppColors.blueGrey,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Icon(
          icon,
          color: AppColors.cadetGray,
          size: 20,
        ),
        const SizedBox(width: 12),
        Text1(
          text1: date != null ? formatDateToSlash(date) : label,
          color: AppColors.cadetGray,
          size: 13,
          fontWeight: FontWeight.w400,
        ),
      ],
    ),
  );
}
