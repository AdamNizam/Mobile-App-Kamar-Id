import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CommonWidgets/chat_tittle.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppTopBar(
        title: 'Message',
        icon: Icons.more_vert,
        iconColor: AppColors.buttonColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search, size: 20),
                suffixIcon: const Icon(Icons.tune, size: 20),
                isDense: true, // membuat TextField lebih kecil
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: AppColors.beauBlue,
                  ), // tampilkan border
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: AppColors.beauBlue,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: AppColors.amberColor),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                ChatTile(
                  name: 'Admin Pandu Home Stay',
                  message: 'Thank you! 😊',
                  time: '7:12 AM',
                  unreadCount: 3,
                  avatar: 'https://i.pravatar.cc/150?img=1',
                ),
                ChatTile(
                  name: 'Lorena Farrell',
                  message: 'Yes! please take a order',
                  time: '9:28 AM',
                  avatar: 'https://i.pravatar.cc/150?img=2',
                ),
                ChatTile(
                  name: 'Amos Hessel',
                  message: 'I think this one is good',
                  time: '4:35 PM',
                  avatar: 'https://i.pravatar.cc/150?img=3',
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCustomSnackbar(context, 'fitur is not available');
        },
        backgroundColor: AppColors.buttonColor,
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
