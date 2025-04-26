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
      'content': 'Your hotel booking at Grand Palace Hotel has been confirmed.',
      'date': '2025-04-25',
      'isRead': false,
    },
    {
      'icon': Icons.cleaning_services,
      'iconColor': Colors.blue,
      'iconBackgroundColor': Colors.blue.shade100,
      'title': 'Room Ready',
      'content': 'Your room at Oceanview Resort is now ready for check-in.',
      'date': '2025-04-24',
      'isRead': true,
    },
    {
      'icon': Icons.hotel_outlined,
      'iconColor': Colors.orange,
      'iconBackgroundColor': Colors.orange.shade100,
      'title': 'Check-out Reminder',
      'content': 'Your check-out from Sunshine Hotel is tomorrow at 12 PM.',
      'date': '2025-04-24',
      'isRead': false,
    },
    {
      'icon': Icons.dining,
      'iconColor': Colors.purple,
      'iconBackgroundColor': Colors.purple.shade100,
      'title': 'Dinner Reservation',
      'content': 'Your dinner reservation at Sky Lounge is confirmed for 7 PM.',
      'date': '2025-04-23',
      'isRead': true,
    },
    {
      'icon': Icons.cancel,
      'iconColor': Colors.red,
      'iconBackgroundColor': Colors.red.shade100,
      'title': 'Booking Cancelled',
      'content': 'Your booking at Riverside Hotel has been cancelled.',
      'date': '2025-04-23',
      'isRead': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> unreadNotifications =
        _notifications.where((n) => n['isRead'] == false).toList();
    List<Map<String, dynamic>> readNotifications =
        _notifications.where((n) => n['isRead'] == true).toList();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, unreadNotifications.length),
              const SizedBox(height: 16),
              if (unreadNotifications.isNotEmpty) ...[
                _buildSectionTitle('Unread'),
                const SizedBox(height: 8),
                ..._buildNotifications(unreadNotifications),
                const SizedBox(height: 20),
              ],
              if (readNotifications.isNotEmpty) ...[
                _buildSectionTitle('Earlier'),
                const SizedBox(height: 8),
                ..._buildNotifications(readNotifications),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, int unreadCount) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.text3Color),
          ),
          height: 32,
          width: 32,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.arrow_back,
              size: 18,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        const Spacer(),
        const Text1(text1: 'Notifications'),
        const Spacer(),
        if (unreadCount > 0)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text11(text2: '$unreadCount New', color: Colors.white),
          ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  List<Widget> _buildNotifications(List<Map<String, dynamic>> notifications) {
    return List.generate(notifications.length, (index) {
      final notification = notifications[index];
      final bool isUnread = !notification['isRead'];

      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUnread ? Color(0xFFF2F9FF) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNotificationIcon(notification),
            const SizedBox(width: 12),
            Expanded(child: _buildNotificationText(notification)),
            if (isUnread)
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      );
    });
  }

  Widget _buildNotificationIcon(Map<String, dynamic> notification) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: notification['iconBackgroundColor'],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        notification['icon'],
        size: 24,
        color: notification['iconColor'],
      ),
    );
  }

  Widget _buildNotificationText(Map<String, dynamic> notification) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text1(text1: notification['title']),
        const SizedBox(height: 4),
        Text2(text2: notification['content']),
        const SizedBox(height: 6),
        Text(
          _formatDate(notification['date']),
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  String _formatDate(String dateStr) {
    final date = DateTime.parse(dateStr);
    return "${date.day}/${date.month}/${date.year}";
  }
}
