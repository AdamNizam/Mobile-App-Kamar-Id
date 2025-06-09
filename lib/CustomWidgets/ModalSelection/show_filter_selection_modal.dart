import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/Blocs/filter/filter_hotel_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomButton/custombtn.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
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
    backgroundColor: Colors.white,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          24,
          20,
          MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const Text1(
                    text1: 'Filter Hotel',
                    fontWeight: FontWeight.w600,
                    size: 16,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.beauBlue),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.map, color: AppColors.doggerBlue),
                        SizedBox(width: 8),
                        Text1(
                          text1: 'Cari lokasi anda saat ini',
                          color: AppColors.black,
                          size: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        Spacer(),
                        Icon(Icons.arrow_drop_down, color: AppColors.black),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Check-in / Check-out UI
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
                      const SizedBox(width: 12),
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
                  const SizedBox(height: 12),
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
                      Text1(text1: 'Rp${formatToRp(priceRange.start.toInt())}'),
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
                          setState(
                              () => selectedRating = selected ? rating : null);
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
                        showCustomSnackbar(context,
                            AppLocalizations.of(context)!.messageNoDate);
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
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
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.beauBlue),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Icon(icon, color: AppColors.black),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text1(
              text1: label,
              color: AppColors.black,
              size: 13,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 4),
            Text1(
              text1: date != null
                  ? '${date.day}/${date.month}/${date.year}'
                  : AppLocalizations.of(context)!.textSelectDate,
              color: AppColors.doggerBlue,
              size: 13,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ],
    ),
  );
}
