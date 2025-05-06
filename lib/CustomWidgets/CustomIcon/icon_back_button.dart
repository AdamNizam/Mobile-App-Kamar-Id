import 'package:flutter/material.dart';

class IconBackButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const IconBackButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white.withOpacity(0.8),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onTap,
      ),
    );
  }
}
