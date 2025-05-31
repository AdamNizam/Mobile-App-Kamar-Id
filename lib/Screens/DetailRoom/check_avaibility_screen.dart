import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Blocs/check_avaibility/check_avaibility_hotel_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/custom_nav_title.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/card_avaibility.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/CustomWidgets/ModalSelection/show_date_selection_modal.dart';
import 'package:hotelbookingapp/CustomWidgets/ModalSelection/show_room_selection_modal.dart';
import 'package:hotelbookingapp/CustomWidgets/default_value.dart';
import 'package:hotelbookingapp/Models/HotelModel/hotel_detail_model.dart';
import 'package:hotelbookingapp/Models/HotelModel/request_check_avaibility.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CheckAvailabilityScreen extends StatefulWidget {
  final RowData dataHotel;

  const CheckAvailabilityScreen({super.key, required this.dataHotel});

  @override
  State<CheckAvailabilityScreen> createState() =>
      _CheckAvailabilityScreenState();
}

class _CheckAvailabilityScreenState extends State<CheckAvailabilityScreen> {
  bool isLoading = false;
  DateTime? checkInDate;
  DateTime? checkOutDate;
  String? startPrice;
  String? endPrice;
  int room = 1;
  int adult = 1;
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
    final selectedDates = await showDateSelectionModal(
      startPrice,
      endPrice,
      context,
    );
    if (selectedDates != null) {
      setState(() {
        checkInDate = selectedDates["checkIn"];
        checkOutDate = selectedDates["checkOut"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckAvaibilityHotelBloc(),
      child: Scaffold(
        body: SafeArea(
          child:
              BlocConsumer<CheckAvaibilityHotelBloc, CheckAvaibilityHotelState>(
            listener: (context, state) {
              if (state is ChekAvaibilityFailed) {
                showCustomSnackbar(
                    context, 'Failed to check availability: ${state.error}');
              }
              if (state is CheckAvaibilitySuccess) {
                setState(() {
                  isLoading = false;
                });
              }
            },
            builder: (context, state) {
              return Column(
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
                      ],
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 8),
                                CustomNavTitle(
                                  title: widget.dataHotel.title!,
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
                                              checkOutDate == null ||
                                              room == 0)
                                          ? AppColors.beauBlue
                                          : AppColors.amberColor,
                                      foregroundColor: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                    size: 22,
                                                  ),
                                                  const SizedBox(width: 3),
                                                  Text(
                                                    'Checking',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                      ],
                                    ),
                                    onPressed: () {
                                      if (checkInDate == null ||
                                          checkOutDate == null ||
                                          room == 0) {
                                        showCustomSnackbar(
                                          context,
                                          'Please select Check In - Check Out & select Room',
                                        );
                                        return;
                                      }
                                      setState(() {
                                        isLoading = true;
                                      });

                                      final dataChecking =
                                          RequestCheckAvaibility(
                                        hotelId: widget.dataHotel.id!,
                                        startDate: checkInDate!,
                                        endDate: checkOutDate!,
                                        adults: adult,
                                        children: child,
                                      );

                                      print(
                                        'Data Checking: ${jsonEncode(dataChecking)}',
                                      );

                                      context
                                          .read<CheckAvaibilityHotelBloc>()
                                          .add(
                                            PostCheckAvailabilityEvent(
                                                dataChecking),
                                          );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        CustomTextEllipsis(
                          text: 'Available Rooms',
                          size: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 2),
                        Divider(
                          color: AppColors.strokColor,
                          thickness: 2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  if (state is CheckAvaibilitySuccess)
                    if (state.data.rooms == null || state.data.rooms!.isEmpty)
                      DefaultValue(
                        imageSvg: 'images/soldout.svg',
                        text: AppLocalizations.of(context)!.textSoldoutRoom,
                      )
                    else
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.data.rooms!.length,
                          itemBuilder: (context, index) {
                            final dataRoom = state.data.rooms![index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: CardAvailbility(
                                dataRoom: dataRoom,
                                dataHotel: widget.dataHotel,
                                checkInDate: checkInDate!,
                                checkOutDate: checkOutDate!,
                                adult: adult,
                                child: child,
                              ),
                            );
                          },
                        ),
                      )
                  else
                    const DefaultValue(
                      imageSvg: 'images/avaibility.svg',
                      text: 'Search your room now',
                      height: 130,
                      width: 130,
                    ),
                  const SizedBox(height: 20),
                ],
              );
            },
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
              ? "${DateFormat('d MMM').format(checkInDate!)} - ${DateFormat('d MMM').format(checkOutDate!)} - ${checkOutDate!.difference(checkInDate!).inDays} night"
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
          color: (room == 1 && adult == 1)
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
