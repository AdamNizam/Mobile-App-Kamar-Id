import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:image_picker/image_picker.dart';

Future<void> showSourceImageSelectionModal({
  required BuildContext context,
  required Function(ImageSource source) onImageSelected,
}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.white,
    elevation: 0,
    builder: (BuildContext context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Icons.camera_alt,
                  color: AppColors.buttonColor,
                ),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  onImageSelected(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color: AppColors.buttonColor,
                ),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  onImageSelected(ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
