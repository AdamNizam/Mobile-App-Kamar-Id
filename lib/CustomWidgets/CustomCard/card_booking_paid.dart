import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CommonWidgets/label_status_booking.dart';
import 'package:hotelbookingapp/CustomWidgets/CommonWidgets/row_booking_widget.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomButton/custom_outline_button.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/Data/Models/BookingModel/history_booking.model.dart';
import 'package:hotelbookingapp/Screens/HistoryBookings/detail_history_booking.dart';
import 'package:hotelbookingapp/Shared/shared_methods.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:intl/intl.dart';

class CardBookingPaid extends StatefulWidget {
  final DataHistory? data;

  const CardBookingPaid({
    super.key,
    required this.data,
  });

  @override
  State<CardBookingPaid> createState() => _CardBookingPaidState();
}

class _CardBookingPaidState extends State<CardBookingPaid>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 700,
      ),
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
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const BookingDetailPage(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.beauBlue,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(
                            'https://picsum.photos/400/300?=989',
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextEllipsis(
                                text: widget.data?.service.title ??
                                    'Unknown Hotel',
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                              const SizedBox(height: 8),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 20.0,
                                    color: AppColors.buttonColor,
                                  ),
                                  SizedBox(width: 6),
                                  CustomTextEllipsis(
                                    text: 'No location info',
                                    size: 13,
                                    color: AppColors.cadetGray,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              LabelStatusBooking(
                                icon: Icons.check_circle,
                                status: widget.data!.status,
                                color: AppColors.green,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BookingDetailRow(
                            icon: Icons.payments,
                            label: 'Total Payment',
                            value: 'Rp${formatToRp(
                              double.parse(widget.data!.payNow).toInt(),
                            )}',
                          ),
                          BookingDetailRow(
                            icon: Icons.date_range,
                            label: 'Check-In',
                            value: DateFormat('yyyy-MM-dd').format(
                              widget.data!.startDate,
                            ),
                          ),
                          BookingDetailRow(
                            icon: Icons.date_range,
                            label: 'Check-Out',
                            value: DateFormat('yyyy-MM-dd').format(
                              widget.data!.endDate,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    CustomOutlinedButton(
                      text: 'Chat owner',
                      onTap: () {
                        showCustomSnackbar(context, 'Fitur is not available');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
