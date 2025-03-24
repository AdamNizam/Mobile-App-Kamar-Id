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
            // Gambar kamar
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "https://picsum.photos/400/300", // Fallback image
                width: 105,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama Kamar dan Harga
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                    ),
                    child: Column(
                      children: [
                        Text(
                          data.title ?? "No-Data",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 2.0),
                    child: Row(
                      children: [
                        Text(
                          'Rp${data.price}',
                          style: const TextStyle(
                            fontSize: 13,
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
                  const Row(
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
