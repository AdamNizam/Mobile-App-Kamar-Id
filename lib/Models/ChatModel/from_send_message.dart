import 'package:image_picker/image_picker.dart';

class FormSendMessage {
  final XFile? file;
  final int id;
  final String type;
  final String message;
  final String temporaryMsgId;

  FormSendMessage({
    this.file,
    required this.id,
    required this.type,
    required this.message,
    required this.temporaryMsgId,
  });
}
