import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomButtonLoading extends StatelessWidget {
  final double? width;
  const CustomButtonLoading({
    super.key,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.amberColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: LoadingAnimationWidget.fourRotatingDots(
          color: AppColors.white,
          size: 27,
        ),
      ),
    );
  }
}
