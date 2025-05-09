import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class CustomerServiceScreen extends StatefulWidget {
  const CustomerServiceScreen({super.key});

  @override
  State<CustomerServiceScreen> createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceScreen> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [];

  final List<String> _initialCategories = [
    'Why can’t I find the hotel I’m looking for?',
    'Hotel booking payment failed',
    'Unable to select or change payment method',
    'Hotel price changed during checkout',
    'My account cannot make a hotel reservation',
  ];

  final List<String> _moreCategories = [
    'I can’t log in to my account',
    'My payment keeps getting declined',
    'Hotel voucher not received after payment',
    'My hotel booking was automatically canceled',
  ];

  bool _showAllCategories = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      Future.delayed(const Duration(milliseconds: 400), () {
        _addCategoryMessage();
      });
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 120,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _addUserMessage(String text) {
    final userMsg = {'type': 'text', 'sender': 'user', 'message': text};
    _messages.add(userMsg);
    _listKey.currentState?.insertItem(_messages.length - 1);
    _scrollToBottom();
  }

  void _addCSMessage(String text) {
    final csMsg = {'type': 'text', 'sender': 'cs', 'message': text};
    _messages.add(csMsg);
    _listKey.currentState?.insertItem(_messages.length - 1);
    _scrollToBottom();
  }

  void _addCategoryMessage() {
    final categoryMsg = {
      'type': 'categories',
      'sender': 'cs',
      'categories': [..._initialCategories],
    };
    _messages.add(categoryMsg);
    _listKey.currentState?.insertItem(_messages.length - 1);
    _scrollToBottom();
  }

  void _expandCategories() {
    setState(() {
      _showAllCategories = true;
      int index = _messages.indexWhere((msg) => msg['type'] == 'categories');
      if (index != -1) {
        _messages[index]['categories'] = [
          ..._initialCategories,
          ..._moreCategories,
        ];
      }
    });
  }

  void _onCategorySelected(String category) {
    _addUserMessage(category);

    Future.delayed(const Duration(milliseconds: 600), () {
      _addCSMessage(
          'Thank You, Our customer service will reply to your message at 07:00 PM - 09:00 AM ');
    });
  }

  Widget _buildMessage(Map<String, dynamic> msg, Animation<double> animation) {
    if (msg['type'] == 'categories') {
      return SizeTransition(
        sizeFactor: animation,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.bgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Silakan klik pilihan di bawah ini, ya.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              ...msg['categories'].map<Widget>((cat) {
                return InkWell(
                  onTap: () => _onCategorySelected(cat),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.beauBlue,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text1(
                          text1: cat,
                          size: 14,
                          fontWeight: FontWeight.w400,
                        )),
                        const Icon(Icons.chevron_right, size: 20),
                      ],
                    ),
                  ),
                );
              }).toList(),
              if (!_showAllCategories)
                Center(
                  child: TextButton(
                    onPressed: _expandCategories,
                    child: const Text1(
                      text1: 'Selengkapnya',
                      color: AppColors.buttonColor,
                    ),
                  ),
                )
            ],
          ),
        ),
      );
    }

    bool isUser = msg['sender'] == 'user';
    return SizeTransition(
      sizeFactor: animation,
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isUser ? AppColors.buttonColor : AppColors.white,
            border: Border.all(
              color: AppColors.beauBlue,
            ),
            borderRadius: isUser
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
            text1: msg['message'],
            color: isUser ? AppColors.white : AppColors.black,
            size: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  void _sendTextMessage(String text) {
    if (text.trim().isEmpty) return;

    _addUserMessage(text);
    _controller.clear();

    Future.delayed(const Duration(milliseconds: 700), () {
      _addCSMessage('Terima kasih, kami akan bantu cek: "$text"');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppTopBar(
        title: 'Customer Serice',
        icon: Icons.support_agent,
        iconColor: AppColors.buttonColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedList(
              key: _listKey,
              controller: _scrollController,
              initialItemCount: _messages.length,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index, animation) {
                return _buildMessage(_messages[index], animation);
              },
            ),
          ),
          const Divider(height: 1),
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
                      suffixIcon: const Icon(
                        Icons.attach_file,
                        color: AppColors.redAwesome,
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
      ),
    );
  }
}
