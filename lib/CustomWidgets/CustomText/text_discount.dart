import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class TextDiscount extends StatelessWidget {
  final String initialPrice;
  final double size;
  const TextDiscount({
    super.key,
    required this.initialPrice,
    this.size = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.redAwesome.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Rp$initialPrice',
            style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              decoration: TextDecoration.lineThrough,
              decorationColor: AppColors.black,
              decorationThickness: 1.2,
            ),
          ),
          Row(
            children: [
              Text1(
                text1: 'Diskon 45%',
                size: size,
                fontWeight: FontWeight.bold,
                color: AppColors.redAwesome,
              ),
              const Icon(
                Icons.discount,
                size: 16,
                color: AppColors.redAwesome,
              ),
            ],
          )
        ],
      ),
    );
  }
}
