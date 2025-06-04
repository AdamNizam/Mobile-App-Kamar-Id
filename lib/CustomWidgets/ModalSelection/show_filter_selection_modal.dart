import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomButton/custombtn.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

void showFilterSelectionModal(BuildContext context) {
  DateTime? checkInDate;
  DateTime? checkOutDate;

  double minPrice = 0;
  double maxPrice = 1000000;
  RangeValues priceRange = const RangeValues(100000, 500000);

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
              onPrimary: AppColors.buttonColor,
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
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.cadetGray,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// Check-in Date
                  ListTile(
                    contentPadding: EdgeInsets.zero,
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
                      child: Text(
                        checkInDate != null
                            ? '${checkInDate!.day}/${checkInDate!.month}/${checkInDate!.year}'
                            : 'Pilih tanggal',
                        style: const TextStyle(color: AppColors.buttonColor),
                      ),
                    ),
                  ),

                  /// Check-out Date
                  ListTile(
                    contentPadding: EdgeInsets.zero,
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
                      child: Text(
                        checkOutDate != null
                            ? '${checkOutDate!.day}/${checkOutDate!.month}/${checkOutDate!.year}'
                            : 'Pilih tanggal',
                        style: const TextStyle(color: AppColors.buttonColor),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// Price Range Slider
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const CustomTextEllipsis(
                      text: 'Harga (Rp)',
                      size: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  RangeSlider(
                    values: priceRange,
                    min: minPrice,
                    max: maxPrice,
                    divisions: 20,
                    activeColor: AppColors.buttonColor,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rp${priceRange.start.toInt()}'),
                      Text('Rp${priceRange.end.toInt()}'),
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// Save Button
                  CustomButton(
                    text: 'Simpan',
                    onTap: () {
                      showCustomSnackbar(context,
                          'Filter diterapkan: Harga Rp${priceRange.start.toInt()} - Rp${priceRange.end.toInt()}');
                      Navigator.pop(context);
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
