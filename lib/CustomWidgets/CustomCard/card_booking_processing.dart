import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomButton/custom_outline_button.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomButton/custombtn.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/booking_detail_row.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_overflow.dart';
import 'package:hotelbookingapp/Models/BookingModel/history_booking.model.dart';
import 'package:hotelbookingapp/Screens/Midtrans/midtrans_payment_page.dart';
import 'package:hotelbookingapp/Shared/custom_methods.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:intl/intl.dart';

class CardBookingProcessing extends StatefulWidget {
  final DataHistory? data;

  const CardBookingProcessing({
    super.key,
    required this.data,
  });

  @override
  State<CardBookingProcessing> createState() => _CardBookingProcessingState();
}

class _CardBookingProcessingState extends State<CardBookingProcessing>
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
                            CustomTextOverflow(
                              text: data?.service.title ?? 'Unknown Hotel',
                              color: AppColors.black,
                              size: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(height: 8),
                            const Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 23.0,
                                  color: AppColors.buttonColor,
                                ),
                                CustomTextEllipsis(
                                  text: 'No location info',
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.amberColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.timelapse,
                                    color: AppColors.amberColor,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    widget.data!.status,
                                    style: GoogleFonts.poppins(
                                      color: AppColors.amberColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
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
                        icon: Icons.confirmation_number,
                        label: 'Code Booking',
                        value: data!.code,
                      ),
                      BookingDetailRow(
                        icon: Icons.payments,
                        label: 'Total Payment',
                        value:
                            'Rp${formatToRp(double.parse(data.payNow).toInt())}',
                      ),
                      BookingDetailRow(
                        icon: Icons.login,
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
                        icon: Icons.person_outline,
                        label: 'Guest',
                        value: data.totalGuests.toString(),
                      ),
                      const BookingDetailRow(
                        icon: Icons.meeting_room_outlined,
                        label: 'Number of Rooms',
                        value: '2 room',
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        CustomButton(
                          text: 'Pay now',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MidtransPaymentPage(
                                  totalPrice: double.parse(data.payNow).toInt(),
                                  orderId: data.code,
                                  emailUser: data.email,
                                  firstName: data.firstName,
                                  lastName: data.lastName,
                                  phone: data.phone,
                                ),
                              ),
                            );
                          },
                        ),
                        CustomOutlinedButton(
                          text: 'Cancel booking',
                          onTap: () {
                            showCustomSnackbar(
                                context, 'Fitur is not available');
                          },
                        )
                      ],
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
