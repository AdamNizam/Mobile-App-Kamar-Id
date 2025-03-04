import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

// Widget GalleryImage yang bisa diklik
class GalleryImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final bool isSelected;

  const GalleryImage({
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            // color: isSelected ? Colors.blueGrey[800] : Colors.transparent, // BG berubah saat dipilih
            border: Border.all(
              color: isSelected
                  ? AppColors.redAuburn
                  : Colors.white, // Border berubah warna
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: 60,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
