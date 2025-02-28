import 'package:flutter/material.dart';
import '../../Constants/colors.dart';
import '../../Widgets/detailstext1.dart';
import '../../Widgets/detailstext2.dart';
import 'no_messages.dart';

class AllConversions extends StatelessWidget {
  const AllConversions({super.key});

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
            Image.asset('images/c3.png', width: 40), // Image for hotel guest
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text1(
                  text1: 'Hotel Guest', // Placeholder for the guest's name
                ),
                Text2(
                  text2: 'Online', // Placeholder for online status
                ),
              ],
            ),
            const Spacer(),
            const Row(
              children: [
                Icon(
                  Icons.call,
                  color: AppColors.text3Color,
                  size: 16,
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.video_call,
                  color: AppColors.text3Color,
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

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Expanded(
          child: ListView(
            children: const [
              ChatBubble(
                text: 'I have a reservation for next weekend. Can I get a room upgrade?',
                isSender: true,
                time: '09:30 am',
              ),
              ChatBubble(
                text: 'We have a few rooms available. I’ll check the options for you.',
                isSender: false,
                time: '09:31 am',
              ),
              ChatBubble(
                text: 'What are the available options?',
                isSender: true,
                time: '09:33 am',
              ),
              ChatBubble(
                text: 'We have a suite available with a view. Would you like that?',
                isSender: false,
                time: '09:35 am',
              ),
              ChatBubble(
                text: 'Yes, that sounds perfect. Please confirm the upgrade.',
                isSender: true,
                time: '09:37 am',
              ),
              ChatBubble(
                text: 'I’ve confirmed the upgrade. You will receive a confirmation email shortly.',
                isSender: false,
                time: '09:38 am',
              ),
              ChatBubble(
                text: 'Thank you! Looking forward to the stay.',
                isSender: true,
                time: '09:40 am',
              ),
              ChatBubble(
                text: 'You’re welcome! See you soon.',
                isSender: false,
                time: '09:42 am',
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
                    fillColor: Colors.grey.shade200,
                    suffixIcon: const Icon(Icons.attach_file,
                        color: AppColors.text3Color),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: AppColors.tabColor,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const NoMessages()));
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
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
                color: isSender ? Colors.blue[50] : Colors.grey[100],
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
                style: const TextStyle(color: Colors.black),
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
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
