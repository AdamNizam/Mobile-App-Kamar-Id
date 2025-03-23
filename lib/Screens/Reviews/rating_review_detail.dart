import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

class RatingReviewDetail extends StatelessWidget {
  final String text;
  final Color color;
  final double rate;
  final double star;

  const RatingReviewDetail({
    super.key,
    required this.text,
    required this.color,
    required this.rate,
    required this.star,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              star.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.star,
              color: color,
              size: 16,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(55),
          child: LinearProgressIndicator(
            value: rate,
            minHeight: 8,
            valueColor: const AlwaysStoppedAnimation(AppColors.tabColor),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
