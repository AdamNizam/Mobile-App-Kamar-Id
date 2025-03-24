import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/CommonWidgets/card_avaibility.dart';
import 'package:hotelbookingapp/CommonWidgets/modals/modal_chek_avaibility.dart';
import 'package:hotelbookingapp/CommonWidgets/modals/modal_chek_room.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Screens/Booking/booking_summary.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';
import 'package:hotelbookingapp/Widgets/detailstext1.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CheckAvailabilityScreen extends StatefulWidget {
  final int? id;
  const CheckAvailabilityScreen({super.key, required this.id});

  @override
  State<CheckAvailabilityScreen> createState() =>
      _CheckAvailabilityScreenState();
}

class _CheckAvailabilityScreenState extends State<CheckAvailabilityScreen> {
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
                        width: 330,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 2,
                            color: AppColors.beauBlue,
                          ),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.calendar_month, size: 24),
                          title: const Text1(
                            text1: "Check In - Check Out",
                          ),
                          onTap: () {
                            showBookingModal(context);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 339,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 2,
                            color: AppColors.beauBlue,
                          ),
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.people,
                            size: 24,
                          ),
                          title: const Text1(
                            text1: "0 Dewasa - 0 Anak-anak",
                          ),
                          onTap: () {
                            showRoomSelectionModal(context);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 43.0,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightBlue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search_sharp),
                              SizedBox(
                                width: 2,
                              ),
                              Text1(
                                text1: "Cek Ketersediaan ",
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                                size: 16,
                              ),
                            ],
                          ),
                          onPressed: () {
                            // Aksi pencarian
                          },
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
                    text1: 'Kamar Yang Tersedia',
                    size: 16,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(color: AppColors.strokColor, thickness: 2),
                ],
              ),
            ),
            BlocProvider(
              create: (context) =>
                  HotelBloc()..add(PostChekAvaibility(widget.id!)),
              child: Expanded(
                child: BlocBuilder<HotelBloc, HotelState>(
                  builder: (context, state) {
                    if (state is ChekAvaibilityFailed) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'images/Oops! _404_2.svg',
                              semanticsLabel: 'Acme Logo',
                              width: 350,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              'Oopss.. ${state.error} ',
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      );
                    }

                    if (state is CheckAvaibilitySuccess) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        child: state.data.rooms!.isEmpty
                            ? Column(
                                children: [
                                  Image.asset(
                                    'images/Sold_out_.png',
                                    width: 350,
                                    height: 300,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              )
                            : ListView(
                                children: state.data.rooms!.map((data) {
                                  return CardAvailbility(data: data);
                                }).toList(),
                              ),
                      );
                    }
                    return Center(
                      child: LoadingAnimationWidget.hexagonDots(
                        color: AppColors.tabColor,
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 10.0,
        ),
        child: CustomButton(
          text: 'Booking Now',
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
