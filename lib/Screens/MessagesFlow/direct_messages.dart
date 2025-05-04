import 'package:flutter/material.dart';

import '../../CustomWidgets/customapp_bar.dart';
import '../../CustomWidgets/customtextfield.dart';
import '../../CustomWidgets/CustomText/detailstext1.dart';
import '../../CustomWidgets/CustomText/detailstext2.dart';
import '../../Themes/colors.dart';
import 'all_conversions.dart';
import 'search_message_screen.dart';

class DirectMessages extends StatelessWidget {
  const DirectMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: CustomAppBar(text: 'Messages', text1: ''),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const SearchMessagesScreen()),
                  );
                },
                child:
                    const CustomTextField(label: 'Search', icon: Icons.search),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildDirectMessage('Reception', 'images/c2.png'),
                  _buildDirectMessage('Housekeeping', 'images/c3.png'),
                  _buildDirectMessage('Concierge', 'images/c4.png'),
                  _buildDirectMessage('Maintenance', 'images/c5.png'),
                  _buildDirectMessage('Guest Services', 'images/c2.png'),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Text1(
                      text1: 'Recent Conversations',
                      size: 18,
                    ),
                  ),
                  _buildConversation(
                      context,
                      'Reception',
                      'Confirmation of your room booking...',
                      'images/c2.png',
                      '2:45 pm',
                      2),
                  _buildConversation(
                      context,
                      'Housekeeping',
                      'Request for extra towels',
                      'images/c3.png',
                      '2:30 pm',
                      1),
                  _buildConversation(
                      context,
                      'Concierge',
                      'Dinner reservation details',
                      'images/c4.png',
                      '2:15 pm',
                      0,
                      true),
                  _buildConversation(
                      context,
                      'Maintenance',
                      'Repair request update',
                      'images/c5.png',
                      '1:50 pm',
                      0,
                      true),
                  _buildConversation(
                      context,
                      'Guest Services',
                      'Inquiry about room amenities',
                      'images/c2.png',
                      '1:30 pm',
                      1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDirectMessage(String name, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 55,
              height: 55,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text1(text1: name),
        ],
      ),
    );
  }

  Widget _buildConversation(BuildContext context, String name, String message,
      String imagePath, String time,
      [int unreadCount = 0, bool isYourTurn = false]) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 9),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text1(text1: name),
        subtitle: Text2(text2: message),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (unreadCount > 0)
              CircleAvatar(
                radius: 12,
                backgroundColor: AppColors.text3Color,
                child: Text(
                  '$unreadCount',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            if (isYourTurn)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.tabColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Your turn',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            const SizedBox(height: 4),
            Text2(text2: time),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AllConversions()),
          );
        },
      ),
    );
  }
}
