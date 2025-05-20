import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text_ellipsis.dart';

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
            semanticsLabel: 'serach image',
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 10),
          CustomTextEllipsis(
            text: text,
            size: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
