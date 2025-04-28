import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Models/NotificationModel/result_notification.dart';
import 'package:hotelbookingapp/Shared/custom_methods.dart';

import 'notification_card.dart'; // Import NotificationCard

class BookingNotifications extends StatefulWidget {
  final RowsNotif unreadData;
  const BookingNotifications({
    super.key,
    required this.unreadData,
  });

  @override
  State<BookingNotifications> createState() => _BookingNotificationsState();
}

class _BookingNotificationsState extends State<BookingNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            color: AppColors.cadetGray,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Right icon clicked');
            },
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.notifications_active,
                  color: AppColors.buttonColor,
                  size: 28,
                ),
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.redAwesome,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      widget.unreadData.total.toString(),
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.cadetGray,
        ),
      ),
      body: widget.unreadData.dataNotif.isNotEmpty
          ? SingleChildScrollView(
              padding:
                  const EdgeInsets.fromLTRB(16, kToolbarHeight + 32, 16, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const NotificationCard(
                    icon: Icons.notifications_off,
                    iconColor: AppColors.cadetGray,
                    iconBackgroundColor: AppColors.bgColor,
                    title: 'Booking Completed',
                    content: 'Your booking is now completed.',
                    date: '2025-04-20',
                    isRead: true,
                  ),
                  Column(
                    children: widget.unreadData.dataNotif
                        .map(
                          (dataNotif) => NotificationCard(
                            icon: Icons.notifications_active,
                            iconColor: AppColors.green,
                            iconBackgroundColor: Colors.green.shade100,
                            title: dataNotif.data.notification.name,
                            content: dataNotif.data.notification.message,
                            date: '${formatDateToYMD(dataNotif.createdAt)}',
                            isRead: false,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 200),
              child: Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'images/empty_notifications.svg',
                      height: 200,
                    ),
                    Text(
                      "No notification received yet.",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.cadetGray,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
