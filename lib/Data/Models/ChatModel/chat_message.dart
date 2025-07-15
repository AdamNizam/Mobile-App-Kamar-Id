enum MessageStatus { sending, sent, failed }

class ChatMessage {
  final String text;
  final bool isSender;
  final String time;
  MessageStatus status;

  ChatMessage({
    required this.text,
    required this.isSender,
    required this.time,
    this.status = MessageStatus.sending,
  });
}
