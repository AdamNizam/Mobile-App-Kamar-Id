import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/CommonWidgets/card_avaibility.dart';
import 'package:hotelbookingapp/CommonWidgets/modals/show_date_selection_modal.dart';
import 'package:hotelbookingapp/CommonWidgets/modals/show_room_selection_modal.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CheckAvailabilityScreen extends StatefulWidget {
  final int? id;
  const CheckAvailabilityScreen({super.key, required this.id});

  @override
  State<CheckAvailabilityScreen> createState() =>
      _CheckAvailabilityScreenState();
}

class _CheckAvailabilityScreenState extends State<CheckAvailabilityScreen> {
  DateTime? checkInDate;
  DateTime? checkOutDate;
  int room = 0;
  int adult = 0;
  int child = 0;

  void _selectRoom() {
    showRoomSelectionModal(
      context,
      room,
      adult,
      child,
      (int newRoom, int newAdult, int newChild) {
        setState(() {
          room = newRoom;
          adult = newAdult;
          child = newChild;
        });
      },
    );
  }

  void _selectDates() async {
    final selectedDates = await showDateSelectionModal(context);
    if (selectedDates != null) {
      setState(() {
        checkInDate = selectedDates["checkIn"];
        checkOutDate = selectedDates["checkOut"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
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
                          title: Text(
                            checkInDate != null && checkOutDate != null
                                ? "${DateFormat('d MMM').format(checkInDate!)} - ${DateFormat('d MMM').format(checkOutDate!)} - (${checkOutDate!.difference(checkInDate!).inDays} malam)"
                                : "Check In - Check Out",
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          onTap: _selectDates,
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
                            Icons.hotel,
                            size: 24,
                          ),
                          title: Text(
                            "$room Room - $adult Adult - $child Child",
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          onTap: _selectRoom,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 42,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (checkInDate == null || checkOutDate == null)
                                    ? AppColors.beauBlue
                                    : AppColors.buttonColor,
                            foregroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.search_sharp,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                'Check availability',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          onPressed: () {
                            if (checkInDate == null || checkOutDate == null) {
                              showCustomSnackbar(
                                  context, 'Please Chek In - Chek Out');
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Text(
                    'Available Rooms',
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Divider(color: AppColors.strokColor, thickness: 2),
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
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 10.0,
        ),
        // child: CustomButton(
        //   text: 'Booking Now',
        //   onTap: () {
        //     Navigator.of(context).push(
        //       MaterialPageRoute(
        //         builder: (context) => const RoomDetailsScreen(),
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
