import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Screens/ModalSelection/show_source_image_selection_modal.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
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

  Future<void> uploadImage(ImageSource source) async {
    final XFile? pickedFile = await imagePicker.pickImage(source: source);

    if (!mounted || pickedFile == null) return;

    setState(() {
      _selectedImage = File(pickedFile.path);
    });

    debugPrint('Location Path Image: ${pickedFile.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              // color: AppColors.white,
              border: Border(
                top: BorderSide(color: AppColors.beauBlue, width: 0.5),
                bottom: BorderSide(color: AppColors.beauBlue, width: 0.5),
              ),
            ),
            child: ListView(
              children: const [
                ChatBubble(
                  text: 'Hello, How are you today?',
                  isSender: true,
                  time: '09:30 am',
                ),
                ChatBubble(
                  text: 'I am fine , how about are you today?.',
                  isSender: false,
                  time: '09:31 am',
                ),
              ],
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
                            showSourceImageSelectionModal(
                              context: context,
                              onImageSelected: (source) {
                                uploadImage(source);
                              },
                            );
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
                      onPressed: () {
                        showCustomSnackbar(context, 'fitur is not available');
                      },
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
  final bool isVoiceMessage;
  final bool isFile;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isSender,
    required this.time,
    this.isVoiceMessage = false,
    this.isFile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (!isVoiceMessage)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              decoration: BoxDecoration(
                color: isSender ? AppColors.buttonColor : AppColors.white,
                border: Border.all(
                  color: AppColors.beauBlue,
                ),
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
              child: Text1(
                text1: text,
                size: 14,
                color: isSender ? AppColors.white : AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          if (isVoiceMessage)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 11),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                      radius: 16,
                      backgroundColor: Color(0xff000120),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      )),
                  const SizedBox(width: 10),
                  Image.asset(
                    'images/voice_message_icon.png', // Relevant icon for voice message
                    color: const Color(0xff000120),
                  )
                ],
              ),
            ),
          if (isFile)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 11),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.attach_file, color: Colors.blue),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: const TextStyle(color: Colors.blue),
                  )
                ],
              ),
            ),
          const SizedBox(
            height: 7,
          ),
          Text(
            time,
            style: const TextStyle(color: AppColors.cadetGray, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
