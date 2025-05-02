import 'package:flutter/material.dart';

import '../detailstext1.dart';

class CategoriesColumn extends StatelessWidget {
  final String image;
  final String text;
  const CategoriesColumn({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(
            height: 5,
          ),
          Text1(
            text1: text,
            size: 13,
          )
        ],
      ),
    );
  }
}
