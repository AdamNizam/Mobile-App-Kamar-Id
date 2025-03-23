import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Widgets/custom_icon1_avaibility.dart';
import 'package:hotelbookingapp/Widgets/custom_icon2_avaibility.dart';

class CardAvailbility extends StatelessWidget {
  const CardAvailbility({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: AppColors.strokColor,
          width: 1.5,
        ),
      ),
      child: Container(
        width: 330,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "https://picsum.photos/400/300",
                width: 100,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            // Detail Kamar
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                    child: Row(
                      children: [
                        Text(
                          "Room 1",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "Rp2200",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.button2Color,
                          ),
                        ),
                        Text(
                          "/mlm",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CustomIcon1Avaibility(
                          icon: Icons.access_time, name: '50 m2'),
                      CustomIcon1Avaibility(
                          icon: Icons.airplanemode_on, name: 'x2'),
                      CustomIcon1Avaibility(
                          icon: Icons.vaping_rooms, name: 'x30'),
                      CustomIcon1Avaibility(
                          icon: Icons.breakfast_dining, name: 'Timer'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CustomIcon2Avaibility(
                        icon: Icons.access_time,
                      ),
                      CustomIcon2Avaibility(
                        icon: Icons.tv,
                      ),
                      CustomIcon2Avaibility(
                        icon: Icons.wifi,
                      ),
                      CustomIcon2Avaibility(
                        icon: Icons.local_cafe,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
