import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Models/ChatModel/chat_message.dart';
import 'package:image_picker/image_picker.dart';

import '../../CustomWidgets/CustomText/text1.dart';
import '../../CustomWidgets/CustomText/text2.dart';
import '../../Themes/colors.dart';

class ChattingMessage extends StatelessWidget {
  const ChattingMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black45),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Image.asset(
              'images/user_default_profile.png',
              width: 30,
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text1(
                  text1: 'Admin Pandu Home Stay',
                ),
                Text2(
                  text2: 'Online',
                  size: 12,
                  color: AppColors.green, // Placeholder for online status
                ),
              ],
            ),
            const Spacer(),
            const Row(
              children: [
                Icon(
                  Icons.call,
                  color: AppColors.buttonColor,
                  size: 16,
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.video_call,
                  color: AppColors.buttonColor,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
      body: const ChatBody(),
    );
  }
}

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  File? _selectedImage;
  final ImagePicker imagePicker = ImagePicker();
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];

  Future<void> uploadImage(ImageSource source) async {
    final XFile? pickedFile = await imagePicker.pickImage(source: source);

    if (!mounted || pickedFile == null) return;

    setState(() {
      _selectedImage = File(pickedFile.path);
    });

    debugPrint('Location Path Image: ${pickedFile.path}');
  }

  void sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    final message = ChatMessage(
      text: text,
      isSender: true,
      time: TimeOfDay.now().format(context),
    );

    setState(() {
      _messages.add(message);
      _messageController.clear();
    });

    // Optional: Simulasi balasan otomatis
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        _messages.add(ChatMessage(
          text: 'Ini balasan otomatis.',
          isSender: false,
          time: TimeOfDay.now().format(context),
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.beauBlue, width: 0.5),
                bottom: BorderSide(color: AppColors.beauBlue, width: 0.5),
              ),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ChatBubble(
                  text: msg.text,
                  isSender: msg.isSender,
                  time: msg.time,
                );
              },
            ),
          ),
        ),
        Column(
          children: [
            if (_selectedImage != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        _selectedImage!,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black45,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: AppColors.white,
                            size: 18,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            setState(() {
                              _selectedImage = null;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        filled: true,
                        fillColor: AppColors.white,
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.attach_file,
                            color: AppColors.redAwesome,
                          ),
                          onPressed: () {
                            uploadImage(ImageSource.gallery);
                          },
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: AppColors.buttonColor,
                    child: IconButton(
                      onPressed: sendMessage,
                      icon: const Icon(
                        Icons.send,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final String time;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isSender,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            decoration: BoxDecoration(
              color: isSender ? AppColors.buttonColor : AppColors.white,
              border: Border.all(color: AppColors.beauBlue),
              borderRadius: isSender
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: isSender ? AppColors.white : AppColors.black,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            time,
            style: const TextStyle(color: AppColors.cadetGray, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
