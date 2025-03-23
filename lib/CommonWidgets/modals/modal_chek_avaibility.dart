import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:intl/intl.dart';

void showBookingModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return DefaultTabController(
        length: 2,
        child: StatefulBuilder(
          builder: (context, setState) {
            // Tambahkan dua variabel untuk check-in dan check-out
            DateTime checkInDate = DateTime.now();
            DateTime checkOutDate = checkInDate.add(const Duration(days: 1));

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
                    "Pilih Tanggal",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const TabBar(
                    labelColor: AppColors.button2Color,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: AppColors.button2Color,
                    tabs: [
                      Tab(text: "Check In"),
                      Tab(text: "Check Out"),
                    ],
                  ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      children: [
                        // Tab Kalender Check-In
                        Column(
                          children: [
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 400,
                              height: 280,
                              child: Theme(
                                data: ThemeData(
                                  colorScheme: const ColorScheme.light(
                                    primary: AppColors.button2Color,
                                  ),
                                ),
                                child: CalendarDatePicker(
                                  initialDate: checkInDate,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2030),
                                  onDateChanged: (date) {
                                    setState(() {
                                      checkInDate = date;
                                      // Jika check-out lebih kecil dari check-in, atur ulang check-out
                                      if (checkOutDate.isBefore(checkInDate)) {
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
                        // Tab Kalender Check-Out
                        Column(
                          children: [
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 400,
                              height: 280,
                              child: Theme(
                                data: ThemeData(
                                  colorScheme: const ColorScheme.light(
                                    primary: AppColors.button2Color,
                                  ),
                                ),
                                child: CalendarDatePicker(
                                  initialDate: checkOutDate,
                                  firstDate:
                                      checkInDate.add(const Duration(days: 1)),
                                  lastDate: DateTime(2030),
                                  onDateChanged: (date) {
                                    setState(() {
                                      checkOutDate = date;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${DateFormat('d MMM').format(checkInDate)} - ${DateFormat('d MMM').format(checkOutDate)} (${checkOutDate.difference(checkInDate).inDays} malam)",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 40),
                      backgroundColor: AppColors.button2Color,
                    ),
                    child: const Text1(
                      text1: "Pilih Tanggal",
                      color: Colors.white,
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
