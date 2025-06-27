import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CommonWidgets/chat_tittle_widget.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/Providers/pusher_provider.dart'; // Gantilah ini jika nama file service kamu berbeda
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class MessageScreen extends StatefulWidget {
  final VoidCallback? onBack;
  const MessageScreen({super.key, this.onBack});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();

    // Daftarkan listener event dari PusherService
    PusherProvider.onMessageReceived = _handleIncomingMessage;

    // Inisialisasi koneksi Pusher
    _initPusher();
  }

  Future<void> _initPusher() async {
    await PusherProvider.initialize();
  }

  void _handleIncomingMessage(PusherEvent event) {
    if (event.data != null) {
      final data = jsonDecode(event.data!);
      setState(() {
        _messages.insert(0, {
          "name": data['name'] ?? 'Unknown',
          "message": data['message'] ?? '',
          "time": data['time'] ?? 'Now',
          "avatar": data['avatar'] ?? 'https://i.pravatar.cc/150?img=1',
          "unreadCount": 1,
        });
      });
    }
  }

  @override
  void dispose() {
    PusherChannelsFlutter.getInstance().disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppTopBar(
        title: 'Message',
        icon: Icons.more_vert,
        onPop: () {
          if (widget.onBack != null) {
            widget.onBack!();
          }
        },
        onTap: () {
          showCustomSnackbar(context, 'fitur is not available');
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search, size: 20),
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      const BorderSide(color: AppColors.beauBlue, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      const BorderSide(color: AppColors.beauBlue, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      const BorderSide(color: AppColors.amberColor, width: 1),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const ChatTile(
                  name: 'Admin Pandu Home Stay',
                  message: 'Thank you! 😊',
                  time: '7:12 AM',
                  unreadCount: 3,
                  avatar: 'https://i.pravatar.cc/150?img=1',
                ),
                const ChatTile(
                  name: 'Hotel Mandlika',
                  message: 'Yes! please take a order',
                  time: '9:28 AM',
                  avatar: 'https://i.pravatar.cc/150?img=2',
                ),
                const ChatTile(
                  name: 'Hotel Lakside Tuktuk',
                  message: 'I think this one is good',
                  time: '4:35 PM',
                  avatar: 'https://i.pravatar.cc/150?img=3',
                ),

                // Chat dari event Pusher
                for (var msg in _messages)
                  ChatTile(
                    name: msg['name'],
                    message: msg['message'],
                    time: msg['time'],
                    avatar: msg['avatar'],
                    unreadCount: msg['unreadCount'],
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
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}
