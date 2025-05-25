import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/detailstext1.dart';

class DefaultValue extends StatelessWidget {
  final String imageSvg;
  final String text;
  const DefaultValue({
    super.key,
    required this.imageSvg,
    required this.text,
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
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 10),
          Text1(
            text1: text,
            size: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
