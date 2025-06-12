import 'package:cupertino_range_slider_improved/cupertino_range_slider.dart';
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
  double min = 200000;
  double max = 1500000;

  double minVal = 400000;
  double maxVal = 1200000;
  int? locationId;
  int? expandedIndex;

  List<int> selectedAttributes = [];

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
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.beauBlue,
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
                              color: AppColors.button2Color,
                            ),
                            SizedBox(width: 8),
                            Text2(
                              text2: 'Cari lokasi anda saat ini',
                              color: AppColors.black,
                              size: 14,
                              fontWeight: FontWeight.w400,
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
                                    color: AppColors.button2Color,
                                  ),
                                  const SizedBox(width: 8),
                                  Text2(
                                    text2: '${location.name}',
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.beauBlue,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text1(
                            text1: 'Rentang Harga (Rp)',
                            fontWeight: FontWeight.w500,
                            size: 12,
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: CupertinoRangeSlider(
                              min: min,
                              max: max,
                              minValue: minVal,
                              maxValue: maxVal,
                              onMinChanged: (val) {
                                setState(() {
                                  minVal = val;
                                });
                              },
                              onMaxChanged: (val) {
                                setState(() {
                                  maxVal = val;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text1(text1: 'Rp${formatToRp(minVal.toInt())}'),
                              Text1(text1: 'Rp${formatToRp(maxVal.toInt())}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          attributesCategory!.asMap().entries.map((entry) {
                        int index = entry.key;
                        var atr = entry.value;

                        bool isExpanded = expandedIndex == index;

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: Column(
                            children: [
                              ListTile(
                                tileColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                leading: const Icon(
                                  Icons.label_important,
                                  size: 24,
                                  color: AppColors.button2Color,
                                ),
                                title: Text1(
                                  text1: '${atr.name}',
                                  fontWeight: FontWeight.w500,
                                  size: 13,
                                ),
                                trailing: Icon(
                                  isExpanded
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                  size: 24,
                                  color: AppColors.black,
                                ),
                                onTap: () {
                                  setState(() {
                                    expandedIndex = isExpanded ? null : index;
                                  });
                                },
                              ),
                              if (isExpanded)
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    children: atr.terms!.map((subAttr) {
                                      return CheckboxListTile(
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        contentPadding: EdgeInsets.zero,
                                        activeColor: AppColors.button2Color,
                                        value: selectedAttributes
                                            .contains(subAttr.id),
                                        onChanged: isExpanded
                                            ? (bool? value) {
                                                setState(() {
                                                  print(
                                                      "Checkbox ${subAttr.name} diubah: $value");
                                                  if (value == true) {
                                                    selectedAttributes
                                                        .add(subAttr.id!);
                                                  } else {
                                                    selectedAttributes
                                                        .remove(subAttr.id);
                                                  }
                                                });
                                              }
                                            : null,
                                        title: Text1(
                                          text1: '${subAttr.name}',
                                          size: 13,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                            ],
                          ),
                        );
                      }).toList(),
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
                                        '${minVal.toInt()};${maxVal.toInt()}',
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
      border: Border.all(
        color: AppColors.beauBlue,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Icon(
          icon,
          color: date != null ? AppColors.button2Color : AppColors.black,
        ),
        const SizedBox(width: 12),
        Text1(
          text1:
              date != null ? '${date.day}/${date.month}/${date.year}' : label,
          color: AppColors.black,
          size: 14,
          fontWeight: FontWeight.w400,
        ),
      ],
    ),
  );
}
