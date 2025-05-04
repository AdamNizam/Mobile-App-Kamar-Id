import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomButton/custom_outline_button.dart';
import 'package:hotelbookingapp/Models/BookingModel/history_booking.model.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/booking_detail_row.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/send_review_screen.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:intl/intl.dart';

class CardBookingCompleted extends StatefulWidget {
  final DataHistory? data;

  const CardBookingCompleted({
    super.key,
    required this.data,
  });

  @override
  State<CardBookingCompleted> createState() => _CardBookingCompletedState();
}

class _CardBookingCompletedState extends State<CardBookingCompleted>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.beauBlue,
                )),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar dan Judul
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://picsum.photos/400/300?=989',
                          fit: BoxFit.cover,
                          width: 100,
                          height: 90,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data?.service.title ?? 'Unknown Hotel',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_pin,
                                  size: 23.0,
                                  color: AppColors.buttonColor,
                                ),
                                Text(
                                  'No location info',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: AppColors.cadetGray,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const SizedBox(width: 4),
                                Text(
                                  widget.data!.status,
                                  style: GoogleFonts.poppins(
                                    color: AppColors.green,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.check_circle,
                                        color: AppColors.green,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        widget.data!.status,
                                        style: GoogleFonts.poppins(
                                          color: AppColors.green,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookingDetailRow(
                        icon: Icons.date_range,
                        label: 'Check-In',
                        value: DateFormat('yyyy-MM-dd')
                            .format(widget.data!.startDate),
                      ),
                      BookingDetailRow(
                        icon: Icons.logout,
                        label: 'Check-Out',
                        value: DateFormat('yyyy-MM-dd')
                            .format(widget.data!.endDate),
                      ),
                      BookingDetailRow(
                        icon: Icons.person,
                        label: 'Guest',
                        value: data?.totalGuests.toString() ?? 'no information',
                      ),
                      const BookingDetailRow(
                        icon: Icons.meeting_room,
                        label: 'Number of Rooms',
                        value: '2 room',
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomOutlinedButton(
                      text: 'Beri Ulasan',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SendReviewScreen(dataHistory: widget.data!),
                        ));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
