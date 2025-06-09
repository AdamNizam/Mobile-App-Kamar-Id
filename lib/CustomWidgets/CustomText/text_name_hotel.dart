import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CommonWidgets/wishlist_widget.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class TextNameHotel extends StatelessWidget {
  final int idHotel;
  final String title;
  const TextNameHotel({
    super.key,
    required this.idHotel,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomTextEllipsis(
            text: title,
            color: AppColors.black,
            size: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 5),
        WishlistWidget(idHotel: idHotel),
      ],
    );
  }
}
