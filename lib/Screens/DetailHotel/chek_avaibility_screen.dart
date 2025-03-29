import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/CommonWidgets/modals/show_date_selection_modal.dart';
import 'package:hotelbookingapp/CommonWidgets/modals/show_room_selection_modal.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Widgets/custom_nav_title.dart';
import 'package:intl/intl.dart';

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
            Container(
              height: 275,
              decoration: const BoxDecoration(
                color: AppColors.tabColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8),
                          const CustomNavTitle(
                            title: 'Check Availability Room',
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
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.search_sharp, size: 18),
                                  const SizedBox(width: 2),
                                  Text(
                                    'Checking',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                if (checkInDate == null ||
                                    checkOutDate == null) {
                                  showCustomSnackbar(context,
                                      'Please select Check In - Check Out');
                                } else {
                                  Navigator.pushNamed(context, '/maintenance');
                                }
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
            const SizedBox(
              height: 15,
            ),
            _buildNoDataWidget(),
            const SizedBox(height: 30),
          ],
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
        leading: const Icon(Icons.calendar_month, size: 24),
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
        leading: const Icon(Icons.hotel, size: 24),
        title: Text(
          "$room Room - $adult Adult - $child Child",
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        onTap: _selectRoom,
      ),
    );
  }

  Widget _buildNoDataWidget() {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset('images/chek_avaibility.svg',
              width: 200, height: 200),
          const SizedBox(height: 10),
          Text(
            'Oops.. No data available',
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.cadetGray),
          ),
        ],
      ),
    );
  }
}
