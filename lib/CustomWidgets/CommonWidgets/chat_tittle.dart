import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/Screens/Messages/chatting_message.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String avatar;
  final int unreadCount;

  const ChatTile({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.avatar,
    this.unreadCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChattingMessage()),
        );
      },
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(avatar)),
        title: CustomTextEllipsis(
          text: name,
          size: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        subtitle: CustomTextEllipsis(
          text: message,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          size: 12,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text1(
              text1: time,
              size: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            if (unreadCount > 0)
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.redAwesome,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text1(
                  text1: unreadCount.toString(),
                  color: Colors.white,
                  size: 12,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
