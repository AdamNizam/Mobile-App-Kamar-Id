import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Models/hotel/result_check_avaibility_model.dart';
import 'package:hotelbookingapp/Shared/custom_methods.dart';

class CustomIcon1Avaibility extends StatelessWidget {
  final Child data;
  const CustomIcon1Avaibility({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
          margin: const EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.amber,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Icon(
            getIcon(data.icon),
            size: 16,
            color: AppColors.button2Color,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        // Center(
        //   child: Text(
        //     data.title,
        //     style: const TextStyle(
        //       color: AppColors.tabColor,
        //       fontSize: 10,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
