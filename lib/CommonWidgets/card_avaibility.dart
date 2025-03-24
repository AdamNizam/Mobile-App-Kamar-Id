import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Models/hotel/result_check_avaibility_model.dart';
import 'package:hotelbookingapp/Widgets/custom_icon1_avaibility.dart';
import 'package:hotelbookingapp/Widgets/custom_icon2_avaibility.dart';

class CardAvailbility extends StatelessWidget {
  final Room data;

  const CardAvailbility({
    super.key,
    required this.data,
  });

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
        padding: const EdgeInsets.all(4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: (data.image != false && data.image.isNotEmpty)
                  ? Image.network(
                      data.image,
                      width: 105,
                      height: 135,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(
                      width: 105,
                      height: 135,
                      child: Icon(
                        Icons.image,
                        size: 105,
                        color: AppColors.strokColor,
                      ),
                    ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Column(
                      children: [
                        Text(
                          data.title ?? "No-Data",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Row(
                      children: [
                        Text(
                          'Rp${data.price}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightBlue,
                          ),
                        ),
                        const Text(
                          "/mlm",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      CustomIcon1Avaibility(
                        icon: Icons.access_time,
                        name: '50 m2',
                      ),
                      CustomIcon1Avaibility(
                        icon: Icons.airplanemode_on,
                        name: 'x2',
                      ),
                      CustomIcon1Avaibility(
                        icon: Icons.vaping_rooms,
                        name: 'x30',
                      ),
                      CustomIcon1Avaibility(
                        icon: Icons.breakfast_dining,
                        name: 'Timer',
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                      children: data.termFeatures!.map(
                    (data) {
                      return CustomIcon2Avaibility(data: data);
                    },
                  ).toList()),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
