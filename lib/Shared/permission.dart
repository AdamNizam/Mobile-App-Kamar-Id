import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermission() async {
  await Permission.camera.request();
  await Permission.photos.request();
}
