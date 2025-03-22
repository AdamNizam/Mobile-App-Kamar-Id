import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Screens/Booking/booking_summary.dart';
import 'package:hotelbookingapp/Screens/DetailHotel/card_avaibility.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';

class CheckAvailabilityScreen extends StatelessWidget {
  const CheckAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 2,
                            color: AppColors.strokColor,
                          ),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.calendar_month),
                              title: const Text("Chek In - Chek Out"),
                              onTap: () {},
                            ),
                            const Divider(
                              color: AppColors.amberColor,
                              thickness: 2,
                            ),
                            ListTile(
                              leading: const Icon(Icons.person),
                              title: const Text("Chek Room"),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.button2Color,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            // Aksi pencarian
                          },
                          child: const Text("Cek Ketersediaan"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Text1(
                    text1: 'Kamar Yangg Tersedia',
                    size: 16,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(color: AppColors.button2Color, thickness: 2),
                ],
              ),
            ),
            Expanded(
              // Tambahkan Expanded di sini
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                child: ListView(
                  children: const [
                    CardAvailbility(),
                    CardAvailbility(),
                    CardAvailbility(),
                    CardAvailbility(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomButton(
          text: 'Continue',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ReviewSummary(),
              ),
            );
          },
        ),
      ),
    );
  }
}
