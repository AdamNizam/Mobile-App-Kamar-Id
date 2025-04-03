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
import 'package:hotelbookingapp/Widgets/custom_nav_title.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CheckAvailabilityScreen extends StatefulWidget {
  final int? hotelId;
  final String? hotelName;
  final String? imageUrl;
  const CheckAvailabilityScreen({
    super.key,
    required this.hotelId,
    required this.hotelName,
    required this.imageUrl,
  });

  @override
  State<CheckAvailabilityScreen> createState() =>
      _CheckAvailabilityScreenState();
}

class _CheckAvailabilityScreenState extends State<CheckAvailabilityScreen> {
  bool isLoading = false;
  List<dynamic> availableRooms = [];
  DateTime? checkInDate;
  DateTime? checkOutDate;
  int room = 1;
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
        child: BlocListener<HotelBloc, HotelState>(
          listener: (context, state) {
            if (state is ChekAvaibilityFailed) {
              showCustomSnackbar(
                  context, 'Failed to check availability: ${state.error}');
            }
          },
          child: Column(
            children: [
              Container(
                height: 285,
                decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.5),
                        blurRadius: 5,
                      ),
                    ]),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 8),
                            CustomNavTitle(
                              title:
                                  widget.hotelName ?? 'Check Availability Room',
                              color: AppColors.white,
                            ),
                            const SizedBox(height: 20),
                            _buildDateSelection(),
                            const SizedBox(height: 10),
                            _buildRoomSelection(),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 42,
                              width: 320,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: (checkInDate == null ||
                                          checkOutDate == null)
                                      ? AppColors.beauBlue
                                      : AppColors.amberColor,
                                  foregroundColor: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        if (checkInDate == null ||
                                            checkOutDate == null ||
                                            room == 0) {
                                          showCustomSnackbar(context,
                                              'Please select Check In - Check Out & select Room');
                                        } else {
                                          setState(() {
                                            isLoading = true;
                                          });

                                          Future.delayed(
                                              const Duration(seconds: 5), () {
                                            setState(() {
                                              isLoading = false;
                                            });
                                            context.read<HotelBloc>().add(
                                                  PostCheckAvailability(
                                                    hotelId: widget.hotelId!,
                                                    startDate: checkInDate!,
                                                    endDate: checkOutDate!,
                                                    adults: adult,
                                                    children: child,
                                                  ),
                                                );
                                          });
                                        }
                                      },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    isLoading
                                        ? LoadingAnimationWidget
                                            .fourRotatingDots(
                                            color: AppColors.white,
                                            size: 27,
                                          )
                                        : Row(
                                            children: [
                                              const Icon(
                                                  Icons
                                                      .location_searching_rounded,
                                                  size: 22),
                                              const SizedBox(width: 3),
                                              Text(
                                                'Checking',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Text(
                      'Available Rooms',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Divider(color: AppColors.strokColor, thickness: 2),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              BlocBuilder<HotelBloc, HotelState>(
                builder: (context, state) {
                  if (state is ChekAvaibilityLoading) {
                    return Center(
                      child: LoadingAnimationWidget.hexagonDots(
                        color: AppColors.buttonColor,
                        size: 30,
                      ),
                    );
                  }
                  if (state is CheckAvaibilitySuccess) {
                    if (state.data.rooms == null || state.data.rooms!.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/Sold_out_.png',
                              width: 300,
                              height: 250,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      );
                    }
                    return Expanded(
                      child: ListView(
                        children: state.data.rooms!.map((data) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: CardAvailbility(
                              data: data,
                              imageUrl: widget.imageUrl ??
                                  'https://picsum.photos/400/300',
                              hotelName: widget.hotelName ?? 'No-data',
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
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
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'images/avaibility.svg',
                          semanticsLabel: 'Acme Logo',
                          width: 150,
                          height: 150,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Search your rooms',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateSelection() {
    return Container(
      width: 320,
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: (checkInDate != null && checkOutDate != null)
              ? AppColors.amberColor
              : AppColors.beauBlue,
        ),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.calendar_month,
          size: 24,
          color: AppColors.buttonColor,
        ),
        title: Text(
          checkInDate != null && checkOutDate != null
              ? "${DateFormat('d MMM').format(checkInDate!)} - ${DateFormat('d MMM').format(checkOutDate!)} - (${checkOutDate!.difference(checkInDate!).inDays} night)"
              : "Check In - Check Out",
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        onTap: _selectDates,
      ),
    );
  }

  Widget _buildRoomSelection() {
    return Container(
      width: 320,
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: (room == 0 && adult == 0)
              ? AppColors.beauBlue
              : AppColors.amberColor,
        ),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.hotel,
          size: 24,
          color: AppColors.buttonColor,
        ),
        title: Text(
          "$room Room - $adult Adult - $child Child",
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        onTap: _selectRoom,
      ),
    );
  }
}
