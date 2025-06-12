import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class DefaultValue extends StatelessWidget {
  final String imageSvg;
  final String text;
  final double? width;
  final double? height;
  const DefaultValue({
    super.key,
    required this.imageSvg,
    required this.text,
    this.height = 200,
    this.width = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imageSvg,
            semanticsLabel: text,
            width: width,
            height: height,
            fit: BoxFit.contain,
          ),
          Text1(
            text1: text,
            size: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }
}
