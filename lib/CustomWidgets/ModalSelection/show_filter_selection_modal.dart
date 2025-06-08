import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/Blocs/filter/filter_hotel_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomButton/custombtn.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/Models/HotelModel/request_filter_model.dart';
import 'package:hotelbookingapp/Shared/shared_methods.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

void showFilterSelectionModal(BuildContext context) {
  DateTime? checkInDate;
  DateTime? checkOutDate;
  double selectedRating = 0;
  double minPrice = 0;
  double maxPrice = 2000000;
  RangeValues priceRange = const RangeValues(100000, 1000000);

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
            dialogTheme: const DialogTheme(elevation: 0),
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
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          24,
          20,
          MediaQuery.of(context).viewInsets.bottom,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.cadetGray,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 5),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: const CustomTextEllipsis(
                      text: 'Check-in',
                      size: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        selectDate(context, true, (picked) {
                          setState(() {
                            checkInDate = picked;
                          });
                        });
                      },
                      child: Text1(
                        text1: checkInDate != null
                            ? '${checkInDate!.day}/${checkInDate!.month}/${checkInDate!.year}'
                            : AppLocalizations.of(context)!.textSelectDate,
                        color: AppColors.button2Color,
                        size: 15,
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: const CustomTextEllipsis(
                      text: 'Check-out',
                      size: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        selectDate(context, false, (picked) {
                          setState(() {
                            checkOutDate = picked;
                          });
                        });
                      },
                      child: Text1(
                        text1: checkOutDate != null
                            ? '${checkOutDate!.day}/${checkOutDate!.month}/${checkOutDate!.year}'
                            : AppLocalizations.of(context)!.textSelectDate,
                        color: AppColors.button2Color,
                        size: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      RatingBar(
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        halfFilledIcon: Icons.star_half,
                        isHalfAllowed: true,
                        initialRating: selectedRating,
                        maxRating: 5,
                        size: 32,
                        filledColor: Colors.amber,
                        onRatingChanged: (rating) {
                          setState(() {
                            selectedRating = rating;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      if (selectedRating > 0)
                        Text1(
                          text1: '${selectedRating.toStringAsFixed(1)} bintang',
                          size: 14,
                          color: AppColors.button2Color,
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextEllipsis(
                      text: AppLocalizations.of(context)!.textPrice,
                      size: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  RangeSlider(
                    values: priceRange,
                    min: minPrice,
                    max: maxPrice,
                    divisions: 20,
                    activeColor: AppColors.button2Color,
                    inactiveColor: AppColors.beauBlue,
                    labels: RangeLabels(
                      'Rp${priceRange.start.toInt()}',
                      'Rp${priceRange.end.toInt()}',
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        priceRange = values;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text1(text1: 'Rp${formatToRp(priceRange.start.toInt())}'),
                      Text1(text1: 'Rp${formatToRp(priceRange.end.toInt())}'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: AppLocalizations.of(context)!.textSave,
                    onTap: () {
                      if (checkInDate != null && checkOutDate != null) {
                        Navigator.of(context).pop();

                        context.read<FilterHotelBloc>().add(
                              PostFilterHotel(
                                RequestFilterModel(
                                  start: formatDateToDash(checkInDate!),
                                  end: formatDateToDash(checkOutDate!),
                                  date:
                                      '${formatDateToSlash(checkInDate!)} - ${formatDateToSlash(checkOutDate!)}',
                                  priceRange: '$minPrice;$maxPrice',
                                ),
                              ),
                            );
                      }
                      showCustomSnackbar(
                          context, AppLocalizations.of(context)!.messageNoDate);
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
