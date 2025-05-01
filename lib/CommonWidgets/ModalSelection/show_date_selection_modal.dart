import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:intl/intl.dart';

Future<Map<String, DateTime>?> showDateSelectionModal(
    String? startPriceSelection,
    String? endPriceSelection,
    BuildContext context) async {
  DateTime checkInDate = DateTime.now();
  DateTime checkOutDate = checkInDate.add(
    const Duration(days: 1),
  );

  return await showModalBottomSheet<Map<String, DateTime>>(
    context: context,
    backgroundColor: AppColors.white,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return DefaultTabController(
        length: 2,
        child: StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Select Date",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const TabBar(
                    labelColor: AppColors.buttonColor,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: AppColors.buttonColor,
                    tabs: [
                      Tab(text: "Check In"),
                      Tab(text: "Check Out"),
                    ],
                  ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      children: [
                        // Check In
                        Column(
                          children: [
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 400,
                              height: 280,
                              child: Theme(
                                data: ThemeData(
                                  colorScheme: const ColorScheme.light(
                                    primary: AppColors.buttonColor,
                                  ),
                                ),
                                child: CalendarDatePicker(
                                  initialDate: checkInDate,
                                  firstDate: DateTime(DateTime.now().year),
                                  lastDate: DateTime(DateTime.now().year + 5),
                                  onDateChanged: (date) {
                                    setState(() {
                                      checkInDate = date;
                                      if (!checkOutDate.isAfter(checkInDate)) {
                                        checkOutDate = checkInDate
                                            .add(const Duration(days: 1));
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 400,
                              height: 280,
                              child: Theme(
                                data: ThemeData(
                                  colorScheme: const ColorScheme.light(
                                    primary: AppColors.buttonColor,
                                  ),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final adjustedFirstDate = checkInDate
                                        .add(const Duration(days: 1));
                                    final adjustedInitialDate =
                                        checkOutDate.isBefore(adjustedFirstDate)
                                            ? adjustedFirstDate
                                            : checkOutDate;

                                    return CalendarDatePicker(
                                      initialDate: adjustedInitialDate,
                                      firstDate: adjustedFirstDate,
                                      lastDate: DateTime(2030),
                                      onDateChanged: (date) {
                                        setState(() {
                                          checkOutDate = date;
                                        });
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Start from: Rp$startPriceSelection - Rp$endPriceSelection',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: AppColors.buttonColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "${DateFormat('d MMM').format(checkInDate)} - ${DateFormat('d MMM').format(checkOutDate)} (${checkOutDate.difference(checkInDate).inDays} night)",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 26),
                  ElevatedButton(
                    onPressed: () {
                      if (!checkOutDate.isAfter(checkInDate)) {
                        showCustomSnackbar(
                          context,
                          'Tanggal check-out harus lebih dari tanggal check-in.',
                        );
                        return;
                      }

                      Navigator.pop(context, {
                        "checkIn": checkInDate,
                        "checkOut": checkOutDate,
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 40),
                      backgroundColor: AppColors.buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                    ),
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
