import 'package:flutter/material.dart';
import '../../Widgets/customapp_bar.dart';
import '../../Widgets/detailstext1.dart';
import '../../Widgets/detailstext2.dart';

class ArchivedMessagesScreen extends StatelessWidget {
  const ArchivedMessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: CustomAppBar(
                text: 'Archived Messages',
                text1: '',
              ),
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Text1(
                      text1: 'Archived Conversations',
                      size: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _buildConversation(
                    'Guest 1',
                    'Thanks for the great stay!',
                    'images/c2.png',
                    '1 day ago',
                  ),
                  _buildConversation(
                    'Guest 2',
                    'Booking confirmed .',
                    'images/c3.png',
                    '2 days ago',
                  ),
                  _buildConversation(
                    'Guest 3',
                    'Amazing service!',
                    'images/c4.png',
                    '3 days ago',
                  ),
                  _buildConversation(
                    'Guest 4',
                    'Can I reschedule my booking?',
                    'images/c5.png',
                    '4 days ago',
                  ),
                  _buildConversation(
                    'Guest 5',
                    'Quick service, thanks!',
                    'images/c2.png',
                    '5 days ago',
                  ),
                  _buildConversation(
                    'Guest 6',
                    'Can I change my room package?',
                    'images/c3.png',
                    '6 days ago',
                  ),
                  _buildConversation(
                    'Guest 7',
                    'Is there a delay in the check-in process?',
                    'images/c4.png',
                    '7 days ago',
                  ),
                  _buildConversation(
                    'Guest 8',
                    'Thanks for fixing the issue promptly.',
                    'images/c5.png',
                    '8 days ago',
                  ),
                  _buildConversation(
                    'Guest 9',
                    'Looking forward to my next stay!',
                    'images/c2.png',
                    '9 days ago',
                  ),
                  _buildConversation(
                    'Guest 10',
                    'Service quality is excellent!',
                    'images/c3.png',
                    '10 days ago',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConversation(
      String name, String message, String imagePath, String time) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 25,
        ),
        title: Text1(
          text1: name,
          fontWeight: FontWeight.bold,
        ),
        subtitle: Text2(text2: message),
        trailing: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text2(text2: time),
        ),
        onTap: () {
          // Handle conversation tap
        },
      ),
    );
  }
}
