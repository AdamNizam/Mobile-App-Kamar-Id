import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

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
            Text1(
              text1: text,
              size: 14,
              fontWeight: FontWeight.w500,
            ),
            const Spacer(),
            Text1(
              text1: star.toString(),
              size: 14,
              fontWeight: FontWeight.w400,
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
