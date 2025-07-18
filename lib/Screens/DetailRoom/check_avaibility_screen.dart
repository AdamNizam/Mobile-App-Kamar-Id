import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/Blocs/check_avaibility/check_avaibility_hotel_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/card_avaibility.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/CustomWidgets/default_value.dart';
import 'package:hotelbookingapp/Data/Models/HotelModel/hotel_detail_model.dart';
import 'package:hotelbookingapp/Data/Models/HotelModel/request_check_avaibility.dart';
import 'package:hotelbookingapp/Screens/ModalSelection/show_date_selection_modal.dart';
import 'package:hotelbookingapp/Screens/ModalSelection/show_room_selection_modal.dart';
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
        appBar: CustomAppTopBar(
          title: 'Checking Hotel',
          onPop: () {},
          onTap: () {},
        ),
        body: BlocConsumer<CheckAvaibilityHotelBloc, CheckAvaibilityHotelState>(
          listener: (context, state) {
            if (state is ChekAvaibilityFailed) {
              showCustomSnackbar(context, state.error);
            }
            if (state is CheckAvaibilitySuccess) {
              setState(() {
                isLoading = false;
              });
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Container(
                  height: 90,
                  color: AppColors.buttonColor,
                  padding: const EdgeInsets.only(top: 10),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.amberColor,
                                width: 2.5,
                              ),
                            ),
                            child: Column(
                              children: [
                                _buildDateSelection(),
                                divider(),
                                _buildRoomSelection(),
                                InkWell(
                                  onTap: () {
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

                                    final dataChecking = RequestCheckAvaibility(
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
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    decoration: const BoxDecoration(
                                      color: AppColors.buttonColor,
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(10),
                                      ),
                                    ),
                                    child: isLoading
                                        ? LoadingAnimationWidget
                                            .fourRotatingDots(
                                            color: AppColors.white,
                                            size: 27,
                                          )
                                        : const Center(
                                            child: Text(
                                              'Checking',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    16, // Ubah dari 1 ke 16 agar teks terlihat
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (state is CheckAvaibilitySuccess)
                        if (state.data.rooms == null ||
                            state.data.rooms!.isEmpty)
                          DefaultValue(
                            imageSvg: 'images/soldout.svg',
                            text: AppLocalizations.of(context)!.textSoldoutRoom,
                          )
                        else
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.data.rooms!.length,
                            itemBuilder: (context, index) {
                              final dataRoom = state.data.rooms![index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
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
                          )
                      else
                        DefaultValue(
                          imageSvg: 'images/search-room.svg',
                          text: AppLocalizations.of(context)!.textSearchRoom,
                          height: 250,
                          width: 250,
                        ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDateSelection() {
    return ListTile(
      leading: const Icon(
        Icons.calendar_month,
        size: 24,
        color: AppColors.buttonColor,
      ),
      title: Text1(
        text1: checkInDate != null && checkOutDate != null
            ? "${DateFormat('d MMM').format(checkInDate!)} - ${DateFormat('d MMM').format(checkOutDate!)} - ${checkOutDate!.difference(checkInDate!).inDays} night"
            : "Check In - Check Out",
        size: 14,
        fontWeight: FontWeight.w400,
      ),
      onTap: _selectDates,
    );
  }

  Widget _buildRoomSelection() {
    return ListTile(
      leading: const Icon(
        Icons.hotel,
        size: 24,
        color: AppColors.buttonColor,
      ),
      title: Text1(
          text1: "$room Room - $adult Adult - $child Child",
          size: 14,
          fontWeight: FontWeight.w400),
      onTap: _selectRoom,
    );
  }

  Widget divider() {
    return Divider(height: 1, color: Colors.grey.shade300);
  }

  Widget categoryIcon(IconData icon, String label, bool selected) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            border: selected ? Border.all(color: Colors.white) : null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
