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
  double minPrice = 0;
  double maxPrice = 2000000;
  RangeValues priceRange = const RangeValues(100000, 1000000);
  int? selectedRating;
  int? locationId;

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
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      List<ListLocation>? locationParent = [];

      dynamic selectedLocation;

      return StatefulBuilder(
        builder: (context, setState) {
          final state = context.watch<HotelBloc>().state;
          if (state is HotelSuccess) {
            final listLocation = state.data.data?.listLocation;

            if (listLocation != null && listLocation.isNotEmpty) {
              locationParent = listLocation;
              // selectedLocation ??= listLocation[0];
            }
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.6,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.beauBlue),
                      ),
                      child: DropdownButton<dynamic>(
                        isExpanded: true,
                        underline: const SizedBox(),
                        value: selectedLocation,
                        hint: const Row(
                          children: [
                            Icon(
                              Icons.place,
                              color: AppColors.doggerBlue,
                            ),
                            SizedBox(width: 8),
                            Text2(
                              text2: 'Cari lokasi anda saat ini',
                              color: AppColors.black,
                              size: 14,
                              fontWeight: FontWeight.w500,
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
                                    color: AppColors.doggerBlue,
                                  ),
                                  const SizedBox(width: 8),
                                  Text2(
                                    text2: location.name ?? '',
                                    color: AppColors.black,
                                    size: 13,
                                    fontWeight: FontWeight.w600,
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
                                          Icons.place,
                                          color: AppColors.doggerBlue,
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
                              locationId = value.id!;
                              print('Child dipilih: ${value.name}');
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
                    const Text1(
                      text1: 'Rentang Harga (Rp)',
                      fontWeight: FontWeight.w500,
                      size: 14,
                    ),
                    const SizedBox(height: 10),
                    RangeSlider(
                      values: priceRange,
                      min: minPrice,
                      max: maxPrice,
                      divisions: 20,
                      labels: RangeLabels(
                        'Rp${priceRange.start.toInt()}',
                        'Rp${priceRange.end.toInt()}',
                      ),
                      onChanged: (values) {
                        setState(() => priceRange = values);
                      },
                      activeColor: AppColors.doggerBlue,
                      inactiveColor: AppColors.doggerBlue.withOpacity(0.2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text1(
                            text1: 'Rp${formatToRp(priceRange.start.toInt())}'),
                        Text1(text1: 'Rp${formatToRp(priceRange.end.toInt())}'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text1(
                      text1: 'Review Score',
                      fontWeight: FontWeight.w500,
                      size: 14,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      children: List.generate(5, (index) {
                        final rating = index + 1;
                        return ChoiceChip(
                          label: Text('$rating ★'),
                          selected: selectedRating == rating,
                          onSelected: (selected) {
                            setState(() =>
                                selectedRating = selected ? rating : null);
                          },
                          selectedColor: AppColors.doggerBlue,
                          backgroundColor: AppColors.white,
                          labelStyle: TextStyle(
                            color: selectedRating == rating
                                ? Colors.white
                                : AppColors.black,
                          ),
                        );
                      }),
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
                                    locationId: locationId,
                                    start: formatDateToDash(checkInDate!),
                                    end: formatDateToDash(checkOutDate!),
                                    date:
                                        '${formatDateToSlash(checkInDate!)} - ${formatDateToSlash(checkOutDate!)}',
                                    priceRange:
                                        '${priceRange.start.toInt()};${priceRange.end.toInt()}',
                                  ),
                                ),
                              );
                        } else {
                          showCustomSnackbar(
                            context,
                            AppLocalizations.of(context)!.messageNoDate,
                          );
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
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border.all(color: AppColors.beauBlue),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Icon(icon, color: AppColors.black),
        const SizedBox(width: 12),
        Text1(
          text1:
              date != null ? '${date.day}/${date.month}/${date.year}' : label,
          color: AppColors.black,
          size: 13,
          fontWeight: FontWeight.w600,
        ),
      ],
    ),
  );
}
