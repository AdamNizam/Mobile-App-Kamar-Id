import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomButton/custombtn.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/Shared/custom_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

void showFilterSelectionModal(BuildContext context) {
  bool ht = false;
  bool hr = false;
  bool hf = false;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.bgColor,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          24,
          20,
          MediaQuery.of(context).viewInsets.bottom,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.cadetGray,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTextEllipsis(
                      text: 'Hotel terdekat',
                      size: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    Transform.scale(
                      scale: 0.90,
                      child: Switch(
                        value: ht,
                        activeColor: AppColors.buttonColor,
                        inactiveTrackColor: AppColors.white,
                        inactiveThumbColor: AppColors.beauBlue,
                        onChanged: (value) {
                          setState(() {
                            ht = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTextEllipsis(
                      text: 'Hotel termurah',
                      size: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    Transform.scale(
                      scale: 0.90,
                      child: Switch(
                        value: hr,
                        activeColor: AppColors.buttonColor,
                        inactiveTrackColor: AppColors.white,
                        inactiveThumbColor: AppColors.beauBlue,
                        onChanged: (value) {
                          setState(() {
                            hr = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTextEllipsis(
                      text: 'Rating tertinggi',
                      size: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    Transform.scale(
                      scale: 0.90,
                      child: Switch(
                        value: hf,
                        activeColor: AppColors.buttonColor,
                        inactiveTrackColor: AppColors.white,
                        inactiveThumbColor: AppColors.beauBlue,
                        onChanged: (value) {
                          setState(() {
                            hf = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTextEllipsis(
                      text: 'Rating terendah',
                      size: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    Transform.scale(
                      scale: 0.90,
                      child: Switch(
                        value: hf,
                        activeColor: AppColors.buttonColor,
                        inactiveTrackColor: AppColors.white,
                        inactiveThumbColor: AppColors.beauBlue,
                        onChanged: (value) {
                          setState(() {
                            hf = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'Save',
                  onTap: () {
                    showCustomSnackbar(context, 'feature is not available');
                  },
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      );
    },
  );
}
