import 'package:flutter/material.dart';

import '../../CustomWidgets/CustomBar/customapp_bar.dart';
import '../../CustomWidgets/CustomText/customtextfield.dart';
import '../../CustomWidgets/CustomText/text1.dart';
import '../../CustomWidgets/CustomText/text2.dart';
import '../../Themes/colors.dart';

class SearchMessagesScreen extends StatelessWidget {
  const SearchMessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 12),
              child: CustomAppBar(text: 'Search Messages', text1: ''),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                label: 'Search',
                icon: Icons.search,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildConversation(
                      'Event Organizer',
                      'Can you provide details about the event schedule?',
                      'images/c5.png',
                      '12:34 pm',
                      1),
                  _buildConversation(
                      'Participant 1',
                      'Will there be refreshments available?',
                      'images/c2.png',
                      '12:34 pm',
                      1),
                  _buildConversation(
                      'Speaker 1',
                      'Please confirm my speaking slot.',
                      'images/c3.png',
                      '12:34 pm',
                      0,
                      true),
                  _buildConversation(
                      'Attendee 1',
                      'What is the dress code for the event?',
                      'images/c4.png',
                      '12:34 pm',
                      0,
                      true),
                  _buildConversation(
                      'Event Coordinator',
                      'Please check the updated event agenda.',
                      'images/c5.png',
                      '12:34 pm',
                      1),
                  _buildConversation(
                      'Participant 2',
                      'Is there a parking facility available?',
                      'images/c3.png',
                      '12:34 pm',
                      1),
                  _buildConversation(
                      'Volunteer',
                      'I need instructions for my shift.',
                      'images/c2.png',
                      '12:34 pm',
                      0,
                      true),
                  _buildConversation(
                      'Sponsor',
                      'Can we discuss the sponsorship details?',
                      'images/c5.png',
                      '12:34 pm',
                      0,
                      true),
                  _buildConversation(
                      'Participant 3',
                      'How can I register for the workshops?',
                      'images/c4.png',
                      '12:34 pm',
                      1),
                  _buildConversation(
                      'Guest Speaker',
                      'Please confirm the event location.',
                      'images/c3.png',
                      '12:34 pm',
                      0,
                      true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConversation(
      String name, String message, String imagePath, String time,
      [int unreadCount = 0, bool isYourTurn = false]) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
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
      child: ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text1(text1: name),
        subtitle: Text2(text2: message),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (unreadCount > 0)
              CircleAvatar(
                radius: 12,
                backgroundColor: AppColors.buttonColor,
                child: Text('$unreadCount',
                    style: const TextStyle(color: Colors.white)),
              ),
            if (isYourTurn)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Your turn',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            const SizedBox(height: 4),
            Text(time, style: const TextStyle(color: Colors.grey)),
          ],
        ),
        onTap: () {
          // Navigate to conversation details screen
        },
      ),
    );
  }
}
