import 'package:flutter/material.dart';

import '../../../Widgets/detailstext1.dart';

class HomeWidgte extends StatelessWidget {
  const HomeWidgte({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (context) {
            return InkWell(
              onTap: (){
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(
                Icons.menu_outlined,
                color: Colors.white,

              ),
            );
          }
        ),
        const Text1(
          text1: 'Home',
          size: 16,
          color: Colors.white,
        ),
        Image.asset(
          'images/c3.png',
          width: 30,
        )
      ],
    );
  }
}
