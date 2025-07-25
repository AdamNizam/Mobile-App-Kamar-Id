import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String title;
  final String content;
  final String date;
  final bool isRead;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.title,
    required this.content,
    required this.date,
    required this.isRead,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isRead ? AppColors.white : const Color(0xFFF2F9FF),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: isRead ? AppColors.beauBlue : AppColors.white,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 24,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextEllipsis(
                        text: title,
                        size: 12,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Text1(
                  text1: content,
                  color: AppColors.cadetGray,
                  fontWeight: FontWeight.w400,
                  size: 12,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      isRead ? Icons.done_all : Icons.check,
                      size: 16,
                      color:
                          isRead ? AppColors.doggerBlue : AppColors.cadetGray,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      date,
                      style: const TextStyle(
                        color: AppColors.cadetGray,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (!isRead)
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.redAwesome,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
