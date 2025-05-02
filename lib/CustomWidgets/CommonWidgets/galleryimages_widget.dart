import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

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

  bool isNetworkImage(String path) {
    return path.startsWith('http') || path.startsWith('https');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? AppColors.buttonColor : AppColors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: isNetworkImage(imagePath)
                ? Image.network(
                    imagePath,
                    height: 60,
                    width: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.broken_image,
                      size: 60,
                      color: Colors.grey,
                    ),
                  )
                : Image.asset(
                    imagePath,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}
