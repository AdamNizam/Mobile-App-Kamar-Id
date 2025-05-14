import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/card_notification.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/Models/NotificationModel/result_notification.dart';
import 'package:hotelbookingapp/Shared/custom_methods.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Themes/colors.dart'; // Import NotificationCard

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
      appBar: CustomAppTopBar(
        title: 'Notification',
        icon: Icons.notifications_active,
        onPop: () {
          Navigator.pop(context);
        },
        onTap: () {
          showCustomSnackbar(context, 'fitur is not avaibale');
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, kToolbarHeight + 32, 16, 14),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text1(
                  text1: 'Unread message',
                  size: 13,
                  color: AppColors.cadetGray,
                ),
                const SizedBox(height: 2),
                const Divider(color: AppColors.strokColor, thickness: 1),
                if (widget.unreadData.dataNotif.isNotEmpty)
                  Column(
                    children: widget.unreadData.dataNotif
                        .map(
                          (dataNotif) => NotificationCard(
                            icon: Icons.notifications_active,
                            iconColor: AppColors.buttonColor,
                            iconBackgroundColor: Colors.blue.shade100,
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
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     const Text1(
            //       text1: 'Read message',
            //       size: 13,
            //       color: AppColors.cadetGray,
            //     ),
            //     const SizedBox(height: 2),
            //     const Divider(color: AppColors.strokColor, thickness: 1),
            //     Column(
            //       children: widget.readData.dataNotif
            //           .map(
            //             (dataNotif) => NotificationCard(
            //               icon: Icons.notifications_off,
            //               iconColor: AppColors.cadetGray,
            //               iconBackgroundColor: AppColors.bgColor,
            //               title: dataNotif.data.notification.name,
            //               content: dataNotif.data.notification.message,
            //               date: '${formatDateToYMD(dataNotif.createdAt)}',
            //               isRead: true,
            //             ),
            //           )
            //           .toList(),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
