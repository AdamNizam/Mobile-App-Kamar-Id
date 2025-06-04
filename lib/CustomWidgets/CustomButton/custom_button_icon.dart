import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class CustomButtonIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  final VoidCallback onTap;

  const CustomButtonIcon({
    super.key,
    required this.icon,
    required this.size,
    required this.onTap,
    this.color = AppColors.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.white.withOpacity(0.8),
      child: IconButton(
        icon: Icon(
          icon,
          size: size,
          color: color,
        ),
        onPressed: onTap,
      ),
    );
  }
}
