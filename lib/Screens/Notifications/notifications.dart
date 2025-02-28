import 'package:flutter/material.dart';
import '../../../Constants/colors.dart';
import '../../../Widgets/detailstext1.dart';
import '../../../Widgets/detailstext2.dart';
import '../../../Widgets/text11.dart';

class BookingNotifications extends StatefulWidget {
  const BookingNotifications({super.key});

  @override
  State<BookingNotifications> createState() => _BookingNotificationsState();
}

class _BookingNotificationsState extends State<BookingNotifications> {
  final List<Map<String, dynamic>> _notifications = [
    {
      'icon': Icons.hotel,
      'iconColor': Colors.green,
      'iconBackgroundColor': Colors.green.shade100,
      'title': 'Booking Confirmed',
      'content': 'Your hotel booking at Grand Palace Hotel has been confirmed.'
    },
    {
      'icon': Icons.cleaning_services,
      'iconColor': Colors.blue,
      'iconBackgroundColor': Colors.blue.shade100,
      'title': 'Room Ready',
      'content': 'Your room at Oceanview Resort is now ready for check-in.'
    },
    {
      'icon': Icons.hotel_outlined,
      'iconColor': Colors.orange,
      'iconBackgroundColor': Colors.orange.shade100,
      'title': 'Check-out Reminder',
      'content': 'Your check-out from Sunshine Hotel is tomorrow at 12 PM.'
    },
    {
      'icon': Icons.dining,
      'iconColor': Colors.purple,
      'iconBackgroundColor': Colors.purple.shade100,
      'title': 'Dinner Reservation',
      'content': 'Your dinner reservation at Sky Lounge is confirmed for 7 PM.'
    },
    {
      'icon': Icons.cancel,
      'iconColor': Colors.red,
      'iconBackgroundColor': Colors.red.shade100,
      'title': 'Booking Cancelled',
      'content': 'Your booking at Riverside Hotel has been cancelled.'
    },
    {
      'icon': Icons.payment,
      'iconColor': Colors.teal,
      'iconBackgroundColor': Colors.teal.shade100,
      'title': 'Payment Received',
      'content': 'We have received your payment for the upcoming stay.'
    },
    {
      'icon': Icons.update,
      'iconColor': Colors.yellow,
      'iconBackgroundColor': Colors.yellow.shade100,
      'title': 'Booking Updated',
      'content': 'Your booking at City Suites has been updated with new check-in time.'
    },
    {
      'icon': Icons.support_agent,
      'iconColor': Colors.brown,
      'iconBackgroundColor': Colors.brown.shade100,
      'title': 'Customer Support',
      'content': 'Customer support has responded to your inquiry about your booking.'
    },
    {
      'icon': Icons.local_offer,
      'iconColor': Colors.amber,
      'iconBackgroundColor': Colors.amber.shade100,
      'title': 'Special Offer',
      'content': 'Enjoy 20% off on your next stay at Mountain View Hotel!'
    },
    {
      'icon': Icons.error,
      'iconColor': Colors.red,
      'iconBackgroundColor': Colors.red.shade100,
      'title': 'Payment Failed',
      'content': 'Your payment for the stay at Beachfront Inn failed. Please try again.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 5),
                _buildNotificationsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.text3Color),
          ),
          height: 30,
          width: 30,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 17,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        const Spacer(),
        const Text1(text1: 'Notifications'),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text11(text2: '2 New', color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildNotificationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text1(text1: 'Today'),
              Text11(text2: 'Mark all as read', color: AppColors.buttonColor),
            ],
          ),
        ),
        ..._buildNotifications(),
      ],
    );
  }

  List<Widget> _buildNotifications() {
    return List.generate(_notifications.length, (index) {
      final notification = _notifications[index];
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNotificationIcon(notification),
            const SizedBox(width: 10),
            _buildNotificationText(notification),
            const Padding(
              padding: EdgeInsets.only(top: 22),
              child: CircleAvatar(
                radius: 5,
                backgroundColor: Colors.deepOrange,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildNotificationIcon(Map<String, dynamic> notification) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: notification['iconBackgroundColor'],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(
        notification['icon'],
        size: 24,
        color: notification['iconColor'],
      ),
    );
  }

  Widget _buildNotificationText(Map<String, dynamic> notification) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text1(text1: notification['title']),
          Text2(text2: notification['content']),
        ],
      ),
    );
  }
}
