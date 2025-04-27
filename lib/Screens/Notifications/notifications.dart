import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

import 'notification_card.dart'; // Import NotificationCard

class BookingNotifications extends StatefulWidget {
  const BookingNotifications({super.key});

  @override
  State<BookingNotifications> createState() => _BookingNotificationsState();
}

class _BookingNotificationsState extends State<BookingNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Biar AppBar nyatu sama background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
            fontWeight: FontWeight.w600,
            fontSize: 16,
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
                    child: const Text(
                      '3', // Ganti angka ini sesuai jumlah notifikasi
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
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

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, kToolbarHeight + 32, 16, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            NotificationCard(
              icon: Icons.notifications_active,
              iconColor: AppColors.green,
              iconBackgroundColor: Colors.green.shade100,
              title: 'Booking Confirmed',
              content:
                  'Your hotel booking at Grand Palace Hotel has been confirmed.',
              date: '2025-04-25',
              isRead: false,
            ),
            NotificationCard(
              icon: Icons.notifications,
              iconColor: AppColors.cadetGray,
              iconBackgroundColor: Colors.blue.shade100,
              title: 'Booking Completed',
              content: 'Your booking is now completed.',
              date: '2025-04-20',
              isRead: true,
            ),
            NotificationCard(
              icon: Icons.local_offer_outlined,
              iconColor: AppColors.orange,
              iconBackgroundColor: Colors.orange.shade100,
              title: 'Special Offer!',
              content: 'Get 20% off for your next booking. Don\'t miss out!',
              date: '2025-04-18',
              isRead: false,
            ),
            NotificationCard(
              icon: Icons.local_offer_outlined,
              iconColor: AppColors.orange,
              iconBackgroundColor: Colors.orange.shade100,
              title: 'Special Offer!',
              content: 'Get 20% off for your next booking. Don\'t miss out!',
              date: '2025-04-18',
              isRead: false,
            ),
            NotificationCard(
              icon: Icons.local_offer_outlined,
              iconColor: AppColors.orange,
              iconBackgroundColor: Colors.orange.shade100,
              title: 'Special Offer!',
              content: 'Get 20% off for your next booking. Don\'t miss out!',
              date: '2025-04-18',
              isRead: false,
            ),
            NotificationCard(
              icon: Icons.local_offer_outlined,
              iconColor: AppColors.orange,
              iconBackgroundColor: Colors.orange.shade100,
              title: 'Special Offer!',
              content: 'Get 20% off for your next booking. Don\'t miss out!',
              date: '2025-04-18',
              isRead: false,
            ),
            NotificationCard(
              icon: Icons.local_offer_outlined,
              iconColor: AppColors.orange,
              iconBackgroundColor: Colors.orange.shade100,
              title: 'Special Offer!',
              content: 'Get 20% off for your next booking. Don\'t miss out!',
              date: '2025-04-18',
              isRead: false,
            ),
            NotificationCard(
              icon: Icons.local_offer_outlined,
              iconColor: AppColors.orange,
              iconBackgroundColor: Colors.orange.shade100,
              title: 'Special Offer!',
              content: 'Get 20% off for your next booking. Don\'t miss out!',
              date: '2025-04-18',
              isRead: true,
            ),
          ],
        ),
      ),
    );
  }
}
